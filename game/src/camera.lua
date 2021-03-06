TheCamera = Engine:EntityClass('TheCamera')

function TheCamera:setup(data)
    BasicEntSetup(self, data)

    local width = 30 -- metres
    self._worldSizeAtZoomScaleOne = Vec(width, width / 1920 * 1080) -- 10 metres by 10 metres (todo: match aspect ratio)
    self._zoomScale = self._zoomScale or 1.0
    self._worldSize = self._worldSize or nil
    self:setZoomScale(self._zoomScale)

    self.viewPos = self.viewPos or Vec(0, 0) -- not aligned to grid
end

function TheCamera:specialRender(dt)
    Engine.DP:pushEvent('camera render')

    if self.owner.player then
        self:setPos(self.owner.player:getPos())
    end

    local dist = self:getPos():dist(self.viewPos)
    if dist > 10.0 or GAMETIME < 0.1 then
        self.viewPos = self:getPos()
    end

    local goalViewPos = self:getPos() --+ Vec(0.5, 0.5)
    local viewDiff = goalViewPos - self.viewPos
    local viewSpeed = math.remapClamp(viewDiff:mag(), 3, 7, 7.5, 25)
    self.viewPos = self.viewPos + viewDiff:normalized() * math.clamp(dt * viewSpeed, 0, viewDiff:mag())

    love.graphics.push()

    love.graphics.applyTransform(self:getTransform())

    -- find entities to render
    local entsToRender = util.filterList(
        Engine.entitiesList,
        function(ent) return rawget(ent, '_pos') end
    )

    table.sort(entsToRender, function(a, b)
        if a._pos.y ~= b._pos.y then
            return a._pos.y < b._pos.y
        end
        local aDepth, bDepth = rawget(a, 'renderDepth') or 1, rawget(b, 'renderDepth') or 1
        if aDepth ~= bDepth then return aDepth < bDepth end
        return a.id < b.id
    end)

    -- debug draw
    if Engine.debugDraw then
        --
    else
        love.graphics.push()
        WORLD:specialRender()
        love.graphics.pop()

        for _, ent in ipairs(entsToRender) do
            Engine.DP:pushEvent(string.format('render %s', tostring(ent)))
            love.graphics.push()

            self:_renderEnt(dt, ent)

            love.graphics.pop()
            Engine.DP:popEvent()
        end

        WORLD:specialRenderAfter()

        if IS_DEBUG then
            love.graphics.setColor(1, 1, 1, 1)
            for _, dti in ipairs(Engine.updateDebugText) do
                if dti.type == 'world' then
                    local scale = 0.03
                    local text = tostring(dti.text)
                    local font = Engine:getAsset('devfont').handle
                    local sizeW, sizeH = font:getWidth(text) * scale, font:getHeight() * scale
                    love.graphics.print(text, font, dti.pos.x - sizeW / 2, dti.pos.y - sizeH / 2, 0, scale, scale)
                end
            end
        end
    end

    love.graphics.pop()
    local v = self.viewPos
    love.audio.setPosition(v.x, v.y, 8)
    -- being 8 units above the board softens stereo pans
    -- but! we must set reference for dynamic sounds to match
    Engine.DP:popEvent()
end

function TheCamera:_renderEnt(dt, ent)
    local pos = ent:getPos()
    local lastPos = ent._lastPos
    local shiftDuration = pos:dist(lastPos) / 12.0
    local shiftFrac = math.remapClamp(GAMETIME - ent._posChangeTime, 0, shiftDuration, 0, 1)
    local displayPos = math.remapClamp(shiftFrac, 0, 1, lastPos, pos)
    local isMoving = shiftFrac < 1.0
    love.graphics.translate(displayPos:xy())

    --love.graphics.translate(0.5, 0.5)
    --love.graphics.rotate(math.cardinalToAng(ent:getRot()))
    --love.graphics.translate(-0.5, -0.5)

    Engine:callEntMethod(ent, 'render', nil, dt, isMoving)
end

function TheCamera:getTransform()
    local trans = love.math.newTransform()

    local pixelSize = Vec(love.graphics.getDimensions())

    -- first we translate so the middle of the screen is 0,0
    trans:translate(0.5 * pixelSize.x, 0.5 * pixelSize.y)

    -- fixed downscale and screen bounds for debugging
    --trans:scale(0.5)
    --love.graphics.rectangle('line', -0.5 * pixelSize.x, -0.5 * pixelSize.y, pixelSize.x, pixelSize.y)

    -- scale to cover screen camera rect with world camera rect
    local scale
    if (self._worldSize.x / self._worldSize.y) > (pixelSize.x / pixelSize.y) then
        scale = pixelSize.y / self._worldSize.y
    else
        scale = pixelSize.x / self._worldSize.x
    end
    scale = math.floorTo(scale, 1)
    trans:scale(scale)
    --SCREENTEXT(scale)

    --love.graphics.setColor(1, 0, 0, 1)
    --love.graphics.setLineWidth(0.02)
    --love.graphics.rectangle('line', -0.5 * self._worldSize.x, -0.5 * self._worldSize.y, self._worldSize.x, self._worldSize.y)

    -- translate by camera's offset in world
    --trans:translate((-self:getPos()):xy())
    --local hmm = Vec(math.floorTo(self.viewPos.x, 1 / 16) + 1 / 8, math.floorTo(self.viewPos.y, 1 / 16) + 1 / 8)
    --trans:translate((-hmm):xy())
    trans:translate((-self.viewPos):xy())

    return trans
end

function TheCamera:getViewBounds()
    local extra = 5
    return AABBfromXYWH(
        math.floor(self:getPos().x - self._worldSize.x / 2) - extra,
        math.floor(self:getPos().y - self._worldSize.y / 2) - extra,
        math.floor(self._worldSize.x + 2 * extra),
        math.floor(self._worldSize.y + 2 * extra)
    )
end

function TheCamera:screenRender()
    --love.graphics.setColor(1, 1, 1, 1)
    --love.graphics.setFont(Engine:getAsset('devfont').handle)
    --love.graphics.print(string.format("wtffff %s", tostring(self._pos)), 10, 50)
end

function TheCamera:getZoomScale()
    return self._zoomScale
end

function TheCamera:setZoomScale(zoomScale)
    self._zoomScale = zoomScale

    self._worldSize = self._worldSizeAtZoomScaleOne * zoomScale
end

