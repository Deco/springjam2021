Tomb = Engine:EntityClass('Tomb')

local bombSize = 0.15

_G.TombStage = {
    Closed = 1,
    Opening = 2,
    Opened = 3,
}

function Tomb:setup(data)
    self.image = Engine:getAsset('art/tomb.png')

    BasicEntSetup(self, data)

    self.stage = TombStage.Closed
    self.stageChangeTime = 0
end

function Tomb:onTouch(other)
    if other.class == Player and self.stage == TombStage.Closed and other.inventory.coffee.count > 0 then
        other.inventory.coffee.count = other.inventory.coffee.count - 1
        self.stage = TombStage.Opening
        self.stageChangeTime = GAMETIME
    end
end

function Tomb:update(time, dt)
    if self.stage == TombStage.Opening and GAMETIME > self.stageChangeTime + 2.5 then
        self.stage = TombStage.Opened
        Vampire.new(WORLD, { pos = self:getPos(), })
    end
end

function Tomb:render()
    if self.stage == TombStage.Opening then
        local pulse = math.remap(math.sin(10 * GAMETIME), -1, 1, 0.5, 1.0)
        love.graphics.setColor(1, pulse, 0.6 * pulse, 0.6 * pulse)
    elseif self.stage == TombStage.Opened then
        love.graphics.setColor(0.3, 0.3, 0.3, 1)
    else
        love.graphics.setColor(1, 1, 1, 1)
    end
    DrawSimpleEntImage(self, self.image)
end


