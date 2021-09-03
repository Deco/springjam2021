Key = Engine:EntityClass('Key')

function Key:setup(data)
    self.image = Engine:getAsset('art/key.png')

    BasicEntSetup(self, data)
end

function Key:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end


