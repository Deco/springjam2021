_G.DrawSimpleEntImage = function(ent, imageAsset)
    if imageAsset then
        love.graphics.push()

        local drawBounds = Vec(1, 1)
        local scale = drawBounds / imageAsset.size

        --love.graphics.translate(ent:getPos():xy())

        --love.graphics.translate((0.5 * drawBounds):xy())
        --love.graphics.rotate(math.cardinalToAng(ent:getRot()))
        --love.graphics.translate((-0.5 * drawBounds):xy())

        love.graphics.scale(scale:xy())

        love.graphics.draw(imageAsset.handle)

        love.graphics.pop()
    end
end

_G.DrawSimpleEntAnim = function(ent, animAsset, frac)
    if animAsset then
        love.graphics.push()

        local drawBounds = Vec(1, 1)
        local scale = drawBounds / animAsset.fullSize

        local frameIdx = math.floor(frac * animAsset.frames)
        if animAsset.loop then
            frameIdx = math.mod(frameIdx, animAsset.frames)
        else
            frameIdx = math.clamp(frameIdx, 0, animAsset.frames - 1)
        end
        local quad = animAsset.quads[frameIdx + 1]

        --love.graphics.translate(ent:getPos():xy())

        --love.graphics.translate((0.5 * drawBounds):xy())
        --love.graphics.rotate(math.cardinalToAng(ent:getRot()))
        --love.graphics.translate((-0.5 * drawBounds):xy())

        love.graphics.scale(scale:xy())

        love.graphics.draw(animAsset.handle, quad, 0, 0, 0, 4, 1)

        love.graphics.pop()
    end
end


