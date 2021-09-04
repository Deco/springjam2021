Mirror = Engine:EntityClass('Mirror')

function Mirror:setup(data)
    self.isMovable = true

    self.blocksTraversal = true
    self.blocksLight = true
    BasicEntSetup(self, data)
    self.facingDiagDir = util.default(data.facingDiagDir, Diagonal.UpRight)
    self.isMovingMirror = util.default(data.isMovingMirror ,true)
    if self.isMovingMirror then
        self.image = Engine:getAsset('art/mirror_dynamic.png')
    else
        self.image = Engine:getAsset('art/mirror_static.png')
    end
end

function Mirror:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end

