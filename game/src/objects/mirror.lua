Mirror = Engine:EntityClass('Mirror')

function Mirror:setup(data)
    BasicEntSetup(self, data)
    self.facingDiagDir = util.default(data.facingDiagDir, Diagonal.UpRight)
    self.isMovingMirror = util.default(data.isMovingMirror, true)
    self.isReflecting = util.default(self.isReflecting, false)

end

function Mirror:blocksTraversal() return true end
function Mirror:blocksLight() return true end
function Mirror:isMovable() return true end

function Mirror:render()
    love.graphics.setColor(1, 1, 1, 1)
    if self.facingDiagDir == Diagonal.UpRight then end
    if self.facingDiagDir == Diagonal.UpLeft then
        love.graphics.translate(1, 0)
        love.graphics.scale(-1, 1)
    end
    --
    if self.facingDiagDir == Diagonal.DownRight then
        love.graphics.translate(0, 1)
        love.graphics.scale(1, -1)
    end
    if self.facingDiagDir == Diagonal.DownLeft then
        love.graphics.translate(1, 1)
        love.graphics.scale(-1, -1)
    end
    local image
    if self.isMovingMirror then
        if self.isReflecting then
            image = Engine:getAsset('art/Mirror_active.png')
        else
            image = Engine:getAsset('art/Mirror.png')
        end

    else
        if self.isReflecting then
            image = Engine:getAsset('art/Mirror_active.png')
        else
            image = Engine:getAsset('art/Mirror.png')
        end
    end
    --
    --love.graphics.setLineWidth(0.1)
    --love.graphics.rectangle('line', 0, 0, 1, 1)
    DrawSimpleEntImage(self, image)
end

function Mirror:redirectLight(lightFromDir)
    --Light from above
    if self.facingDiagDir == Diagonal.UpRight and lightFromDir == Cardinal.Up then
        return Cardinal.Right
    end

    if self.facingDiagDir == Diagonal.UpLeft and lightFromDir == Cardinal.Up then
        return Cardinal.Left
    end

    --light from below
    if self.facingDiagDir == Diagonal.DownRight and lightFromDir == Cardinal.Down then
        return Cardinal.Right
    end

    if self.facingDiagDir == Diagonal.DownLeft and lightFromDir == Cardinal.Down then
        return Cardinal.Left
    end

    --Light from the left
    if self.facingDiagDir == Diagonal.DownLeft and lightFromDir == Cardinal.Left then
        return Cardinal.Down
    end

    if self.facingDiagDir == Diagonal.UpLeft and lightFromDir == Cardinal.Left then
        return Cardinal.Up
    end

    --Light from the right
    if self.facingDiagDir == Diagonal.UpRight and lightFromDir == Cardinal.Right then
        return Cardinal.Up
    end
    if self.facingDiagDir == Diagonal.DownRight and lightFromDir == Cardinal.Right then
        return Cardinal.Down
    end

    if lightFromDir == 'up' then
        if self.facingDiagDir == Diagonal.UpRight then
            return Cardinal.Right
        elseif self.facingDiagDir == Diagonal.DownRight then
            return Cardinal.Down
        elseif self.facingDiagDir == Diagonal.DownLeft then
            return Cardinal.Left
        elseif self.facingDiagDir == Diagonal.UpLeft then
            return Cardinal.Up
        end
    end

    return nil
end


