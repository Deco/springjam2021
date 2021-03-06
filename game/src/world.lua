-- Mostly solid walls and stuff

World = Engine:EntityClass('World')

function World:setup(data)
    self.level = data.level
    self.logicGroups = self.logicGroups or {
        GREEN = { color = { 0, 1, 0, 1 }, allSatisfied = nil, anySatisfied = nil },
        RED = { color = { 1, 0, 0, 1 }, allSatisfied = nil, anySatisfied = nil },
        BLUE = { color = { 0.1, 0.3, 1, 1 }, allSatisfied = nil, anySatisfied = nil },
        PINK = { color = { 0.7, 0, 1, 1 }, allSatisfied = nil, anySatisfied = nil },
    }

    self.grid = self.grid or {}
    self.bounds = self.bounds or AABBfromXYWH(0, 0, 0, 0)

    self.tiledIdToEntMap = {}

    self.playerStartPos = self.playerStartPos or nil
    self.haltRetouchy = false

    self.wallImage = Engine:getAsset('art/wall.png')
    self.lightHoriImage = Engine:getAsset('art/light_beam-hori.png')
    self.lightVertImage = Engine:getAsset('art/light_beam-vert.png')

    self.lastLogicGroupSoundTime = GAMETIME

    self.debugPath = nil
end

function World:initLevel()
    Engine.blockSpawned = false
    Engine.tempEntitiesList = {}
    self.haltRetouchy = true
    for logicGroupName, logicGroup in pairs(self.logicGroups) do
        logicGroup.inputsList = {}
        logicGroup.outputsList = {}
    end

    for rowIdx, row in pairs(self.level.tiledmap.handle.layers.map.data) do
        for colIdx, tile in pairs(row) do
            local cell = self:getCell(Vec(colIdx - 1, rowIdx - 1))
            cell.isWall = (tile.type == "wall")
            cell.isPit = (tile.type == "pit")
        end
    end

    for _, object in pairs(self.level.tiledmap.handle.objects) do
        local pos = Vec(self.level.tiledmap.handle:convertPixelToTile(object.x, object.y))
        local name, extraData, extraData2 = unpack(util.splitString(object.name, '-'))

        local ent = nil
        if name == 'PlayerStart' then
            self.playerStartPos = pos
        elseif name == 'Boulder' then
            ent = Boulder.new(self, { pos = pos })
        elseif name == 'BoulderRound' then
            ent = BoulderRound.new(self, { pos = pos })
        elseif name == 'Crate' then
            ent = Crate.new(self, { pos = pos })
        elseif name == 'Coffee' then
            ent = Coffee.new(self, { pos = pos })
        elseif name == 'Salt' then
            ent = Salt.new(self, { pos = pos })
        elseif name == 'GoldenKey' then
            ent = Key.new(self, { pos = pos })
        elseif name == 'Tomb' then
            ent = Tomb.new(self, { pos = pos, alreadyOpen = (extraData == 'Open'), hasGoldenKey = (extraData == 'GoldenKey') })
        elseif name == 'Vampire' then
            ent = Vampire.new(self, { pos = pos, startIdle = true })
        elseif name == 'Spikes' then
            ent = Spikes.new(self, { pos = pos })
        elseif name == 'Light' then
            ent = LightSource.new(self, { pos = pos })
        elseif name == 'RotatingMirror' then
            ent = Mirror.new(self, { pos = pos, facingDiagDir = Diagonal[object.properties["initialFacingDir"]], kind = MirrorKind.Rotating })
        elseif name == 'MovableMirror' then
            ent = Mirror.new(self, { pos = pos, facingDiagDir = Diagonal[object.properties["initialFacingDir"]], kind = MirrorKind.Moving })
        elseif name == 'ExitDoor' then
            ent = ExitDoor.new(self, { pos = pos })
        elseif name == 'PressurePlate' then
            ent = PressurePlate.new(self, { pos = pos, logicGroupName = extraData })
            table.insert(self:getLogicGroup(extraData).inputsList, ent)
        elseif name == 'ToggleSwitch' or name == 'Toggle' then
            ent = ToggleSwitch.new(self, { pos = pos, logicGroupName = extraData })
            table.insert(self:getLogicGroup(extraData).inputsList, ent)
        elseif name == 'Gate' then
            ent = Gate.new(self, { pos = pos, logicGroupName = extraData, mode = extraData2 or "AND" })
            table.insert(self:getLogicGroup(extraData).outputsList, ent)
        end
        --self.tiledIdToEntMap[object.id]
    end

    GAMESTATE.player:setPos(WORLD.playerStartPos)
    --GAMESTATE.player._lastPos = WORLD.playerStartPos + (Engine.menu.targetLevelIdx == 1 and not Engine.menu.wasRestart and Vec(0, -20) or Vec(0, 0))
    GAMESTATE.player._lastPos = WORLD.playerStartPos

    self.haltRetouchy = false
    Engine.blockSpawned = false
    local tempEntitiesList = Engine.tempEntitiesList
    Engine.tempEntitiesList = {}

    for _, ent in ipairs(tempEntitiesList) do
        Engine:callEntMethod(ent, 'spawned', nil)
    end
    for _, ent in ipairs(tempEntitiesList) do
        local retouchy = rawget(ent, 'retouchy')
        if retouchy then
            retouchy(ent, nil, WORLD:getCell(ent:getPos()))
        end
    end

    for logicGroupName, logicGroup in pairs(self.logicGroups) do
        self:refreshLogicGroup(logicGroupName)
    end
