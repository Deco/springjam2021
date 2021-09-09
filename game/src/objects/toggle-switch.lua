ToggleSwitch = Engine:EntityClass('ToggleSwitch')

function ToggleSwitch:setup(data)
    self.onImage = Engine:getAsset('art/toggle-switch-on.png')
    self.offImage = Engine:getAsset('art/toggle-switch-off.png')
    self.logicGroupName = data.logicGroupName

    self.renderDepth = RenderingDepth.Devices
    self.isActivated = util.default(self.isActivated, false)

    BasicEntSetup(self, data)
end

function ToggleSwitch:onTouch(other)
    local checkFunc = rawget(other, 'activatesFloorSensors')
    if checkFunc and checkFunc(other) then
        local wasSatisfied = self:shouldConsiderSatisfied()
        self.isActivated = not self.isActivated
        WORLD:refreshLogicGroup(self.logicGroupName)
        local isSatisfied = self:shouldConsiderSatisfied()
        if isSatisfied and not wasSatisfied and GAMETIME > 0.1 then
            EmitSound('sfx/input.ogg', self)
        elseif not isSatisfied and wasSatisfied then
            EmitSound('sfx/input-off.ogg', self)
        end
    end
end

function ToggleSwitch:shouldConsiderSatisfied()
    return self.isActivated
end

function ToggleSwitch:render()
    love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupName).color))
    DrawSimpleEntImage(self, self.isActivated and self.onImage or self.offImage)
end


