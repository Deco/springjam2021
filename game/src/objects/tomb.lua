Tomb = Engine:EntityClass('Tomb')

_G.TombStage = {
    Closed = 1,
    Opening = 2,
    Opened = 3,
}

function Tomb:setup(data)
    self.image = Engine:getAsset('art/tomb.png')
    self.blocksTraversal = true

    BasicEntSetup(self, data)

    self.stage = self.stage or TombStage.Closed
    self.stageChangeTime = self.stageChangeTime or 0
end

function Tomb:onTouch(other)
    --if other.class == Player and self.stage == TombStage.Closed and other.inventory.coffee.count > 0 then
    --    other.inventory.coffee.count = other.inventory.coffee.count - 1
    --    self.stage = TombStage.Opening
    --    self.stageChangeTime = GAMETIME
    --end
end

function Tomb:onUse(player)
    if self.stage == TombStage.Closed and player:hasItem('coffee') then
        player:takeItem('coffee')
        self.stage = TombStage.Opening
        self.stageChangeTime = GAMETIME
    end
end

function Tomb:getUsePrompt()
    if self.stage == TombStage.Closed then
        if GAMESTATE.player.inventory.coffee.count == 0 then
            return "It's a KOFFEEN. The lid is too heavy to move."
        else
            return "Press SPACE to KOFFEEN"
        end
    end
end

function Tomb:update(time, dt)
    if self.stage == TombStage.Opening and GAMETIME > self.stageChangeTime + 2.5 then
        self.stage = TombStage.Opened
        self.blocksTraversal = false
        Vampire.new(WORLD, { pos = self:getPos(), })
        Key.new(WORLD, { pos = self:getPos(), })
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