end

function World:specialRender()
    local sixteenToOne = 1 / 16

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.push()
    love.graphics.scale(sixteenToOne)
    for _, layer in ipairs(self.level.tiledmap.handle.layers) do
        if layer.name == "map" or layer.name == "scatter" then
            layer:draw()
        end
    end
    love.graphics.pop()

    -- temp
    --for x = self.bounds.x0, self.bounds.x1 do
    --    for y = self.bounds.y0, self.bounds.y1 do
    --        local cell = self:getCell(Vec(x, y))
    --        if cell.isWall then
    --            love.graphics.draw(self.wallImage.handle, x, y, 0, sixteenToOne, sixteenToOne)
    --        end
    --    end
    --end
end

function World:specialRenderAfter()
    -- temp
    local storedBlendMode, storedBlendAlphaMode = love.graphics.getBlendMode()
    love.graphics.setBlendMode('add')
    local sixteenToOne = 1 / 16
    local viewBounds = Engine.camera:getViewBounds()

    --love.graphics.setColor(1, 1, 1, 1)
    --love.graphics.setLineWidth(0.05)
    --love.graphics.rectangle('line', viewBounds.x0 + 6, viewBounds.y0 + 6, (viewBounds:size() - 2 * Vec(6, 6)):xy())

    local alpha = 0.6

    SCREENTEXT(viewBounds)
    for x = viewBounds.x0, viewBounds.x1 do
        for y = viewBounds.y0, viewBounds.y1 do
            local cell = self:getCell(Vec(x, y))
            if cell:isIlluminated() then
                local lightPassTest = cell:lightPassTest()

                local horizFrac, vertFrac = 0, 0
                local fromLeft, fromRight, fromUp, fromDown = false, false, false, false
                for lighter, source in pairs(cell.directlyLitBySet) do
                    local lighterPos = lighter:getPos()
                    local litInfo = cell.litBySet[source]
                    if lighterPos.x == x and lighterPos.y ~= y then
                        vertFrac = math.remapClamp(GAMETIME - litInfo.time - 0.007 * litInfo.idx, 0, 0.3, 0.0, 1.0)
                        fromUp = fromUp or lighterPos.y < y
                        fromDown = fromDown or lighterPos.y > y
                    end
                    if lighterPos.y == y and lighterPos.x ~= x then
                        horizFrac = math.remapClamp(GAMETIME - litInfo.time - 0.007 * litInfo.idx, 0, 0.3, 0.0, 1.0)
                        fromLeft = fromLeft or lighterPos.x < x
                        fromRight = fromRight or lighterPos.x > x
                    end
                end

                local allowLeft, allowRight, allowUp, allowDown = true, true, true, true
                local illuminatedMirrorFacingDir, firstBlockingEnt = nil, nil
                if not lightPassTest then
                    for ent in pairs(cell.entsSet) do
                        local blocksLightFunc = rawget(ent, 'blocksLight')
                        if blocksLightFunc and blocksLightFunc(ent) then
                            firstBlockingEnt = ent
                            if ent.class == Mirror then
                                if ent.isReflecting then
                                    illuminatedMirrorFacingDir = ent.facingDiagDir
                                    if ent.isReflectingGod then
                                        if ent.facingDiagDir == Diagonal.UpRight or ent.facingDiagDir == Diagonal.DownLeft then
                                            horizFrac = 1.0
                                        elseif ent.facingDiagDir == Diagonal.UpLeft or ent.facingDiagDir == Diagonal.DownRight then
                                            vertFrac = 1.0
                                        end
                                    else
                                        horizFrac = math.max(horizFrac, vertFrac)
                                        vertFrac = horizFrac
                                    end
                                else
                                    if ent.facingDiagDir == Diagonal.UpRight then
                                        allowUp, allowRight = false
                                    elseif ent.facingDiagDir == Diagonal.DownRight then
                                        allowDown, allowRight = false
                                    elseif ent.facingDiagDir == Diagonal.DownLeft then
                                        allowDown, allowLeft = false
                                    elseif ent.facingDiagDir == Diagonal.UpLeft then
                                        allowUp, allowLeft = false
                                    end
                                end
                            else
                                allowLeft, allowRight, allowUp, allowDown = fromLeft, fromRight, fromUp, fromDown
                            end
                            break
                        end
                    end
                    if firstBlockingEnt ~= nil then
                        local test = 0
                        love.graphics.stencil(function()
                            love.graphics.setShader(Engine:getAsset('shader:stencilMask').handle)
                            love.graphics.push()
                            if illuminatedMirrorFacingDir ~= nil then
                                test = 1
                                love.graphics.translate(x + 0.5, y + 0.5)
                                love.graphics.rotate(math.pi / 2 * (illuminatedMirrorFacingDir - 2) / 2)
                                --love.graphics.rotate(GAMETIME)
                                love.graphics.translate(-0.5, -0.5)
                                love.graphics.draw(Engine:getAsset('art/light_beam-bouncemask.png').handle, 0, 0, 0, 1 / 16, 1 / 16)
                            elseif firstBlockingEnt then
                                test = 0
                                Engine.camera:_renderEnt(0, firstBlockingEnt)
                            end
                            love.graphics.pop()
                            love.graphics.setShader(nil)
                        end, 'increment', 1, false)
                        love.graphics.setStencilTest('equal', test)
                    else
                        horizFrac, vertFrac = 0, 0
                    end
                end
                local s = 0.5
                if horizFrac > 0 then
                    love.graphics.setColor(1, 1, 1, horizFrac * alpha)
                    love.graphics.draw(self.lightHoriImage.handle,
                        x + (allowLeft and 0 or 1 / 2), y + 4 / 16, 0,
                        1 / 16 * ((allowLeft and 0.5 or 0) + (allowRight and 0.5 or 0)), 1 / 16 / 2
                    )
                end
                if vertFrac > 0 then
                    love.graphics.setColor(1, 1, 1, vertFrac * alpha)
                    love.graphics.draw(self.lightVertImage.handle,
                        x + 4 / 16, y + (allowUp and 0 or (1 / 2)), 0,
                        1 / 16 / 2, 1 / 16 * ((allowUp and 0.5 or 0) + (allowDown and 0.5 or 0))
                    )
                end
                if illuminatedMirrorFacingDir ~= nil or firstBlockingEnt ~= nil then
                    love.graphics.setStencilTest('always', 0)
                end
            end

            --love.graphics.setColor(1,1,0,1)
            --love.graphics.rectangle("fill", x, y, 1, 1)
        end
    end
    love.graphics.setBlendMode(storedBlendMode, storedBlendAlphaMode)

    --if self.debugPath then
    --    love.graphics.setColor(0.7, 0.7, 1, 1)
    --    local lastCell = nil
    --    for cellIdx, cell in ipairs(self.debugPath) do
    --        if lastCell then
    --            love.graphics.setLineWidth(1 / 8)
    --            love.graphics.line(lastCell.pos.x + 0.5, lastCell.pos.y + 0.5, cell.pos.x + 0.5, cell.pos.y + 0.5)
    --        end
    --        lastCell = cell
    --    end
    --end
