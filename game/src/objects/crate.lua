Crate = Engine:EntityClass('Crate')

function Crate:setup(data)
    BasicEntSetup(self, util.mergeTables({
        solid = true, dynamic = true,
        shape = love.physics.newPolygonShape(
            0, 0,
            0.2, 0,
            0.2, 1,
            0, 1
        ),
        image = Engine:getAsset('art/crate.png')
    }, data))
end
