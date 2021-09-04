ExitDoor = Engine:EntityClass('ExitDoor')

function ExitDoor:setup(data)
    self.imageClosed = Engine:getAsset('art/gate.png')
    self.imageOpen = Engine:getAsset('art/gate_open.png')
    self.blocksTraversal = true
    self.blocksLight = true

    self._isLocked = true

    BasicEntSetup(self, data)
end

function ExitDoor:isLocked()
    return self._isLocked
end

function ExitDoor:onUse(player)
    if self._isLocked and player:hasItem('goldenKey') then
        player:takeItem('goldenKey')
        self._isLocked = false
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
        Engine.menu:loadLevel('next')
    end
end

function ExitDoor:render()
    love.graphics.setColor(1, 1, 0, 1)
    DrawSimpleEntImage(self, self:isLocked() and self.imageClosed or self.imageOpen)
end


