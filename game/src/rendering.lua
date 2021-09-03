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


