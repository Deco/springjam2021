ToggleSwitch = Engine:EntityClass('ToggleSwitch')

function ToggleSwitch:setup(data)
    self.onImage = Engine:getAsset('art/toggle-switch-on.png')
    self.offImage = Engine:getAsset('art/toggle-switch-off.png')
    self.logicGroupName = data.logicGroupName

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
    love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupName).color))
    DrawSimpleEntImage(self, self.isActivated and self.onImage or self.offImage)
end


