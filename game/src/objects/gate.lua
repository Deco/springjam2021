Gate = Engine:EntityClass('Gate')

local bombSize = 0.15

function Gate:setup(data)
    self.image = Engine:getAsset('art/gate.png')
    self.logicGroupIdx = data.logicGroupIdx

    BasicEntSetup(self, data)
end

function Gate:render()
    love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupIdx).color))
    DrawSimpleEntImage(self, self.image)
end


