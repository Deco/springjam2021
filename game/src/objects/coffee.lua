Coffee = Engine:EntityClass('Coffee')

local bombSize = 0.15

function Coffee:setup(data)
    self.image = Engine:getAsset('art/coffee.png')

    BasicEntSetup(self, data)
end

function Coffee:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end


