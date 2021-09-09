ExitDoor = Engine:EntityClass('ExitDoor')

function ExitDoor:setup(data)
    self.imageClosed = Engine:getAsset('art/gate.png')
    self.imageOpen = Engine:getAsset('art/gate_open.png')

    self._isLocked = true
    self.activateTime = nil

    BasicEntSetup(self, data)
end

function ExitDoor:blocksTraversal() return self:isLocked() end
function ExitDoor:blocksVision() return self:isLocked() end
function ExitDoor:blocksLight() return self:isLocked() end

function ExitDoor:isLocked()
    return self._isLocked
end

function ExitDoor:onUse(player)
    if self._isLocked and player:hasItem('goldenKey') then
        player:takeItem('goldenKey')
        self._isLocked = false
        EmitSound('sfx/door.ogg', self)
    end
end

function ExitDoor:getUsePrompt(player)
    if self._isLocked then
        if player:hasItem('goldenKey') then
            return "Press SPACE to UNLOCK DOOR"
        else
            return "The door is locked. The lock has golden embellishments."
        end
    end
end

function ExitDoor:onTouch(other)
    if other.class == Player then
        self.activateTime = self.activateTime or GAMETIME
    end
end

function ExitDoor:update()
    if self.activateTime then
        Engine.menu:setFade(math.remapClamp(GAMETIME - self.activateTime, 0, 1.2, 0, 1))
        if GAMETIME > self.activateTime + 2.0 then
            Engine.menu:loadLevel('next')
        end
    end
end

function ExitDoor:render()
    love.graphics.setColor(1, 1, 0, 1)
    DrawSimpleEntImage(self, self:isLocked() and self.imageClosed or self.imageOpen)
end


