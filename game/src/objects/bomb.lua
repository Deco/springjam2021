Bomb = Engine:EntityClass('Bomb')

function Bomb:setup(data)
    --self.font = Engine:getAsset('fonts/HelvetiPixel.ttf:24').handle
    self.image = Engine:getAsset('art/bomb.png')

    self._size = Vec(30, 30)
    BasicEntSetup(self, data)

    self.trigger = nil
    self.hasBeenTriggered = self.hasBeenTriggered or false
end

function Bomb:spawned()
    self.trigger = CircleTrigger.new(self, {
        radius = 80,
        filter = function(ent) return ent.class == Player end,
        onTrigger = function(ent, action) self:onTrigger(ent, action) end,
    })
end

function Bomb:onTrigger(ent, action)
    if self.hasBeenTriggered or action ~= 'enter' then
        return
    end
    self.hasBeenTriggered = true

    Timer.new(self, { once = 3, onExpire = function(ent, action) self:explode(ent, action) end })
    EmitSound('sfx/fuse.wav', self)
end

function Bomb:explode()
    SpawnVFX('art/fx/explosion.png', self:getPos())
    EmitSound('sfx/explosion1.wav', self:getPos())
    Engine:Remove(self)
end

function Bomb:update()

end

function Bomb:render()
    --love.graphics.setFont(self.font)
    --love.graphics.setColor(1, 1, 1, 1)
    --love.graphics.print('Hello World!', 0, 0)
    local pulse = math.remap(math.sin(10 * GAMETIME), -1, 1, 0.5, 1.0)
    if self.hasBeenTriggered then
        love.graphics.setColor(1, pulse, pulse, pulse)
    else
        love.graphics.setColor(1, 1, 1, 1)
    end
    DrawEntImage(self, self.image)
end