end

function World:getReverbZone(pos)
    local type = 'open' -- default to open
    if not self.level.tiledmap.handle.layers.reverb then
        return type
    end

    local pixelPos = Vec(self.level.tiledmap.handle:convertTileToPixel(pos.x, pos.y))

    local smallestArea = nil
    for _, object in pairs(self.level.tiledmap.handle.layers.reverb.objects) do
        local area = object.width * object.height
        if smallestArea ~= nil and area > smallestArea then
            -- skip, we already have a more specific one
        else
            if pixelPos.x >= object.x and pixelPos.x <= (object.x + object.width) and pixelPos.y >= object.y and pixelPos.y <= (object.y + object.height) then
                smallestArea = area
                type = object.name
            end
        end
    end

    return type
end

function World:getCell(pos)
    local isNew = false
    local row = self.grid[pos.y]
    if row == nil then
        row = {}
        self.grid[pos.y] = row
        isNew = true
    end
    local cell = row[pos.x]
    if cell == nil then
        cell = Cell.new(self, { pos = pos, isPit = true, })
        row[pos.x] = cell
        isNew = true
    end
    if isNew then
        self.bounds = self.bounds:expandToIncludeVec(pos)
    end
    return cell
end

function World:getLogicGroup(name)
    return self.logicGroups[name]
