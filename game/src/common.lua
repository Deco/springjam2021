--

do
    _G.VFX = Engine:EntityClass('VFX')
    function VFX:setup(data)
        BasicEntSetup(self, data)
        self.asset = assert(data.asset)
        self.birth = self.birth or GAMETIME
    end
    function VFX:spawned()
        --
    end
    function VFX:update(time, dt)
        if time > self.birth + self.asset.lifetime then Engine:Remove(self) end
    end
    function VFX:render()
        local lifetime = self.asset.lifetime
        local age = GAMETIME - self.birth
        local ageFrac = age / lifetime
        love.graphics.push()
        love.graphics.setColor(1, 1, 1,
            math.remapClamp(ageFrac, 0.0, 0.05, 0.0,
                math.remapClamp(ageFrac, 0.6, 1.0, 1.0, 0.0)
            )
        )
        local scale = math.easeOutQuad(ageFrac, 0.0, 1.1)
        love.graphics.translate((-self._pos):xy())
        local desiredSize = self.asset.size * scale
        local s = desiredSize / Vec(self.asset.imageHandle:getWidth(), self.asset.imageHandle:getHeight())
        love.graphics.scale(s:xy())
        love.graphics.translate(((self._pos - 0.5 * desiredSize) / s):xy())
        love.graphics.draw(self.asset.imageHandle)
        love.graphics.pop()
    end

    _G.SpawnVFX = function(assetKey, posOrEnt)
        local isFollow, owner, pos = false, WORLD, posOrEnt
        if type(posOrEnt) ~= "cdata" then
            owner = posOrEnt
            pos = posOrEnt:getPos()
            isFollow = true
        end
        local vfx = VFX.new(owner, { pos = posOrEnt, asset = Engine:getAsset(assetKey) })
        if isFollow then AttachToEnt(vfx, posOrEnt) end
    end
end

do
    _G.SFX = Engine:EntityClass('SFX')
    function SFX:setup(data)
        BasicEntSetup(self, data)
        self.asset = assert(data.asset)
        self.source = self.source or self.asset.handle:clone()
        self.birth = self.birth or GAMETIME
        self.didPause = util.default(self.didPause, false)
    end
    function SFX:spawned()
        self:updateAudioSource()
        --self.source:stop()
        self.source:setLooping(not not self.asset.looping)
        self.source:play()
    end
    function SFX:removed()
        self.source:stop()
        self.source:release()
    end
    function SFX:updateAudioSource()
        local offset = self._pos - Engine.camera._pos
        --self.source:setPosition(offset.x, offset.y, 0)
        local vol = math.remapClamp(offset:mag(), 400, 900, 1.0, 0.12)
        vol = vol * (self.asset.volume or 1)
        self.source:setVolume(vol)
        SCREENTEXT(string.format('%s %.3f', tostring(self), vol))
    end
    function SFX:render()
        self:updateAudioSource() -- done in render, not update, to ensure maximum update rate

        --love.graphics.setColor(1, 1, 0, 1)
        --love.graphics.line(-10, 0, 10, 0)
        --love.graphics.line(0, -10, 0, 10)
    end
    function SFX:onPause()
        if self.source:isPlaying() then
            self.didPause = true
            self.source:pause()
        end
    end
    function SFX:onResume()
        if self.didPause then
            self.didPause = false
            self.source:play()
        end
    end
    function SFX:update(time, dt)
        if not self.asset.looping and time > self.birth + self.source:getDuration() then
            Engine:Remove(self)
        end
    end
    _G.EmitSound = function(assetKey, posOrEnt)
        local isFollow, owner, pos = false, WORLD, posOrEnt
        if type(posOrEnt) ~= "cdata" then
            owner = posOrEnt
            pos = posOrEnt:getPos()
            isFollow = true
        end
        local sfx = SFX.new(owner, { pos = pos, asset = Engine:getAsset(assetKey) })
        if isFollow then AttachToEnt(sfx, posOrEnt) end
    end
end

do
    _G.Timer = Engine:EntityClass('Timer')
    function Timer:setup(data)
        self.delay = assert(data.once)
        self.onExpire = assert(data.onExpire)
        self.startTime = GAMETIME
    end
    function Timer:update(time, dt)
        if time > self.startTime + self.delay then
            self.onExpire()
            Engine:Remove(self)
        end
    end
end






