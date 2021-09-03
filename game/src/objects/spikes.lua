Spikes = Engine:EntityClass('Spikes')

local bombSize = 0.15

function Spikes:setup(data)
    self.image = Engine:getAsset('art/spikes.png')

    BasicEntSetup(self, data)
end

function Spikes:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end