end

function World:refreshLogicGroup(name)
    local logicGroup = WORLD:getLogicGroup(name)
    local anyUnsatisfied = false
    local anySatisfied = false
    for _, inputEnt in ipairs(logicGroup.inputsList) do
        if inputEnt:shouldConsiderSatisfied() then
            anySatisfied = true
        else
            anyUnsatisfied = true
        end
    end
    local allSatisfied = not anyUnsatisfied
    if logicGroup.allSatisfied ~= allSatisfied or logicGroup.anySatisfied ~= anySatisfied then
        local playerPos = GAMESTATE.player:getPos()
        local shortestDist = nil
        local anyOutputChanged = false
        local someOutputEnt = nil
        for _, outputEnt in ipairs(logicGroup.outputsList) do
            local cb = rawget(outputEnt, 'onLogicGroupUpdate')
            if cb and cb(outputEnt, allSatisfied, anySatisfied) then
                anyOutputChanged = true
                local dist = playerPos:dist(outputEnt:getPos())
                if not shortestDist or dist <= shortestDist then
                    shortestDist = dist
                    someOutputEnt = outputEnt
                end
            end
        end
        logicGroup.allSatisfied = allSatisfied
        logicGroup.anySatisfied = anySatisfied
        if anyOutputChanged and GAMETIME > 0.1 and self.lastLogicGroupSoundTime < GAMETIME then
            self.lastLogicGroupSoundTime = GAMETIME
            if not someOutputEnt then
                someOutputEnt = self
            end
            EmitSound({ 'sfx/Trap_00.ogg', 'sfx/Trap_01.ogg', 'sfx/Trap_02.ogg' }, someOutputEnt)
        end
    end
end

function World:refreshLight()
    for _, ent in ipairs(Engine.entitiesList) do
        if ent.class == LightSource then
            ent:updateLight()
        end
    end
end

function World:onEntSpawned(ent)
    local blocksLightFunc = rawget(ent, 'blocksLight')
    if blocksLightFunc and blocksLightFunc(ent) then self:refreshLight() end
    --local activatesFloorSensorsFunc = rawget(ent, 'activatesFloorSensors')
    --if activatesFloorSensorsFunc and activatesFloorSensorsFunc(ent) then self:updateLight() end
end

function World:canSee(v0, v1, entOrNil)
    local visionTest = function(x, y)
        local wtf = self:getCell(Vec(x, y)):visionPassTest(entOrNil)
        return wtf
    end

    local x0, y0, x1, y1 = v0.x, v0.y, v1.x, v1.y
    local sx, sy, dx, dy = v0.x, v0.y, v1.x, v1.y

    if x0 < x1 then
        sx = 1
        dx = x1 - x0
    else
        sx = -1
        dx = x0 - x1
    end

    if y0 < y1 then
        sy = 1
        dy = y1 - y0
    else
        sy = -1
        dy = y0 - y1
    end

    local err, e2 = dx - dy, nil

    if not visionTest(x0, y0) then return false end

    while not (x0 == x1 and y0 == y1) do
        e2 = err + err
        if e2 > -dy then
            err = err - dy
            x0 = x0 + sx
        end
        if e2 < dx then
            err = err + dx
            y0 = y0 + sy
        end
        if not visionTest(x0, y0) then return false end
    end

    return true
end

function World:getLineMovePath(v0, v1, entOrNil)
    local traversalPassTest = function(x, y)
        return self:getCell(Vec(x, y)):traversalPassTest(entOrNil)
    end

    local points = {}
    local x0, y0, x1, y1 = v0.x, v0.y, v1.x, v1.y
    local sx, sy, dx, dy = v0.x, v0.y, v1.x, v1.y

    if x0 < x1 then
        sx = 1
        dx = x1 - x0
    else
        sx = -1
        dx = x0 - x1
    end

    if y0 < y1 then
        sy = 1
        dy = y1 - y0
    else
        sy = -1
        dy = y0 - y1
    end

    local err, e2 = dx - dy, nil

    if not traversalPassTest(x0, y0) then
        return points, false
    end
    table.insert(points, Vec(x0, y0))

    while not (x0 == x1 and y0 == y1) do
        e2 = err + err
        if e2 > -dy then
            err = err - dy
            x0 = x0 + sx
        end
        if e2 < dx then
            err = err + dx
            y0 = y0 + sy
        end
        if not traversalPassTest(x0, y0) then
            return points, false
        end
        table.insert(points, Vec(x0, y0))
    end

    return points, true
