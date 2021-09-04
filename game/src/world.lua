-- Mostly solid walls and stuff


World = Engine:EntityClass('World')

function World:setup(data)
    self.levelData = self.levelData or {
        '################',
        '#              #',
        '#              #',
        'S    #####     #',
        '#    #   #     #',
        '# C  @ 1 @   T #',
        '# c  #   #     #',
        '#    #####     #',
        '#              #',
        '#              #',
        '#          #####',
        '#          2   E',
        '#          #####',
        '################',
    }
    self.logicGroups = self.logicGroups or {
        [1] = { color = { 0.00, 1.00, 0.00, 1 }, inputsList = {}, outputsList = {}, }
    }
    self.levelStuff = self.levelStuff or {
        [1] = { type = "PressurePlate", group = 1, },
        [2] = { type = "Gate", group = 1, }
    }

    self.renderDepth = 0

    self.grid = self.grid or {}
    self.bounds = self.bounds or AABBfromXYWH(0, 0, 0, 0)

    self.startDoorPos = self.startDoorPos or nil

    self.level = Engine:getAsset('src/maps/hand_fucking_coded.lua')
    self.wallImage = Engine:getAsset('art/wall.png')
end

function World:initLevel()
    local levelMap = {}
    for _, layer in ipairs(self.level.handle.layers) do
        if layer.name == 'map' then
            levelMap = layer.data
            break
        end
    end

    for rowIdx = 1, #self.levelData do
        for colIdx = 1, #self.levelData[1] do
            local rowStr = self.levelData[rowIdx]
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
                elseif cellChar == 'E' then
                    --ExitDoor.new(self, { pos = cell.pos })
                elseif  cellChar == 'c' then
                    Crate.new(self, {pos = cell.pos})
                elseif tonumber(cellChar, 10) ~= nil then
                    local thing = self.levelStuff[tonumber(cellChar, 10)]
                    if thing.type == 'PressurePlate' then
                        local ent = PressurePlate.new(self, { pos = cell.pos, logicGroupIdx = thing.group })
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

    self.level.handle:draw()
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

Cell = Engine:EntityClass('Cell')

function Cell:setup(data)
    self.pos = self.pos or data.pos
    self.isWall = util.default(self.isWall, data.isWall)
    self.entsSet = self.entsSet or {}
end

function Cell:getPos()
    return self.pos
end

function Cell:solidTest(ent)
    if self.isWall then return true end
    for other in pairs(self.entsSet) do
        if other ~= ent then
            if other.class == Gate then
                if other:isLocked() then return true end
            end
        end
    end
    return false
end


