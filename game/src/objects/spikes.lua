Spikes = Engine:EntityClass('Spikes')

function Spikes:setup(data)
    self.renderDepth = -10
    self.image = Engine:getAsset('art/spikes.png')

    BasicEntSetup(self, data)
end

function Spikes:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end


