Crate = Engine:EntityClass('Crate')

local crateSize = 0.2

function Crate:setup(data)
    self.image = Engine:getAsset('art/crate.png')
    BasicEntSetup(self, util.mergeTables({
        solid = true, dynamic = true,
        shape = love.physics.newRectangleShape(crateSize, crateSize)
    }, data))
end

function Crate:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image, crateSize)
end

