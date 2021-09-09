Tomb = Engine:EntityClass('Tomb')

_G.TombStage = {
    Closed = 1,
    Opening = 2,
    Opened = 3,
}

local tombOpeningDuration = 2.5

function Tomb:setup(data)
    self.openedImage = Engine:getAsset('art/Koffeen_open.png')
    self.closedImage = Engine:getAsset('art/koffeen.png')
    self.openingAnim = Engine:getAsset('art/Koffeen_open-Sheet.png')

    self.hasGoldenKey = data.hasGoldenKey

    BasicEntSetup(self, data)

    self.stage = self.stage or (data.alreadyOpen and TombStage.Opened or TombStage.Closed)
    self.stageChangeTime = self.stageChangeTime or 0
end

function Tomb:blocksTraversal() return self.stage ~= TombStage.Opened end

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
        EmitSound({ 'sfx/Dragon_Growl_00.ogg', 'sfx/Dragon_Growl_01.ogg' }, self)
        EmitSound('sfx/Vamp_Drink.ogg', self)
    end
end

function Tomb:getUsePrompt()
    if self.stage == TombStage.Closed then
        if GAMESTATE.player.inventory.coffee.count == 0 then
            return "It's a KOFFEEN. The lid is too heavy to move."
        else
            return "Press SPACE to pour VAMPIRE COFEEE into KOFFEEN"
        end
    end
end

function Tomb:update(time, dt)
    if self.stage == TombStage.Opening and GAMETIME > self.stageChangeTime + tombOpeningDuration then
        self.stage = TombStage.Opened
        if self.hasGoldenKey then Key.new(WORLD, { pos = self:getPos(), }) end
        SpawnVFX('art/fx/explosion.png', self:getPos())
        Vampire.new(WORLD, { pos = self:getPos(), })
    end
end

function Tomb:render()
    love.graphics.setColor(1, 1, 1, 1)
    if self.stage == TombStage.Opening then
        local frac = math.remapClamp(GAMETIME - self.stageChangeTime, 0, tombOpeningDuration, 0, 1)
        DrawSimpleEntAnim(self, self.openingAnim, frac)
    elseif self.stage == TombStage.Opened then
        DrawSimpleEntImage(self, self.openedImage)
    else
        DrawSimpleEntImage(self, self.closedImage)
    end
end


