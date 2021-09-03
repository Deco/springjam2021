Coffee = Engine:EntityClass('Coffee')

function Coffee:setup(data)
    self.image = Engine:getAsset('art/coffee.png')

    BasicEntSetup(self, data)
end

function Coffee:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end


