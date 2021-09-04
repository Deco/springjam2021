LightSource = Engine:EntityClass('LightSource')

function LightSource:setup(data)
    self.renderDepth = RenderingDepth.God
    self.image = Engine:getAsset('art/godbeam.png')
    self.illuminatedCellsList = self.illuminatedCellsList or { }
    self.firstRun = false--util.default(self.firstRun, false)
    self.illuminatedMirrors = self.illuminatedMirrors or {}

    BasicEntSetup(self, data)
end

function LightSource:spawned()

end

function LightSource:render()
    local storedBlendMode, storedBlendAlphaMode = love.graphics.getBlendMode()
    love.graphics.setBlendMode('add')
    love.graphics.setColor(1, 1, 1, 0.65)
    DrawSimpleEntImage(self, self.image)
    love.graphics.setBlendMode(storedBlendMode, storedBlendAlphaMode)
end

function LightSource:update()
    if not self.firstRun then
        self.firstRun = true
        self:updateLight()
    end
end

function LightSource:updateLight()
    local lastLitTimeMap = {}
    for _, illuminatedCell in ipairs(self.illuminatedCellsList) do
        lastLitTimeMap[illuminatedCell] = illuminatedCell.litBySet[self].time
        illuminatedCell.litBySet[self] = nil
        for mirror, source in pairs(illuminatedCell.directlyLitBySet) do
            if source == self then
                illuminatedCell.directlyLitBySet[mirror] = nil
            end
        end
    end
    for _, mirror in ipairs(self.illuminatedMirrors) do
        mirror.isReflecting = false
        mirror.isReflectingGod = false
    end

    self.illuminatedCellsList = {}
    self.illuminatedMirrors = {}

    local currDir = 'from above!!'
    local currPos = self:getPos()
    local currDirectLighter = self
    local animStepCounter = 0
    for stepIdx = 1, 600 do
        local currCell = WORLD:getCell(currPos)
        table.insert(self.illuminatedCellsList, currCell)
        currCell.litBySet[self] = { idx = animStepCounter, time = lastLitTimeMap[currCell] or GAMETIME }
        if not lastLitTimeMap[currCell] then animStepCounter = animStepCounter + 1 end
        currCell.directlyLitBySet[currDirectLighter] = self
        local mirrors = currCell:findEntsOfClass(Mirror)
        if #mirrors > 0 then
            local lightFromDir = type(currDir) == "number" and math.indexWrap(currDir + 2, 4) or currDir
            local newDir = mirrors[1]:redirectLight(lightFromDir)
            if newDir == nil then
                break
            end

            currDir = newDir
            mirrors[1].isReflecting = true
            mirrors[1].isReflectingGod = (stepIdx == 1)
            table.insert(self.illuminatedMirrors, mirrors[1])
            currDirectLighter = mirrors[1]
        end
        --print("adding" .. currPos.x .. ", " .. currPos.y)
        if not currCell:lightPassTest(self) and #currCell:findEntsOfClass(Mirror) < 1 then
            break
        end
        if type(currDir) == "number" then
            currPos = currPos + math.cardinalToOffset(currDir)
        else
            break
        end
    end
end


