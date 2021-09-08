Vampire = Engine:EntityClass('Vampire')

_G.VampireStage = {
    Wakeup = 1,
    Idle = 2,
    Alerted = 3,
    Dying = 4,
    Dust = 5,
}

local vampireWakeupDelay = 1.0
local vampireAlertDelay = 1.15
local vampireDyingDelay = 1.0

function Vampire:setup(data)
    self.renderDepth = RenderingDepth.VampireAlive
    self.leftImage = Engine:getAsset('art/vampire_left.png')
    self.rightImage = Engine:getAsset('art/vampire.png')
    self.dustImage = Engine:getAsset('art/dust.png')

    BasicEntSetup(self, data)

    self.stage = util.default(self.stage, data.startIdle and VampireStage.Idle or VampireStage.Wakeup)
    self.stageChangeTime = self.stageChangeTime or GAMETIME
    self.lastMoveTime = self.lastMoveTime or GAMETIME
    self.lastHorzMoveDir = self.lastHorzMoveDir or util.random({ Cardinal.Left, Cardinal.Right })

    self.moveGoal = self.moveGoal or nil
    self.movePath = self.movePath or nil
    self.lastPathingTime = self.lastPathingTime or GAMETIME

    --self.nextBurpTime = self.nextBurpTime or GAMETIME + math.random(30, 45)
end

function Vampire:blocksTraversal() return self.stage ~= VampireStage.Dust end
function Vampire:blocksVision() return false end
function Vampire:blocksLight() return false end
function Vampire:activatesFloorSensors() return true end

function Vampire:update(time, dt)
    if self.stage ~= VampireStage.Dying and self.stage ~= VampireStage.Dust and WORLD:getCell(self:getPos()):isIlluminated() then
        self.stage = VampireStage.Dying
        self.stageChangeTime = GAMETIME
        EmitSound('sfx/Beans.ogg', self)
        EmitSound('sfx/Vampire_Death.ogg', self)
    end

    local updateMoveGoal = function()
        local canSee
        if GAMESTATE.player.alive and WORLD:canSee(self:getPos(), GAMESTATE.player:getPos(), self) then
            self.moveGoal = GAMESTATE.player:getPos()
            canSee = true
        end

        if self.moveGoal and (self.movePath == nil or GAMETIME > self.lastPathingTime + 0.2 + 0.02 * math.random()) then
            self.lastPathingTime = GAMETIME
            local path = WORLD:pathFind(self:getPos(), self.moveGoal, self, function(me, targetCell)
                if #targetCell:getBreakables(me) > 0 then return true end
            end)
            if path then
                path = util.map(path, function(cell) return cell.pos end)
            else
                path = WORLD:getLineMovePath(self:getPos(), self.moveGoal, self)
            end
            table.remove(path, 1) -- path includes our current spot, so remove it
            self.movePath = path
        end
        return canSee
    end

    if self.stage == VampireStage.Wakeup then
        if GAMETIME > self.stageChangeTime + vampireWakeupDelay then
            self.stage = VampireStage.Idle
            --self.nextBurpTime = GAMETIME + math.random(9.0, 15.0)
        end
    end
    if self.stage == VampireStage.Idle then
        updateMoveGoal()
        if self.moveGoal ~= nil then
            self.lastHorzMoveDir = self.moveGoal.x < self:getPos().x and Cardinal.Left or Cardinal.Right
            self.stage = VampireStage.Alerted
            self.stageChangeTime = GAMETIME
            EmitSound('sfx/Beans.ogg', self)
            EmitSound('sfx/Vamp_Alert-00.ogg', self)
        end
        --elseif not self.nextBurpTime or GAMETIME > self.nextBurpTime then
        --    self.nextBurpTime = GAMETIME + math.random(7.0, 11.0)
        --    EmitSound('sfx/burp.wav', self, { pitch = math.random(0.45, 1.0) })
        --end
    end
    if self.stage == VampireStage.Alerted then
        if GAMETIME < self.stageChangeTime + vampireAlertDelay then
            --
        elseif GAMETIME > self.lastMoveTime + 5 * ONETICK then
            local canSee = updateMoveGoal()

            if #self.movePath > 0 then
                local nextPos = table.remove(self.movePath, 1)
                local nextCell = WORLD:getCell(nextPos)
                for _, breakable in ipairs(nextCell:getBreakables(self)) do
                    breakable:makeBroke(self)
                end
                if nextCell:traversalPassTest(self) then
                    local currPos = self:getPos()
                    if nextPos.x ~= currPos.x then
                        self.lastHorzMoveDir = nextPos.x < currPos.x and Cardinal.Left or Cardinal.Right
                    end
                    self:setPos(nextPos)
                    EmitSound({
                        'sfx/slap-01.ogg',
                        'sfx/slap-02.ogg',
                        'sfx/slap-03.ogg',
                        'sfx/slap-04.ogg',
                    }, self, { pitch = util.randomRange(0.9, 1.1), })
                    self.lastMoveTime = GAMETIME
                end
            else
                if canSee then
                    -- stay alert, but we can't reach our target so stay still
                else
                    -- reached our goal and we can't see the player, so return to idle
                    self.stage = VampireStage.Idle
                    self.stageChangeTime = GAMETIME
                    print('-> IDLE')
                    self.moveGoal = nil
                    self.movePath = nil
                    --self.nextBurpTime = GAMETIME + math.random(9.0, 15.0)
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
        DrawSimpleEntImage(self, self.lastHorzMoveDir == Cardinal.Left and self.leftImage or self.rightImage)

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

