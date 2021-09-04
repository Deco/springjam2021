ToggleSwitch = Engine:EntityClass('ToggleSwitch')

function ToggleSwitch:setup(data)
    self.image = Engine:getAsset('art/toggle-switch.png')
    self.logicGroupIdx = data.logicGroupIdx

    self.isActivated = util.default(self.isActivated, false)

    BasicEntSetup(self, data)
end

function ToggleSwitch:onTouch(other)
    if other.class == Player or other.class == Vampire then
        self.isActivated = not self.isActivated
    end
end

function ToggleSwitch:considerSatisfied()
    return self.isActivated
end

function ToggleSwitch:render()
    if self.isActivated then
        love.graphics.setColor(0.2, 0.2, 0.2, 1)
    else
        love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupIdx).color))
    end
    DrawSimpleEntImage(self, self.image)
end


