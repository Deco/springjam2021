LightSource = Engine:EntityClass('LightSource')

function LightSource:setup(data)
    self.image = Engine:getAsset('art/flashlight.png')
    self.dir = self.dir or Cardinal.Right
    self.initialDir = self.initialDir or Cardinal.Right
    self.illuminatedCellsSet = self.illuminatedCellsSet or { }
    self.firstRun = util.default(self.firstRun, false)

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
        self.initialDir = self.dir
        self.firstRun = true
        self:updateLight()
    end
end

function LightSource:updateLight()
    for _, pos in ipairs(self.illuminatedCellsSet) do
        WORLD:getCell(pos.pos).litBySet[self] = nil
    end
    self.illuminatedCellsSet = {}
    self.dir = self.initialDir

    local currPos = self:getPos() + math.cardinalToOffset(self.dir)
    local loop_c = 0
    --not WORLD:getCell(nextPos):blocksLight()
    while true and loop_c < 1000 do
        local currCell = WORLD:getCell(currPos)
        table.insert(self.illuminatedCellsSet, { pos = currPos })
        local mirrors = currCell:findEntsOfClass(Mirror)
        if #mirrors > 0 then
            local newDir = mirrors[1]:redirectLight()
            if newDir == nil then
                break
            end
            print("Im in a mirror" .. mirrors[1].facingDiagDir )
            print("Light From: " .. self.dir .. " -> " .. newDir)
            self.dir = newDir
        end
        currCell.litBySet[self] = true
        loop_c = loop_c + 1
        print("adding" .. currPos.x .. ", " .. currPos.y)
        if currCell:blocksLight() and #currCell:findEntsOfClass(Mirror) < 1 then
            break
        end
        currPos = currPos + math.cardinalToOffset(self.dir)
    end
end


