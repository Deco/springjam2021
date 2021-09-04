Gate = Engine:EntityClass('Gate')

function Gate:setup(data)
    self.imageClosed = Engine:getAsset('art/gate.png')
    self.imageOpen = Engine:getAsset('art/gate_open.png')
    self.logicGroupName = data.logicGroupName

    self._isLocked = true

    BasicEntSetup(self, data)
end

function Gate:blocksTraversal() return self:isLocked() end
function Gate:blocksVision() return self:isLocked() end
function Gate:blocksLight() return self:isLocked() end

function Gate:onLogicGroupUpdate(isSatisfied)
    self._isLocked = not isSatisfied
    WORLD:refreshLight()
end

function Gate:isLocked() return self._isLocked end

function Gate:render()
    love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupName).color))
    DrawSimpleEntImage(self, self:isLocked() and self.imageClosed or self.imageOpen)
end


