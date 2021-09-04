Crate = Engine:EntityClass('Crate')

function Crate:setup(data)
    self.isMovable = true
    self.image = Engine:getAsset('art/crate.png')
    self.blocksTraversal = true
    self.blocksLight = true
    BasicEntSetup(self, data)
end

function Crate:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end

