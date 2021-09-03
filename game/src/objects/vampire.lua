Vampire = Engine:EntityClass('Vampire')

local bombSize = 0.15

function Vampire:setup(data)
    self.renderDepth = 11

    self.image = Engine:getAsset('art/vampire.png')

    BasicEntSetup(self, data)
end

function Vampire:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end


