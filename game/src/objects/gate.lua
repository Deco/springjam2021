Gate = Engine:EntityClass('Gate')

local bombSize = 0.15

function Gate:setup(data)
    self.image = Engine:getAsset('art/gate.png')
    self.logicGroupIdx = data.logicGroupIdx

    BasicEntSetup(self, data)
end

function Gate:isLocked()
    local logicGroup = WORLD:getLogicGroup(self.logicGroupIdx)
    for _, input in ipairs(logicGroup) do
        if input.hasBeenTriggered then
            return false
        end
    end
    return true
end

function Gate:render()
    love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupIdx).color))
    DrawSimpleEntImage(self, self.image)
end


