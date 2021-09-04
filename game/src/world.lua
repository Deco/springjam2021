-- Mostly solid walls and stuff

World = Engine:EntityClass('World')

function World:setup(data)
    self.level = data.level
    self.logicGroups = self.logicGroups or {
        GREEN = { color = { 0, 1, 0, 1 } },
    }

    self.grid = self.grid or {}
    self.bounds = self.bounds or AABBfromXYWH(0, 0, 0, 0)

    self.playerStartPos = self.playerStartPos or nil

    self.wallImage = Engine:getAsset('art/wall.png')
    self.lightHoriImage = Engine:getAsset('art/light_beam-hori.png')
    self.lightVertImage = Engine:getAsset('art/light_beam-vert.png')
    self.lightSources = self.lightSources or { }

    self.debugPath = nil
end

function World:initLevel()
    for logicGroupName, logicGroup in pairs(self.logicGroups) do
        logicGroup.inputsList = {}
        logicGroup.outputsList = {}
    end

    for rowIdx, row in ipairs(self.level.tiledmap.handle.layers.map.data) do
        for colIdx, tile in ipairs(row) do
            local cell = self:getCell(Vec(colIdx - 1, rowIdx - 1))
            cell.isWall = (tile.type == "wall")
            cell.isPit = (tile.type == "pit")
        end
    end

    for _, object in pairs(self.level.tiledmap.handle.objects) do
        local pos = Vec(self.level.tiledmap.handle:convertPixelToTile(object.x, object.y))
        local name = object.name

        if name == 'PlayerStart' then
            self.playerStartPos = pos
        elseif name == 'Crate' then
            Crate.new(self, { pos = pos })
        elseif name == 'Coffee' then
            Coffee.new(self, { pos = pos })
        elseif name == 'Tomb' then
            Tomb.new(self, { pos = pos })
        elseif name == 'Spikes' then
            Spikes.new(self, { pos = pos })
        elseif name == 'Light' then
            local ent = LightSource.new(self, { pos = pos })
            table.insert(self.lightSources, ent)
        elseif name == 'Mirror' then
            local ent = Mirror.new(self, { pos = pos, facingDiagDir = object.properties["initialFacingDir"] })
        elseif name == 'ExitDoor' then
            ExitDoor.new(self, { pos = pos })
        elseif name == 'PressurePlate' then
            local ent = PressurePlate.new(self, { pos = pos, logicGroupName = 'GREEN' })
            table.insert(self:getLogicGroup('GREEN').inputsList, ent)
        elseif name == 'ToggleSwitch' then
            local ent = ToggleSwitch.new(self, { pos = pos, logicGroupName = 'GREEN' })
            table.insert(self:getLogicGroup('GREEN').inputsList, ent)
        elseif name == 'Gate' then
            local ent = Gate.new(self, { pos = pos, logicGroupName = 'GREEN' })
            table.insert(self:getLogicGroup('GREEN').outputsList, ent)
        end
    end

    -- TODO: strip this
    --for rowIdx, rowStr in ipairs({}) do
    --    for colIdx = 1, #rowStr do
    --        local cellChar = rowStr:sub(colIdx, colIdx)
    --        local cell = self:getCell(Vec(colIdx, rowIdx))
    --
    --        if cellChar == '#' then
    --            cell.isWall = false
    --        else
    --            cell.isWall = false
    --
    --
    --            if cellChar == 'S' then
    --                self.playerStartPos = cell.pos
    --            elseif cellChar == 'C' then
    --                Coffee.new(self, { pos = cell.pos })
    --            elseif cellChar == '@' then
    --                Spikes.new(self, { pos = cell.pos })
    --            elseif cellChar == 'T' then
    --                Tomb.new(self, { pos = cell.pos })
    --                --Vampire.new(self, { pos = cell.pos })
    --            elseif cellChar == 'E' then
    --                ExitDoor.new(self, { pos = cell.pos })
    --            elseif cellChar == 'c' then
    --                Crate.new(self, { pos = cell.pos })
    --            elseif tonumber(cellChar, 10) ~= nil then
    --                local thing = self.level.stuff[tonumber(cellChar, 10)]
    --                if thing.type == 'PressurePlate' then
    --                    local ent = PressurePlate.new(self, { pos = cell.pos, logicGroupIdx = thing.group })
    --                    table.insert(self:getLogicGroup(thing.group).inputsList, ent)
    --                elseif thing.type == 'ToggleSwitch' then
    --                    local ent = ToggleSwitch.new(self, { pos = cell.pos, logicGroupIdx = thing.group })
    --                    table.insert(self:getLogicGroup(thing.group).inputsList, ent)
    --                elseif thing.type == 'Gate' then
    --                    local ent = Gate.new(self, { pos = cell.pos, logicGroupIdx = thing.group })
    --                    table.insert(self:getLogicGroup(thing.group).outputsList, ent)
    --                end
    --            end
    --    end
    --end

    GAMESTATE.player:setPos(WORLD.playerStartPos)
    GAMESTATE.player._lastPos = WORLD.playerStartPos
end

function World:specialRender()
    local sixteenToOne = 1 / 16

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

function World:getLineMovePath(v0, v1)
    local traversalPassTest = function(x, y)
        return self:getCell(Vec(x, y)):traversalPassTest(nil)
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
function World:pathFind(v0, v1, entOrNil)
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

function Cell:traversalPassTest(entOrNil)
    if self.isWall then return false end
    if self.isPit then return false end

    for other in pairs(self.entsSet) do
        if other ~= entOrNil then
            local checkFunc = rawget(other, 'blocksTraversal')
            if checkFunc and checkFunc(other, entOrNil) then return false end
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

function Cell:findEntsOfClass(class)
    local result = { }
    for ent in pairs(self.entsSet) do
        if ent.class == class then
            table.insert(result, ent)
        end
    end
    return result
end

