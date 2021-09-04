Crate = Engine:EntityClass('Crate')

function Crate:setup(data)
    self.image = Engine:getAsset('art/crate.png')
    BasicEntSetup(self, data)
end

function Crate:blocksTraversal() return true end
function Crate:blocksVision() return false end
function Crate:blocksLight() return false end
function Crate:isMovable() return true end
function Crate:activatesPlates() return true end

function Crate:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end