end

local astar = require "lib.astar"
function World:pathFind(v0, v1, entOrNil, extraTraversalPassTest)
    local startCell, goalCell = self:getCell(v0), self:getCell(v1)

    --local i = 0
    --local closestCell, closestCellDist = nil, math.inf
    local found, path, astarObject = astar.CalculatePath(
        startCell, goalCell,
        function(cell)
            --i = i + 1
            --local dist = cell.pos:dist(goalCell.pos)
            --WORLDTEXT(cell.pos + Vec(0.5, 0.5), string.format("%d", i), 0.2)

            return {
                self:getCell(cell.pos + Vec(0, -1)),
                self:getCell(cell.pos + Vec(1, -1)),
                self:getCell(cell.pos + Vec(1, 0)),
                self:getCell(cell.pos + Vec(1, 1)),
                self:getCell(cell.pos + Vec(0, 1)),
                self:getCell(cell.pos + Vec(-1, 1)),
                self:getCell(cell.pos + Vec(-1, 0)),
                self:getCell(cell.pos + Vec(-1, -1)),
            }
        end,
        function(cell, neighbour)
            local extraRes = extraTraversalPassTest and extraTraversalPassTest(entOrNil, neighbour)
            if extraRes ~= nil then return extraRes end
            return neighbour:traversalPassTest(entOrNil)
        end,
        function(cell, target)
            local dist = cell.pos:dist(target.pos)
            --if closestCell == nil or dist < closestCellDist then
            --    closestCell, closestCellDist = target, dist
            --end
            return dist
        end
    )

    self.debugPath = path

    if found then
        return util.reverseList(path)
        --elseif giveClosest and closestCell ~= nil then
        --WORLDTEXT(closestCell.pos + Vec(0.5, 0.5), 'wtf', 5 * ONETICK)
        --return self:pathFind(v0, closestCell.pos, entOrNil, extraTraversalPassTest, false)
    end
    return nil
end

Cell = Engine:EntityClass('Cell')
Cell.dontPutInEntitiesList = true

function Cell:setup(data)
    self.pos = self.pos or data.pos
    self.isWall = util.default(self.isWall, data.isWall)
    self.isPit = util.default(self.isPit, data.isPit)
    self.entsSet = self.entsSet or {}
    self.litBySet = self.litBySet or { }
    self.directlyLitBySet = self.directlyLitBySet or { }
end

function Cell:getPos()
    return self.pos
end

function Cell:traversalPassTest(entOrNil, secondEntOrNil, allowMovable)
    if self.isWall then return false end
    if self.isPit then return false end

    for other in pairs(self.entsSet) do
        if other ~= entOrNil and other ~= secondEntOrNil then
            local checkFunc = rawget(other, 'blocksTraversal')
            if checkFunc and checkFunc(other, entOrNil) then
                if allowMovable then
                    local movableFunc = rawget(other, 'isMovable')
                    if movableFunc and movableFunc(other, entOrNil) then
                        --
                    else
                        return false
                    end
                else
                    return false
                end
            end
        end
    end
    return true
end

function Cell:visionPassTest(entOrNil)
    if self.isWall then return false end

    for other in pairs(self.entsSet) do
        if other ~= entOrNil then
            local checkFunc = rawget(other, 'blocksVision')
            if checkFunc and checkFunc(other) then
                return false
            end
        end
    end
    return true
end

function Cell:lightPassTest(entOrNil)
    if self.isWall then return false end

    for other in pairs(self.entsSet) do
        if other ~= entOrNil then
            local checkFunc = rawget(other, 'blocksLight')
            if checkFunc and checkFunc(other) then
                return false
            end
        end
    end
    return true
end

function Cell:isIlluminated(entOrNil)
    --if next(self.litBySet) ~= nil then print("illuminated") end
    return next(self.litBySet) ~= nil
end

function Cell:getBreakables(breakerOrNil)
    local out = {}
    for other in pairs(self.entsSet) do
        if other ~= breakerOrNil then
            local checkFunc = rawget(other, 'isBreakable')
            if checkFunc and checkFunc(other) then
                table.insert(out, other)
            end
        end
    end
    return out
end

function Cell:findEntsOfClass(class)
    local result = { }
    for ent in pairs(self.entsSet) do
        if ent.class == class then
            table.insert(result, ent)
        end
    end
    return result
end


