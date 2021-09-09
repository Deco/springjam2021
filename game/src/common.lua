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
            self.asset.opacity * math.remapClamp(ageFrac, 0.0, 0.05, 0.0,
                math.remapClamp(ageFrac, 0.6, 1.0, 1.0, 0.0)
            )
        )
        local scale = math.easeOutQuad(ageFrac, 0.0, 1.1)
        love.graphics.translate((-self:getPos()):xy())
        local desiredSize = self.asset.size * scale
        local s = desiredSize / Vec(self.asset.imageHandle:getWidth(), self.asset.imageHandle:getHeight())
        love.graphics.scale(s:xy())
        love.graphics.translate(((self:getPos() + Vec(0.5, 0.5) - 0.5 * desiredSize) / s):xy())
        love.graphics.draw(self.asset.imageHandle)
        love.graphics.pop()
    end

    _G.SpawnVFX = function(assetKey, posOrEnt)
        local vfx
        if type(posOrEnt) == "cdata" then
            vfx = VFX.new(WORLD, { solid = true, pos = posOrEnt, asset = Engine:getAsset(assetKey), })
        else
            vfx = VFX.new(posOrEnt, { pos = posOrEnt:getPos(), asset = Engine:getAsset(assetKey), })
        end
        return vfx
    end
end

do
    _G.SFX = Engine:EntityClass('SFX')
    function SFX:setup(data)
        --BasicEntSetup(self, data)
        self.asset = assert(data.asset)
        self.source = self.source or self.asset.handle:clone()
        self.birth = self.birth or GAMETIME
        self.didPause = util.default(self.didPause, false)
        self.overridePitch = data.pitch
    end
    function SFX:spawned()
        --self.source:stop()
        self.source:setLooping(not not self.asset.looping)
        self.source:seek(self.asset.trim or 0)
        self.source:setPitch(self.overridePitch or self.asset.pitch or 1.0)
        self.source:setVolume(self.asset.volume or 1.0)
        
        local pos = self.owner:getPos()

        if not self.asset.global then
            if self.owner == WORLD then
                self.source:setRelative(true)
            else
                --WORLDTEXT(pos, 'sfx-' .. self.asset.path)
                self.source:setPosition(pos.x, pos.y, 0)
                self.source:setAttenuationDistances(10, 26)
            end
        end
        if not self.asset.global and love.audio.isEffectsSupported() and self.owner ~= WORLD then
            local reverbType = WORLD:getReverbZone(pos)
            if reverbType then
                self.source:setEffect(reverbType)
            end
        end
        self.source:play()

        self:updateAudioSource()
    end
    function SFX:removed()
        self.source:stop()
        self.source:release()
    end
    function SFX:updateAudioSource()
        --if self.owner ~= WORLD then
        --    local offset = self.owner:getPos() - Engine.camera.viewPos
        --    --self.source:setPosition(offset.x, offset.y, 0)
        --    local vol = math.remapClamp(offset:mag(), 7, 20, 1.0, 0.01)
        --    vol = vol * (self.asset.volume or 1)
        --    self.source:setVolume(vol)
        --    SCREENTEXT(string.format('%s %.3f', tostring(self), offset:mag()))
        --end
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
    function SFX:getDuration()
        return math.min(self.source:getDuration() / self.source:getPitch(), self.asset.duration or 500.0)
    end
    function SFX:update(time, dt)
        if not self.asset.looping and time > self.birth + self:getDuration() then
            Engine:Remove(self)
        end
    end
    _G.EmitSound = function(assetKeyOrKeys, owner, extraData)
        local asset = Engine:getAsset(type(assetKeyOrKeys) == 'table' and util.random(assetKeyOrKeys) or assetKeyOrKeys)
        local sfx
        sfx = SFX.new(owner or WORLD, util.mergeTables({ asset = asset }, extraData))
        return sfx
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






