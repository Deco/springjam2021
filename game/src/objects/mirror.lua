Mirror = Engine:EntityClass('Mirror')

function Mirror:setup(data)
    BasicEntSetup(self, data)
    self.facingDiagDir = util.default(data.facingDiagDir, Diagonal.UpRight)
    self.isMovingMirror = util.default(data.isMovingMirror ,true)
    if self.isMovingMirror then
        self.image = Engine:getAsset('art/mirror_dynamic.png')
    else
        self.image = Engine:getAsset('art/mirror_static.png')
    end
end

function Mirror:blocksTraversal() return true end
function Mirror:blocksLight() return true end
function Mirror:isMovable() return true end

function Mirror:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end

