Mirror = Engine:EntityClass('Mirror')

_G.MirrorKind = {
    Moving = 1,
    Rotating = 2,
}

function Mirror:setup(data)
    BasicEntSetup(self, data)
    self.facingDiagDir = util.default(data.facingDiagDir, Diagonal.UpRight)
    self.kind = self.kind or data.kind or MirrorKind.Moving
    self.isReflecting = util.default(self.isReflecting, false)
    self.isReflecting = util.default(self.isReflectingGod, false)

    self.movingGodImage = Engine:getAsset('art/Mirror_god.png')
    self.movingActiveImage = Engine:getAsset('art/Mirror_active.png')
    self.movingIdleImage = Engine:getAsset('art/Mirror.png')
    self.rotatingGodImage = Engine:getAsset('art/RotatingMirror_god.png')
    self.rotatingActiveImage = Engine:getAsset('art/RotatingMirror_active.png')
    self.rotatingIdleImage = Engine:getAsset('art/RotatingMirror.png')
end

function Mirror:blocksTraversal() return true end
function Mirror:blocksLight() return true end
function Mirror:isMovable() return self.kind == MirrorKind.Moving end
function Mirror:activatesFloorSensors() return true end

function Mirror:onUse(player)
    if self.kind == MirrorKind.Rotating then
        self.facingDiagDir = math.indexWrap(self.facingDiagDir + 2, 8)
        WORLD:refreshLight()
        EmitSound({ 'sfx/Inventory_Open_00.ogg', 'sfx/Inventory_Open_01.ogg' }, self)
    end
end

function Mirror:getUsePrompt(player)
    if self.kind == MirrorKind.Rotating then return "Press SPACE to rotate MIRROR" end
end

function Mirror:render()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.translate(0.5, 0.5)
    love.graphics.rotate(math.pi /2 * (self.facingDiagDir - 2)/2)
    --if self.facingDiagDir == Diagonal.UpRight then end
    --if self.facingDiagDir == Diagonal.DownRight then
    --    love.graphics.rotate(math.pi / 2)
    --end
    --if self.facingDiagDir == Diagonal.DownLeft then
    --    love.graphics.rotate(math.pi / 2 * 2)
    --end
    --if self.facingDiagDir == Diagonal.UpLeft then
    --    love.graphics.rotate(math.pi / 2 * 3)
    --end
    love.graphics.translate(-0.5, -0.5)
    local image
    if self.kind == MirrorKind.Moving then
        --image = self.isReflectingGod and self.movingGodImage or self.isReflecting and self.movingActiveImage or self.movingIdleImage
        image = self.movingIdleImage
    else
        --image = self.isReflectingGod and self.rotatingGodImage or self.isReflecting and self.rotatingActiveImage or self.rotatingIdleImage
        image = self.rotatingIdleImage
    end
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

    if lightFromDir == 'from above!!' then
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

function Mirror:onShoved()
    EmitSound({
        'sfx/Boulder_Move_00.ogg',
        'sfx/Boulder_Move_01.ogg',
        'sfx/Boulder_Move_02.ogg',
    }, self)
end

