Vampire = Engine:EntityClass('Vampire')

_G.VampireStage = {
    Wakeup = 1,
    Idle = 2,
    Alerted = 3,
    Dying = 4,
    Dust = 5,
}

local vampireWakeupDelay = 1.0
local vampireIdleDelay = 0.3
local vampireAlertDelay = 1.0
local vampireDyingDelay = 1.0

function Vampire:setup(data)
    self.renderDepth = RenderingDepth.VampireAlive
    self.image = Engine:getAsset('art/vampire.png')
    self.dustImage = Engine:getAsset('art/dust.png')

    BasicEntSetup(self, data)

    self.stage = util.default(self.stage, data.startIdle and VampireStage.Idle or VampireStage.Wakeup)
    self.stageChangeTime = self.stageChangeTime or GAMETIME
    self.lastMoveTime = self.lastMoveTime or GAMETIME
    self.movePath = self.movePath or nil
    self.lastPathingTime = self.lastPathingTime or GAMETIME
    --self.nextBurpTime = self.nextBurpTime or GAMETIME + math.random(30, 45)
end

function Vampire:blocksTraversal() return self.stage ~= VampireStage.Dust end
function Vampire:blocksVision() return false end
function Vampire:blocksLight() return true end
function Vampire:activatesFloorSensors() return true end

function Vampire:update(time, dt)
    if self.stage ~= VampireStage.Dying and self.stage ~= VampireStage.Dust and WORLD:getCell(self:getPos()):isIlluminated() then
        self.stage = VampireStage.Dying
        self.stageChangeTime = GAMETIME
        EmitSound('sfx/Beans.ogg', self)
        EmitSound('sfx/Vampire_Death.ogg', self)
    end

    local updateMoveGoal = function(force)
        local fuckingSlow = self:getPos():dist(GAMESTATE.player:getPos()) > 6 and 0.25 or 0.1
        if not force and GAMETIME < self.lastPathingTime + fuckingSlow then
            return nil
        end
        self.lastPathingTime = GAMETIME

        if GAMESTATE.player.alive then
            if WORLD:canSee(self:getPos(), GAMESTATE.player:getPos(), self) then
                local moveGoal = GAMESTATE.player:getPos()
                local path = WORLD:pathFind(self:getPos(), moveGoal, self, function(me, targetCell)
                    if #targetCell:getBreakables(me) > 0 then return true end
                end)
                if path then
                    path = util.map(path, function(cell) return cell.pos end)
                    table.remove(path, 1)
                else
                    path = WORLD:getLineMovePath(self:getPos(), moveGoal, self)
                    table.remove(path, 1)
                end
                self.movePath = path
                return true
            end
        else

        end
        return false
    end

    if self.stage == VampireStage.Wakeup then
        if GAMETIME > self.stageChangeTime + vampireWakeupDelay then
            self.stage = VampireStage.Idle
            --self.nextBurpTime = GAMETIME + math.random(9.0, 15.0)
        end
    end
    if self.stage == VampireStage.Idle then
        if GAMETIME > self.stageChangeTime + vampireIdleDelay then
            if updateMoveGoal() == true then
                self.stage = VampireStage.Alerted
                self.stageChangeTime = GAMETIME
                print('-> ALERT')
                EmitSound('sfx/Beans.ogg', self)
                EmitSound('sfx/Vamp_Alert-00.ogg', self)
            end
        end
        --if not self.nextBurpTime or GAMETIME > self.nextBurpTime then
        --    self.nextBurpTime = GAMETIME + math.random(7.0, 11.0)
        --    EmitSound('sfx/burp.wav', self, { pitch = math.random(0.45, 1.0) })
        --end
    end
    if self.stage == VampireStage.Alerted then
        updateMoveGoal()

        if GAMETIME < self.stageChangeTime + vampireAlertDelay then
            --
        elseif GAMETIME > self.lastMoveTime + 5 * ONETICK then
            self.lastMoveTime = GAMETIME
            local stop = false
            if #self.movePath == 0 then
                stop = true
            else
                local nextPos = table.remove(self.movePath, 1)
                local nextCell = WORLD:getCell(nextPos)
                for _, breakable in ipairs(nextCell:getBreakables(self)) do
                    breakable:makeBroke()
                end
                if nextCell:traversalPassTest(self) then
                    self:setPos(nextPos)
                else
                    stop = true
                end
            end
            if stop then
                if updateMoveGoal(true) == false then
                    --self.nextBurpTime = GAMETIME + math.random(9.0, 15.0)
                    self.stage = VampireStage.Idle
                    self.stageChangeTime = GAMETIME
                    print('-> IDLE')
                    self.movePath = nil
                end
            end
        end
    end
    if self.stage == VampireStage.Dying and GAMETIME > self.stageChangeTime + vampireDyingDelay then
        self.stage = VampireStage.Dust
        self.stageChangeTime = GAMETIME
        self.renderDepth = RenderingDepth.VampireDead
        WORLD:refreshLight()
        self:retouchy(WORLD:getCell(self:getPos()), WORLD:getCell(self:getPos()))
    end
end

function Vampire:render()
    love.graphics.setColor(1, 1, 1, 1)
    if self.stage == VampireStage.Dust then
        DrawSimpleEntImage(self, self.dustImage)
    else
        DrawSimpleEntImage(self, self.image)

        if self.stage == VampireStage.Wakeup then
            love.graphics.setColor(1, 0, 0, 1)
            love.graphics.print('?', 0.32, -1, 0, 0.07, 0.07)
        elseif self.stage == VampireStage.Alerted and GAMETIME < self.stageChangeTime + vampireAlertDelay then
            love.graphics.setColor(1, 0, 0, 1)
            love.graphics.print('!', 0.35, -1, 0, 0.07, 0.07)
        elseif self.stage == VampireStage.Dying then
            love.graphics.setColor(1, 0, 0, 1)
            love.graphics.print('!!!', 0, -1, 0, 0.07, 0.07)
        end
    end
end

