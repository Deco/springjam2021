Mirror = Engine:EntityClass('Mirror')

function Mirror:setup(data)
    BasicEntSetup(self, data)
    self.facingDiagDir = util.default(data.facingDiagDir, Diagonal.UpRight)
    self.isMovingMirror = util.default(data.isMovingMirror, true)
    if self.isMovingMirror then
        self.image = Engine:getAsset('art/mirror_dynamic.png')
    else
        self.image = Engine:getAsset('art/mirror_static.png')
    end
end

function Mirror:blocksTraversal() return true end
function Mirror:blocksLight() return true end
function Mirror:isMovable() return true end

function Mirror:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end

function Mirror:redirectLight()
    local lightFromDir = nil
    if WORLD:getCell(self:getPos() + Vec(-1, 0)):isIlluminated() then
        lightFromDir = Cardinal.Left
    end
    if WORLD:getCell(self:getPos() + Vec(1, 0)):isIlluminated() then
        lightFromDir = Cardinal.Right
    end
    if WORLD:getCell(self:getPos() + Vec(0, -1)):isIlluminated() then
        lightFromDir = Cardinal.Up
    end
    if WORLD:getCell(self:getPos() + Vec(0, 1)):isIlluminated() then
        lightFromDir = Cardinal.Down
    end

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
    return nil
end
