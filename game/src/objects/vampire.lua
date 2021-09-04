Vampire = Engine:EntityClass('Vampire')

_G.VampireStage = {
    Wakeup = 1,
    Idle = 2,
    Alerted = 3,
    Dying = 4,
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
end

function Vampire:blocksTraversal() return self.stage ~= VampireStage.Dying end
function Vampire:blocksVision() return false end
function Vampire:blocksLight() return self.stage ~= VampireStage.Dying end
function Vampire:activatesFloorSensors() return self.stage ~= VampireStage.Dying end

function Vampire:update(time, dt)
    if self.stage ~= VampireStage.Dying and WORLD:getCell(self:getPos()):isIlluminated() then
        self.stage = VampireStage.Dying
        self.stageChangeTime = GAMETIME
        WORLD:refreshLight()
        self:retouchy(WORLD:getCell(self:getPos()), WORLD:getCell(self:getPos()))
    end

    local updateMoveGoal = function()
        if GAMETIME < self.lastPathingTime + 0.1 then return nil end
        self.lastPathingTime = GAMETIME

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
        return false
    end

    if self.stage == VampireStage.Wakeup then
        if GAMETIME > self.stageChangeTime + vampireWakeupDelay then
            self.stage = VampireStage.Idle
        end
    end
    if self.stage == VampireStage.Idle then
        if GAMETIME > self.stageChangeTime + vampireIdleDelay then
            if updateMoveGoal() == true then
                self.stage = VampireStage.Alerted
                self.stageChangeTime = GAMETIME
                --print('-> ALERT')
            end
        end
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
                if updateMoveGoal() == false then
                    self.stage = VampireStage.Idle
                    self.stageChangeTime = GAMETIME
                    --print('-> IDLE')
                    self.movePath = nil
                end
            end
        end
    end
    if self.stage == VampireStage.Dying then
        self.renderDepth = RenderingDepth.VampireDead
    end
end

function Vampire:render()
    if self.stage == VampireStage.Dying and GAMETIME > self.stageChangeTime + vampireDyingDelay then
        DrawSimpleEntImage(self, self.dustImage)
    else
        love.graphics.setColor(1, 1, 1, 1)
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

