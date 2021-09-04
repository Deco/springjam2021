_G.RenderingDepth = {
    -- under
    Spikes = 100,
    Devices = 120,
    VampireDead = 150,
    Default = 200,
    Player = 220,
    Key = 240,
    VampireAlive = 250,

    -- over
}

_G.DrawSimpleEntImage = function(ent, imageAsset)
    if imageAsset then
        love.graphics.push()

        --love.graphics.points(0, 0)

        local drawBounds = Vec(1, 1) * (imageAsset.scale or 1)
        local scale = drawBounds / imageAsset.size

        love.graphics.translate(0.5 - 0.5 * drawBounds.x, 0.5 - 0.5 * drawBounds.y)

        love.graphics.scale(scale:xy())

        love.graphics.draw(imageAsset.handle)

        love.graphics.pop()
    end
end

_G.DrawSimpleEntAnim = function(ent, animAsset, frac)
    if animAsset then
        love.graphics.push()

        local drawBounds = Vec(1, 1) * (animAsset.scale or 1)
        local scale = drawBounds / animAsset.fullSize

        local frameIdx = math.floor(frac * animAsset.frames)
        if animAsset.loop then
            frameIdx = math.mod(frameIdx, animAsset.frames)
        else
            frameIdx = math.clamp(frameIdx, 0, animAsset.frames - 1)
        end
        local quad = animAsset.quads[frameIdx + 1]

        love.graphics.translate(0.5 - 0.5 * drawBounds.x, 0.5 - 0.5 * drawBounds.y)

        love.graphics.scale(scale:xy())

        love.graphics.draw(animAsset.handle, quad, 0, 0, 0, animAsset.frames, 1)

        love.graphics.pop()
    end
end


