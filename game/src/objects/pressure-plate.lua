PressurePlate = Engine:EntityClass('PressurePlate')

function PressurePlate:setup(data)
    self.image = Engine:getAsset('art/pressure-plate.png')
    self.logicGroupName = data.logicGroupName
    --self.color = util.hex2rgb(logicGroupName)

    self.hasBeenTriggered = false

    BasicEntSetup(self, data)
end

function PressurePlate:onTouch(other)
    if other.class == Player or other.class == Vampire then
        if not self.hasBeenTriggered then
            self.hasBeenTriggered = true
        end
    end
end

function PressurePlate:considerSatisfied()
    return self.hasBeenTriggered
end

function PressurePlate:render()
    if self.hasBeenTriggered then
        love.graphics.setColor(0.2, 0.2, 0.2, 1)
    else
        love.graphics.setColor(table.unpack(self.color))
    end
    DrawSimpleEntImage(self, self.image)
end


