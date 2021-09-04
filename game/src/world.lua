-- Mostly solid walls and stuff

World = Engine:EntityClass('World')

function World:setup(data)
    self.level = data.level
    self.logicGroups = self.logicGroups or {
        GREEN = { color = { 0, 1, 0, 1 }, satisfied = false, },
        RED = { color = { 1, 0, 0, 1 }, satisfied = false, },
        BLUE = { color = { 0.1, 0.3, 1, 1 }, satisfied = false, },
        PINK = { color = { 0.7, 0, 1, 1 }, satisfied = false, },
    }

    self.grid = self.grid or {}
    self.bounds = self.bounds or AABBfromXYWH(0, 0, 0, 0)

    self.playerStartPos = self.playerStartPos or nil
    self.haltRetouchy = false

    self.wallImage = Engine:getAsset('art/wall.png')
    self.lightHoriImage = Engine:getAsset('art/light_beam-hori.png')
    self.lightVertImage = Engine:getAsset('art/light_beam-vert.png')

    self.debugPath = nil
end

function World:initLevel()
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
        local name, extraData = unpack(util.splitString(object.name, '-'))

        if name == 'PlayerStart' then
            self.playerStartPos = pos
        elseif name == 'Boulder' then
            Boulder.new(self, { pos = pos })
        elseif name == 'BoulderRound' then
            BoulderRound.new(self, { pos = pos })
        elseif name == 'Crate' then
            Crate.new(self, { pos = pos })
        elseif name == 'Coffee' then
            Coffee.new(self, { pos = pos })
        elseif name == 'Tomb' then
            Tomb.new(self, { pos = pos, alreadyOpen = (extraData == 'Open'), hasGoldenKey = (extraData == 'GoldenKey') })
        elseif name == 'Vampire' then
            Vampire.new(self, { pos = pos, startIdle = true })
        elseif name == 'Spikes' then
            Spikes.new(self, { pos = pos })
        elseif name == 'Light' then
            local ent = LightSource.new(self, { pos = pos })
        elseif name == 'Mirror' then
            local ent = Mirror.new(self, { pos = pos, facingDiagDir = Diagonal[object.properties["initialFacingDir"]] })
        elseif name == 'ExitDoor' then
            ExitDoor.new(self, { pos = pos })
        elseif name == 'PressurePlate' then
            local ent = PressurePlate.new(self, { pos = pos, logicGroupName = extraData })
            table.insert(self:getLogicGroup(extraData).inputsList, ent)
        elseif name == 'ToggleSwitch' or name == 'Toggle' then
            local ent = ToggleSwitch.new(self, { pos = pos, logicGroupName = extraData })
            table.insert(self:getLogicGroup(extraData).inputsList, ent)
        elseif name == 'Gate' then
            local ent = Gate.new(self, { pos = pos, logicGroupName = extraData })
            table.insert(self:getLogicGroup(extraData).outputsList, ent)
        end
    end

    GAMESTATE.player:setPos(WORLD.playerStartPos)
    GAMESTATE.player._lastPos = WORLD.playerStartPos + (Engine.menu.targetLevelIdx == 1 and not Engine.menu.wasRestart and Vec(0, -20) or Vec(0, 0))

    self.haltRetouchy = false
    for _, ent in ipairs(Engine.entitiesList) do
        local retouchy = rawget(ent, 'retouchy')
        if retouchy then
            retouchy(ent, nil, WORLD:getCell(ent:getPos()))
        end
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
    love.graphics.setColor(1, 1, 1, 1.0)
    local storedBlendMode, storedBlendAlphaMode = love.graphics.getBlendMode()
    love.graphics.setBlendMode('add')
    local sixteenToOne = 1 / 16
    for x = self.bounds.x0, self.bounds.x1 do
        for y = self.bounds.y0, self.bounds.y1 do
            local cell = self:getCell(Vec(x, y))
            if cell:isIlluminated() and cell:lightPassTest() then
                local hasHoriz, hasVert = false, false
                for lighter in pairs(cell.directlyLitBySet) do
                    local lighterPos = lighter:getPos()
                    if lighterPos.x == x then hasVert = true end
                    if lighterPos.y == y then hasHoriz = true end
                end
                if hasHoriz and hasVert then
                    love.graphics.draw(self.lightVertImage.handle, x + 4 / 16, y, 0, 1 / 16 / 2, 1 / 16)
                    love.graphics.draw(self.lightHoriImage.handle, x, y + 4 / 16, 0, 1 / 16, 1 / 16 / 2)
                elseif hasHoriz then
                    love.graphics.draw(self.lightHoriImage.handle, x, y + 4 / 16, 0, 1 / 16, 1 / 16 / 2)
                elseif hasVert then
                    love.graphics.draw(self.lightVertImage.handle, x + 4 / 16, y, 0, 1 / 16 / 2, 1 / 16)
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
        cell = Cell.new(self, { pos = pos, isWall = true, })
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
    for _, inputEnt in ipairs(logicGroup.inputsList) do
        if not inputEnt:shouldConsiderSatisfied() then
            anyUnsatisfied = true
        end
    end
    local considerSatisfied = not anyUnsatisfied
    if considerSatisfied ~= logicGroup.satisfied then
        for _, outputEnt in ipairs(logicGroup.outputsList) do
            local cb = rawget(outputEnt, 'onLogicGroupUpdate')
            if cb then cb(outputEnt, considerSatisfied) end
        end
        logicGroup.satisfied = considerSatisfied
    end
end

function World:refreshLight()
    for _, ent in ipairs(Engine.entitiesList) do
        if ent.class == LightSource then
            ent:updateLight()
        end
    end
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

    local found, path, status = astar.CalculatePath(
        startCell, goalCell,
        function(cell)
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
            return cell.pos:dist(target.pos)
        end
    )

    self.debugPath = path

    return found and util.reverseList(path) or nil
end

Cell = Engine:EntityClass('Cell')

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


