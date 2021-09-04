Gate = Engine:EntityClass('Gate')

function Gate:setup(data)
    self.imageClosed = Engine:getAsset('art/gate.png')
    self.imageOpen = Engine:getAsset('art/gate_open.png')
    self.logicGroupIdx = data.logicGroupIdx
    self.blocksTraversal = true

    BasicEntSetup(self, data)
end

function Gate:isLocked()
    local logicGroup = WORLD:getLogicGroup(self.logicGroupIdx)
    local anyUnsatisfied = false
    for _, input in ipairs(logicGroup.inputsList) do
        if not input:considerSatisfied() then
            anyUnsatisfied = true
        end
    end
    return anyUnsatisfied
end

function Gate:render()
    love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupIdx).color))
    DrawSimpleEntImage(self, self:isLocked() and self.imageClosed or self.imageOpen)
end


