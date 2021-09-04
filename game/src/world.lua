-- Mostly solid walls and stuff


World = Engine:EntityClass('World')

function World:setup(data)

    self.renderDepth = 0
    self.level = data.level
    self.logicGroups = self.logicGroups or {}

    self.grid = self.grid or {}
    self.bounds = self.bounds or AABBfromXYWH(0, 0, 0, 0)

    self.startDoorPos = self.startDoorPos or nil

    self.wallImage = Engine:getAsset('art/wall.png')
end

function World:initLevel()
    self.logicGroups = {}
    for logicGroupIdx, logicGroupInfo in ipairs(self.level.logicGroups) do
        self.logicGroups[logicGroupIdx] = util.mergeTables(logicGroupInfo, { inputsList = {}, outputsList = {}, })
    end
    for rowIdx, rowStr in ipairs(self.level.data) do
        for colIdx = 1, #rowStr do
            local cellChar = rowStr:sub(colIdx, colIdx)
            local cell = self:getCell(Vec(colIdx, rowIdx))

            if cellChar == '#' then
                cell.isWall = true
            else
                cell.isWall = false

                if cellChar == 'S' then
                    self.startDoorPos = cell.pos
                elseif cellChar == 'C' then
                    Coffee.new(self, { pos = cell.pos })
                elseif cellChar == '@' then
                    Spikes.new(self, { pos = cell.pos })
                elseif cellChar == 'T' then
                    Tomb.new(self, { pos = cell.pos })
                    --Vampire.new(self, { pos = cell.pos })
                elseif cellChar == 'E' then
                    ExitDoor.new(self, { pos = cell.pos })
                elseif cellChar == 'c' then
                    Crate.new(self, { pos = cell.pos })
                elseif tonumber(cellChar, 10) ~= nil then
                    local thing = self.level.stuff[tonumber(cellChar, 10)]
                    if thing.type == 'PressurePlate' then
                        local ent = PressurePlate.new(self, { pos = cell.pos, logicGroupIdx = thing.group })
                        table.insert(self:getLogicGroup(thing.group).inputsList, ent)
                    elseif thing.type == 'ToggleSwitch' then
                        local ent = ToggleSwitch.new(self, { pos = cell.pos, logicGroupIdx = thing.group })
                        table.insert(self:getLogicGroup(thing.group).inputsList, ent)
                    elseif thing.type == 'Gate' then
                        local ent = Gate.new(self, { pos = cell.pos, logicGroupIdx = thing.group })
                        table.insert(self:getLogicGroup(thing.group).outputsList, ent)
                    end
                end
            end
        end
    end

    GAMESTATE.player:setPos(WORLD.startDoorPos)
end

function World:specialRender()
    -- temp
    local sixteenToOne = 1 / 16
    for x = self.bounds.x0, self.bounds.x1 do
        for y = self.bounds.y0, self.bounds.y1 do
            local cell = self:getCell(Vec(x, y))
            if cell.isWall then
                love.graphics.draw(self.wallImage.handle, x, y, 0, sixteenToOne, sixteenToOne)
            end
        end
    end
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

function World:getLogicGroup(idx)
    return self.logicGroups[idx]
end

function World:canSee(v0, v1)
    local visionTest = function(x, y)
        return self:getCell(Vec(x, y)):visionTest(nil)
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
    local traversableTest = function(x, y)
        return self:getCell(Vec(x, y)):traversableTest(nil)
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

    if not traversableTest(x0, y0) then return points, false end
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
        if not traversableTest(x0, y0) then return points, false end
        table.insert(points, Vec(x0, y0))
    end

    return points, true
end

Cell = Engine:EntityClass('Cell')

function Cell:setup(data)
    self.pos = self.pos or data.pos
    self.isWall = util.default(self.isWall, data.isWall)
    self.entsSet = self.entsSet or {}
    self.isMovable = self.isMovable
end

function Cell:getPos()
    return self.pos
end

function Cell:traversableTest(entOrNil)
    if self.isWall then return false end
    for other in pairs(self.entsSet) do
        if other ~= entOrNil and rawget(other, 'blocksTraversal') then
            if other.class == Gate then
                return not other:isLocked()
            elseif other.class == ExitDoor then
                return not other:isLocked()
            else
                return false
            end
        end
    end
    return true
end

function Cell:visionTest(entOrNil)
    if self.isWall then return false end
    return true
end


