Gate = Engine:EntityClass('Gate')

function Gate:setup(data)
    self.imageClosed = Engine:getAsset('art/gate.png')
    self.imageOpen = Engine:getAsset('art/gate_open.png')
    self.logicGroupName = data.logicGroupName

    BasicEntSetup(self, data)
end

function Gate:blocksTraversal() return self:isLocked() end
function Gate:blocksVision() return self:isLocked() end
function Gate:blocksLight() return self:isLocked() end

function Gate:isLocked()
    local logicGroup = WORLD:getLogicGroup(self.logicGroupName)
    local anyUnsatisfied = false
    for _, input in ipairs(logicGroup.inputsList) do
        if not input:considerSatisfied() then
            anyUnsatisfied = true
        end
    end
    return anyUnsatisfied
end

function Gate:render()
    love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupName).color))
    DrawSimpleEntImage(self, self:isLocked() and self.imageClosed or self.imageOpen)
end


