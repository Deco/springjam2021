Boulder = Engine:EntityClass('Boulder')

function Boulder:setup(data)
    self.image = Engine:getAsset('art/Boulder.png')
    BasicEntSetup(self, data)
end

function Boulder:blocksTraversal() return true end
function Boulder:blocksVision() return true end
function Boulder:blocksLight() return true end
function Boulder:isMovable() return true end
function Boulder:activatesFloorSensors() return true end

function Boulder:onShoved()
    EmitSound({
        'sfx/Boulder_Move_00.ogg',
        'sfx/Boulder_Move_01.ogg',
        'sfx/Boulder_Move_02.ogg',
    }, self)
end

function Boulder:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end

