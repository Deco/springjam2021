Salt = Engine:EntityClass('Salt')

function Salt:setup(data)
    self.renderDepth = RenderingDepth.Salt
    self.image = Engine:getAsset('art/salt.png')
    BasicEntSetup(self, data)
end

function Salt:blocksTraversal(mover) return mover.class == Vampire end
function Salt:blocksVision() return false end
function Salt:blocksLight() return false end
function Salt:isMovable() return false end
function Salt:activatesFloorSensors() return false end

function Salt:render()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.translate(0.5, 0.5)
    love.graphics.rotate(math.pi / 2 * self.id)
    love.graphics.translate(-0.5, -0.5)
    DrawSimpleEntImage(self, self.image)
end

