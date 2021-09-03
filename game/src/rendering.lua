_G.DrawSimpleEntImage = function(ent, imageAsset, radius)
    if imageAsset then
        love.graphics.push()

        local drawBounds = Vec(2 * radius, 2 * radius)
        local scale = drawBounds / imageAsset.size
        love.graphics.translate(ent:getPos():xy())
        --love.graphics.translate((0.5 * drawBounds):xy())
        love.graphics.rotate(ent:getRot() * math.tau)
        love.graphics.translate((-0.5 * drawBounds):xy())
        love.graphics.scale(scale:xy())

        love.graphics.draw(imageAsset.handle)

        love.graphics.pop()
    end
end

