Gate = Engine:EntityClass('Gate')

function Gate:setup(data)
    self.imageClosed = Engine:getAsset('art/gate.png')
    self.imageOpen = Engine:getAsset('art/gate_open.png')
    self.logicGroupName = data.logicGroupName

    self._isLocked = true
    self.mode = data.mode

    BasicEntSetup(self, data)
end

function Gate:blocksTraversal() return self:isLocked() end
function Gate:blocksVision() return self:isLocked() end
function Gate:blocksLight() return self:isLocked() end

function Gate:onLogicGroupUpdate(allSatisfied, anySatisfied)
    local wasLocked = self._isLocked
    local shouldBeOpen
    if self.mode == "AND" then
        shouldBeOpen = allSatisfied
    elseif self.mode == "NAND" then
        shouldBeOpen = not allSatisfied
    elseif self.mode == "OR" then
        shouldBeOpen = anySatisfied
    elseif self.mode == "NAND" then
        shouldBeOpen = not anySatisfied
    end
    self._isLocked = not shouldBeOpen
    WORLD:refreshLight()
    return self._isLocked ~= wasLocked
end

function Gate:isLocked() return self._isLocked end

function Gate:render()
    love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupName).color))
    DrawSimpleEntImage(self, self:isLocked() and self.imageClosed or self.imageOpen)
end


