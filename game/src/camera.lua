TheCamera = Engine:EntityClass('TheCamera')

function TheCamera:setup(data)
    local winW, winH = love.graphics.getDimensions()
    BasicEntSetup(self, data)
    self.sizeAtZoomScaleOne = Vec(winW, winH)
    self.zoomScale = 1.0
end

function TheCamera:specialRender()
    if self.owner.player then
        self:setPos(self.owner.player:getPos())
    end
    self:setSize(self.sizeAtZoomScaleOne * self.zoomScale)

    love.graphics.push()
    love.graphics.scale(1.0 / self.zoomScale)
    love.graphics.translate((-self._pos):xy())
    love.graphics.translate((0.5 * self.zoomScale * self.sizeAtZoomScaleOne):xy())

    --Engine.spatialGrid:draw(self._bounds)

    local entsToRender = {}--Engine.spatialGrid:inSameCells(self._bounds)
    table.sort(entsToRender, function(a, b)
        return (a._pos.x * a._pos.y) < (b._pos.x * b._pos.y) -- todo: real render sorting logic
    end)
    for _, ent in ipairs(entsToRender) do
        if ent ~= self then
            Engine.DP:pushEvent(string.format('render %s', tostring(ent)))
            if not rawget(ent, 'renderSeperately') then
                love.graphics.push()
                love.graphics.translate(ent._pos.x, ent._pos.y)
                Engine:callEntMethod(ent, 'render', nil)
                love.graphics.pop()
            end
            Engine.DP:popEvent()
        end
    end

    love.graphics.pop()
end

function TheCamera:screenRender()
    --love.graphics.setColor(1, 1, 1, 1)
    --love.graphics.setFont(Engine:getAsset('devfont').handle)
    --love.graphics.print(string.format("wtffff %s", tostring(self._pos)), 10, 50)
end



