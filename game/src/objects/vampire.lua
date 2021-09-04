Vampire = Engine:EntityClass('Vampire')

_G.VampireStage = {
    Wakeup = 1,
    Idle = 2,
    Alerted = 3,
}

local vampireWakeupDelay = 1.0
local vampireIdleDelay = 0.3
local vampireAlertDelay = 1.0

function Vampire:setup(data)
    --self.renderDepth = 11
    self.image = Engine:getAsset('art/vampire.png')

    BasicEntSetup(self, data)

    self.stage = util.default(self.stage, VampireStage.Wakeup)
    self.stageChangeTime = self.stageChangeTime or GAMETIME
    self.lastMoveTime = self.lastMoveTime or GAMETIME
    self.moveGoal = self.moveGoal or nil
end

function Vampire:update(time, dt)
    local updateMoveGoal = function()
        if WORLD:canSee(self:getPos(), GAMESTATE.player:getPos()) then
            self.moveGoal = GAMESTATE.player:getPos()
            return true
        end
        return false
    end

    if self.stage == VampireStage.Wakeup then
        if GAMETIME > self.stageChangeTime + vampireWakeupDelay then
            self.stage = VampireStage.Idle
        end
    elseif self.stage == VampireStage.Idle then
        if GAMETIME > self.stageChangeTime + vampireIdleDelay then
            if updateMoveGoal() then
                self.stage = VampireStage.Alerted
                self.stageChangeTime = GAMETIME
                print('-> ALERT')
            end
        end
    elseif self.stage == VampireStage.Alerted then
        if WORLD:canSee(self:getPos(), GAMESTATE.player:getPos()) then
            self.moveGoal = GAMESTATE.player:getPos()
        end

        if GAMETIME < self.stageChangeTime + vampireAlertDelay then
            --
        elseif GAMETIME > self.lastMoveTime + 5 * ONETICK then
            self.lastMoveTime = GAMETIME
            local stop = false
            if self:getPos():dist(self.moveGoal) < 1 then
                stop = true
            else
                local movePoints = WORLD:getLineMovePath(self:getPos(), self.moveGoal)
                if #movePoints >= 2 then
                    local nextCell = WORLD:getCell(movePoints[2])
                    if nextCell:traversableTest(self) then
                        self:setPos(movePoints[2])
                    else
                        stop = true
                    end
                else
                    stop = true
                end
            end
            if stop then
                if not updateMoveGoal() then
                    self.stage = VampireStage.Idle
                    self.stageChangeTime = GAMETIME
                    print('-> IDLE')
                    self.moveGoal = nil
                end
            end
        end
    end
end

function Vampire:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)

    if self.stage == VampireStage.Wakeup then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.print('?', 0.32, -1, 0, 0.07, 0.07)
    elseif self.stage == VampireStage.Alerted and GAMETIME < self.stageChangeTime + vampireAlertDelay then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.print('!', 0.35, -1, 0, 0.07, 0.07)
    end
end


