Bomb = Engine:EntityClass('Bomb')

local bombSize = 0.15

function Bomb:setup(data)
    --self.font = Engine:getAsset('fonts/HelvetiPixel.ttf:24').handle
    self.image = Engine:getAsset('art/bomb.png')

    BasicEntSetup(self, util.mergeTables({
        solid = true, dynamic = true,
        shape = love.physics.newCircleShape(bombSize),
    }, data))

    SetCircleTrigger(self, 1,
        function(ent) return ent.class == Player end,
        function(ent) self:onTrigger(ent) end
    )
    self.hasBeenTriggered = self.hasBeenTriggered or false
end

function Bomb:spawned()
    --self.trigger = CircleTrigger.new(self, {
    --    attachTo = self,
    --    radius = 1,
    --    filter = function(ent) return ent.class == Player end,
    --    onTrigger = function(ent, action) self:onTrigger(ent, action) end,
    --})
end

function Bomb:onTrigger(ent)
    if self.hasBeenTriggered then
        return
    end
    self.hasBeenTriggered = true

    Timer.new(self, { once = 3, onExpire = function(ent, action) self:explode(ent, action) end })
    EmitSound('sfx/fuse.wav', self)
end

function Bomb:explode()
    SpawnVFX('art/fx/explosion.png', self:getPos())
    EmitSound('sfx/explosion2.wav', self:getPos())
    Engine:Remove(self)
end

function Bomb:update()
    Engine.UP:pushEvent('haha nothing')
    --for i = 0, 1 do print('slow') end
    Engine.UP:popEvent()
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
    DrawSimpleEntImage(self, self.image, bombSize)
end


