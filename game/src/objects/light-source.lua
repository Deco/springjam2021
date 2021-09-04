LightSource = Engine:EntityClass('LightSource')

function LightSource:setup(data)
    self.image = Engine:getAsset('art/flashlight.png')
    self.dir = Cardinal.Right
    self.illuminatedCellsSet = self.illuminatedCellsSet or { }
    self.firstRun = util.default(self.firstRun,false)

    BasicEntSetup(self, data)
end

function LightSource:spawned()

end

function LightSource:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image)
end

function LightSource:update()
    if not self.firstRun then
        self.firstRun = true
        self:updateLight()
    end
end

function LightSource:updateLight()
    for _,pos in ipairs(self.illuminatedCellsSet) do
        WORLD:getCell(pos.pos).litBySet[self] = nil
    end
    self.illuminatedCellsSet = {}

    local currPos = self:getPos() + math.cardinalToOffset(self.dir)
    local loop_c = 0
    --not WORLD:getCell(nextPos):blocksLight()
    while  true and loop_c < 1000 do
        local currCell = WORLD:getCell(currPos)
        table.insert(self.illuminatedCellsSet, { pos = currPos })
        currCell.litBySet[self] = true
        loop_c = loop_c + 1
        print("adding" .. currPos.x .. ", " .. currPos.y)
        if  currCell:blocksLight() then
            break
        end
        currPos = currPos + math.cardinalToOffset(self.dir)
    end
end


