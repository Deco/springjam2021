PressurePlate = Engine:EntityClass('PressurePlate')

local bombSize = 0.15

function PressurePlate:setup(data)
    self.image = Engine:getAsset('art/pressure-plate.png')
    self.logicGroupIdx = data.logicGroupIdx

    BasicEntSetup(self, data)
end

function PressurePlate:render()
    love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupIdx).color))
    DrawSimpleEntImage(self, self.image)
end


