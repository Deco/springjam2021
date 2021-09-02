TheCamera = Engine:EntityClass('TheCamera')

function TheCamera:setup(data)
    BasicEntSetup(self, util.mergeTables({
        solid = true, dynamic = true,
        wantsContacts = true,
    }, data))
    self:getBody():setSleepingAllowed(false)

    local width = 15 -- metres
    self._worldSizeAtZoomScaleOne = Vec(width, width / 1920 * 1080) -- 10 metres by 10 metres (todo: match aspect ratio)
    self._zoomScale = self._zoomScale or 1.0
    self._worldSize = self._worldSize or nil
    self:setZoomScale(self._zoomScale)
end

function TheCamera:specialRender()
    if self.owner.player then
        self:setPos(self.owner.player:getPos())
    end

    love.graphics.push()

    local pixelSize = Vec(love.graphics.getDimensions())

    -- first we translate so the middle of the screen is 0,0
    love.graphics.translate(0.5 * pixelSize.x, 0.5 * pixelSize.y)

    -- fixed downscale and screen bounds for debugging
    --love.graphics.scale(0.5)
    --love.graphics.rectangle('line', -0.5 * pixelSize.x, -0.5 * pixelSize.y, pixelSize.x, pixelSize.y)

    -- scale to cover screen camera rect with world camera rect
    local scale
    if (self._worldSize.x / self._worldSize.y) > (pixelSize.x / pixelSize.y) then
        scale = pixelSize.y / self._worldSize.y
    else
        scale = pixelSize.x / self._worldSize.x
    end
    love.graphics.scale(scale)

    --love.graphics.setColor(1, 0, 0, 1)
    --love.graphics.setLineWidth(0.02)
    --love.graphics.rectangle('line', -0.5 * self._worldSize.x, -0.5 * self._worldSize.y, self._worldSize.x, self._worldSize.y)

    -- translate by camera's offset in world
    love.graphics.translate((-self:getPos()):xy())

    -- find entities to render
    local entsToRender = {}
    for ent, contact in pairs(self._otherEntContactMap) do
        if ent.alive then
            table.insert(entsToRender, ent)
        end
    end
    table.sort(entsToRender, function(a, b)
        local aDepth, bDepth = rawget(a, 'renderDepth') or 0, rawget(b, 'renderDepth') or 0
        if aDepth ~= bDepth then return aDepth < bDepth end
        return a.id < b.id
    end)

    love.graphics.push()
    love.graphics.translate(self:getPos():xy())
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.setLineWidth(0.02)
    love.graphics.rectangle('line', -0.5 * self._worldSize.x, -0.5 * self._worldSize.y, self._worldSize.x, self._worldSize.y)
    love.graphics.pop()

    -- render them!
    for _, ent in ipairs(entsToRender) do
        Engine.DP:pushEvent(string.format('render %s', tostring(ent)))
        love.graphics.push()

        local body = rawget(ent, '_body')
        if body then
            for fixtureIdx, fixture in ipairs(body:getFixtures()) do
                local shape = fixture:getShape()
                love.graphics.setColor(1, 1, 1, 1)
                if shape:typeOf("CircleShape") then
                    local cx, cy = body:getWorldPoints(shape:getPoint())
                    love.graphics.push()
                    love.graphics.translate(cx, cy)
                    love.graphics.rotate(body:getAngle())
                    local radius = shape:getRadius()
                    love.graphics.circle("line", 0, 0, radius)
                    love.graphics.line(0, -radius, 0, 0.8 * -radius)
                    love.graphics.pop()
                elseif shape:typeOf("PolygonShape") then
                    love.graphics.polygon("line", body:getWorldPoints(shape:getPoints()))
                elseif shape:typeOf("ChainShape") then
                    --love.graphics.polygon("line", body:getWorldPoints(shape:getPoints()))
                    --love.graphics.polygon("line", points)
                    --local cx, cy = body:getPosition()
                    local lx, ly
                    for pointIdx = 1, shape:getVertexCount() do
                        local px, py = shape:getPoint(pointIdx)
                        if lx then
                            --love.graphics.print(string.format("%i", pointIdx), (lx + px) / 2, (ly + py) / 2, 0, 0.05, 0.05)
                            love.graphics.line(lx, ly, px, py)
                        end
                        lx, ly = px, py
                    end
                else
                    local cx, cy = body:getPosition()
                    love.graphics.print(tostring(ent), cx, cy, 0, 0.05, 0.05)
                end
            end
        end

        local pos = ent:getPos()
        love.graphics.translate(pos:xy())
        --Engine:callEntMethod(ent, 'render', nil)

        love.graphics.pop()
        Engine.DP:popEvent()
    end

    --local entsToRender = {}--Engine.spatialGrid:inSameCells(self._bounds)
    --table.sort(entsToRender, function(a, b)
    --    return (a._pos.x * a._pos.y) < (b._pos.x * b._pos.y) -- todo: real render sorting logic
    --end)
    --for _, ent in ipairs(entsToRender) do
    --    if ent ~= self then
    --        Engine.DP:pushEvent(string.format('render %s', tostring(ent)))
    --        if not rawget(ent, 'renderSeperately') then
    --            love.graphics.push()
    --            love.graphics.translate(ent._pos.x, ent._pos.y)
    --            Engine:callEntMethod(ent, 'render', nil)
    --            love.graphics.pop()
    --        end
    --        Engine.DP:popEvent()
    --    end
    --end

    love.graphics.pop()
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
    if self._fixture ~= nil then
        if not self._fixture:isDestroyed() then self._fixture:destroy() end
        self._fixture:release()
        self._fixture = nil
        self._shape:release()
        self._shape = nil
    end
    self._worldSize = self._worldSizeAtZoomScaleOne * zoomScale
    self._shape = love.physics.newRectangleShape(self._worldSize.x, self._worldSize.y) -- origin = centre (good!)
    self._fixture = love.physics.newFixture(self._body, self._shape)
    self._fixture:setUserData(self)
    self._fixture:setSensor(true)
    self._body:setPosition(self._body:getPosition())
end

