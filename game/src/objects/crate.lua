Crate = Engine:EntityClass('Crate')

function Crate:setup(data)
    self.image = Engine:getAsset('art/crate.png')
    BasicEntSetup(self, data)
    self.isBroke = util.default(self.isBroke, false)
end

function Crate:blocksTraversal() return not self.isBroke end
function Crate:blocksVision() return false end
function Crate:blocksLight() return false end
function Crate:isMovable() return not self.isBroke end
function Crate:activatesFloorSensors() return not self.isBroke end

function Crate:isBreakable() return not self.isBroke end
function Crate:makeBroke()
    self.isBroke = true
end

function Crate:onShoved()
    EmitSound({ 'sfx/Inventory_Open_00.mp3', 'sfx/Inventory_Open_01.mp3' }, self)
end

function Crate:render()
    local f = self.isBroke and 0.1 or 1
    love.graphics.setColor(f, f, f, 1)
    DrawSimpleEntImage(self, self.image)
end

