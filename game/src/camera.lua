TheCamera = Engine:EntityClass('TheCamera')

function TheCamera:setup(data)
    BasicEntSetup(self, data)

    local width = 30 -- metres
    self._worldSizeAtZoomScaleOne = Vec(width, width / 1920 * 1080) -- 10 metres by 10 metres (todo: match aspect ratio)
    self._zoomScale = self._zoomScale or 1.0
    self._worldSize = self._worldSize or nil
    self:setZoomScale(self._zoomScale)
end

function TheCamera:specialRender()
    Engine.DP:pushEvent('camera render')

    if self.owner.player then
        self:setPos(self.owner.player:getPos())
    end

    love.graphics.push()

    love.graphics.applyTransform(self:getTransform())

    -- find entities to render
    local entsToRender = util.filterList(
        Engine.entitiesList,
        function(ent) return rawget(ent, '_pos') end
    )

    table.sort(entsToRender, function(a, b)
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

            local pos = ent:getPos()

            love.graphics.translate(pos:xy())

            love.graphics.translate(0.5, 0.5)
            love.graphics.rotate(math.cardinalToAng(ent:getRot()))
            love.graphics.translate(-0.5, -0.5)

            Engine:callEntMethod(ent, 'render', nil)

            love.graphics.pop()
            Engine.DP:popEvent()
        end
    end

    love.graphics.pop()

    Engine.DP:popEvent()
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
    SCREENTEXT(scale)

    --love.graphics.setColor(1, 0, 0, 1)
    --love.graphics.setLineWidth(0.02)
    --love.graphics.rectangle('line', -0.5 * self._worldSize.x, -0.5 * self._worldSize.y, self._worldSize.x, self._worldSize.y)

    -- translate by camera's offset in world
    trans:translate((-self:getPos()):xy())

    return trans
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

