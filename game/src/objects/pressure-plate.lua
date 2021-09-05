PressurePlate = Engine:EntityClass('PressurePlate')

function PressurePlate:setup(data)
    self.renderDepth = RenderingDepth.Devices
    self.onImage = Engine:getAsset('art/pressure-plate-on.png')
    self.offImage = Engine:getAsset('art/pressure-plate-off.png')
    self.logicGroupName = data.logicGroupName
    self.touchersSet = self.touchersSet or {}

    BasicEntSetup(self, data)
end

function PressurePlate:onTouch(other)
    local checkFunc = rawget(other, 'activatesFloorSensors')
    if checkFunc and checkFunc(other) then
        self.touchersSet[other] = true
        WORLD:refreshLogicGroup(self.logicGroupName)
    end
end

function PressurePlate:onUnTouch(other)
    if self.touchersSet[other] then
        self.touchersSet[other] = nil
        WORLD:refreshLogicGroup(self.logicGroupName)
    end
end

function PressurePlate:shouldConsiderSatisfied()
    return next(self.touchersSet) ~= nil
end

function PressurePlate:render()
    love.graphics.setColor(unpack(WORLD:getLogicGroup(self.logicGroupName).color))
    DrawSimpleEntImage(self, self:shouldConsiderSatisfied() and self.onImage or self.offImage)
end


