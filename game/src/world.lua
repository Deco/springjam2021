-- Mostly solid walls and stuff


World = Engine:EntityClass('World')

local levelData = {
    '###############',
    '#             #',
    'S    #####    #',
    '#    #   #    #',
    '# C  @ 1 @  T #',
    '#    #   #    #',
    '#    #####    #',
    '#             #',
    '#             #',
    '#         #####',
    '#         2   E',
    '#         #####',
    '###############',
}
local levelStuff = {
    [1] = { type = "PressurePlate", triggers = 2, },
    [2] = { type = "Door" },
}

function World:setup(data)
    self.renderDepth = 0

    self.grid = self.grid or {}
    self.bounds = self.bounds or AABBfromXYWH(0, 0, 0, 0)

    self.startDoorPos = nil
end

function World:spawned()
    for rowIdx, rowStr in ipairs(levelData) do
        for colIdx = 1, #rowStr do
            local cellChar = rowStr:sub(colIdx, colIdx)
            local cell = self:getCell(Vec(colIdx, rowIdx))

            if cellChar == '#' then
                cell.isWall = true
            else
                cell.isWall = false

                if cellChar == 'S' then
                    self.startDoorPos = cell
                    GAMESTATE.player:setPos(Vec(colIdx, rowIdx))
                end
            end
        end
    end
end

function World:specialRender()
    -- temp
    for x = self.bounds.x0, self.bounds.x1 do
        for y = self.bounds.y0, self.bounds.y1 do
            local cell = self:getCell(Vec(x, y))
            if cell.isWall then
                love.graphics.rectangle('fill', x, y, 1, 1)
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

Cell = Engine:EntityClass('Cell')

function Cell:setup(data)
    self.pos = data.pos
    self.isWall = data.isWall
    self.entsSet = {}
end

function Cell:getPos()
    return self.pos
end

function Cell:solidTest(ent)
    return self.isWall
end


