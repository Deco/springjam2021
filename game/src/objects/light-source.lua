LightSource = Engine:EntityClass('LightSource')

function LightSource:setup(data)
    self.image = Engine:getAsset('art/flashlight.png')
    self.dir = self.dir or Cardinal.Right
    self.initialDir = self.initialDir or Cardinal.Right
    self.illuminatedCellsList = self.illuminatedCellsList or { }
    self.firstRun = util.default(self.firstRun, false)
    self.illuminatedMirrors = {}

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
    for _, illuminatedCell in ipairs(self.illuminatedCellsList) do
        illuminatedCell.litBySet[self] = nil
        for mirror, source in pairs(illuminatedCell.directlyLitBySet) do
            if source == self then
                illuminatedCell.directlyLitBySet[mirror] = nil
            end
        end
    end
    for _, mirror in ipairs(self.illuminatedMirrors) do
        mirror.isReflecting = false
    end

    self.illuminatedCellsList = {}
    self.illuminatedMirrors = {}
    self.dir = self.initialDir

    local currPos = self:getPos() + math.cardinalToOffset(self.dir)
    local currDirectLighter = self
    for loopIdx = 1, 600 do
        local currCell = WORLD:getCell(currPos)
        table.insert(self.illuminatedCellsList, currCell)
        currCell.litBySet[self] = true
        currCell.directlyLitBySet[currDirectLighter] = self
        local mirrors = currCell:findEntsOfClass(Mirror)
        if #mirrors > 0 then
            local lightFromDir = math.indexWrap(self.dir + 2, 4)
            local newDir = mirrors[1]:redirectLight(lightFromDir)
            if newDir == nil then
                break
            end
            print("Im in a mirror" .. mirrors[1].facingDiagDir)

            print("Light From: " .. self.dir .. " -> " .. newDir)
            self.dir = newDir
            mirrors[1].isReflecting = true
            table.insert(self.illuminatedMirrors, mirrors[1])
            currDirectLighter = mirrors[1]
        end
        print("adding" .. currPos.x .. ", " .. currPos.y)
        if not currCell:lightPassTest(self) and #currCell:findEntsOfClass(Mirror) < 1 then
            break
        end
        currPos = currPos + math.cardinalToOffset(self.dir)
    end
end


