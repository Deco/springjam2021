BoulderRound = Engine:EntityClass('BoulderRound')

function BoulderRound:setup(data)
    self._states = {
        STATIONARY = 1,
        ROLLING = 2
    }
    self.image = Engine:getAsset('art/boulder_round.png')
    self.state = self.state or self._states.STATIONARY
    self.rollingDir = self.rollingDir or nil
    self.lastMoveTime = self.lastMoveTime or 0
    BasicEntSetup(self, data)
end

function BoulderRound:blocksTraversal() return true end
function BoulderRound:blocksVision() return true end
function BoulderRound:blocksLight() return true end
function BoulderRound:isMovable() return true end
function BoulderRound:activatesFloorSensors() return true end

function BoulderRound:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end
function BoulderRound:update()
    if self.rollingDir ~= nil and GAMETIME > self.lastMoveTime + 2 * ONETICK then
        if not self:tryMove(self.rollingDir) then self.rollingDir = nil end
        self.lastMoveTime = GAMETIME
    end
end

function BoulderRound:onShoved(dir, other)
    self.rollingDir = dir
end