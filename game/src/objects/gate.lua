Gate = Engine:EntityClass('Gate')

local bombSize = 0.15

function Gate:setup(data)
    self.imageClosed = Engine:getAsset('art/gate.png')
    self.imageOpen = Engine:getAsset('art/gate_open.png')
    self.logicGroupIdx = data.logicGroupIdx

    BasicEntSetup(self, data)
end

function Gate:isLocked()
    local logicGroup = WORLD:getLogicGroup(self.logicGroupIdx)
    for _, input in ipairs(logicGroup.inputsList) do
        if input.hasBeenTriggered then
            return false
        end
    end
    return true
end

function Gate:render()
    love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupIdx).color))
    DrawSimpleEntImage(self, self:isLocked() and self.imageClosed or self.imageOpen)
end


