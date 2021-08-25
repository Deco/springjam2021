local floor = math.floor
local min, max = math.min, math.max

GMAKER 'SpatialGrid'
function SpatialGrid.new(cellSize)
    local self = setmetatable({}, { __index = SpatialGrid })
    self.cellSize = 800
    self.cells = {}
    return self
end

local function cellCoords(v, cellSize)
    return Vec(floor(v.x / cellSize), floor(v.y / cellSize))
end

function SpatialGrid:cell(i, k)
    local row = rawget(self.cells, i)
    if not row then
        row = {}
        rawset(self.cells, i, row)
    end

    local cell = rawget(row, k)
    if not cell then
        cell = {}
        rawset(row, k, cell)
    end

    return cell
end

function SpatialGrid:cellAt(v)
    return self:cell(cellCoords(v.x, v.y, self.cellSize))
end

-- get all objects
function SpatialGrid:getAllObjects()
    local set = {}
    for i, row in pairs(self.cells) do for k, cell in pairs(row) do
        for obj in pairs(cell) do
            rawset(set, obj, true)
        end
    end end
    return set
end

-- get all objects that are in the same cells as the bbox x1,y1 '--. x2,y2
function SpatialGrid:inSameCells(bounds)
    local out = {}
    local v1, v2 = cellCoords(bounds:tl(), self.cellSize), cellCoords(bounds:br(), self.cellSize)
    for i = v1.x, v2.x do for k = v1.y, v2.y do
        for obj in pairs(self:cell(i, k)) do
            table.insert(out, obj)
        end end
    end
    return out
end

function SpatialGrid:registerObject(obj, bounds)
    local v1, v2 = cellCoords(bounds:tl(), self.cellSize), cellCoords(bounds:br(), self.cellSize)
    for i = v1.x, v2.x do for k = v1.y, v2.y do
        rawset(self:cell(i, k), obj, true)
    end end
end

function SpatialGrid:deregisterObject(obj, bounds)
    -- no bbox given. => must check all cells
    if not bounds then
        for _, row in pairs(self.cells) do for _, cell in pairs(row) do
            rawset(cell, obj, nil)
        end end
        return
    end

    -- else: remove only from bbox
    local v1, v2 = cellCoords(bounds:tl(), self.cellSize), cellCoords(bounds:br(), self.cellSize)
    for i = v1.x, v2.x do for k = v1.y, v2.y do
        rawset(self:cell(i, k), obj, nil)
    end end
end

-- update an objects position
function SpatialGrid:updateObject(obj, oldBounds, newBounds)
    local ov1, ov2 = cellCoords(oldBounds:tl(), self.cellSize), cellCoords(oldBounds:br(), self.cellSize)
    local nv1, nv2 = cellCoords(newBounds:tl(), self.cellSize), cellCoords(newBounds:br(), self.cellSize)
    if nv1 == ov1 and nv2 == ov2 then return end

    for i = ov1.x, ov2.x do for k = ov1.y, ov2.y do
        rawset(self:cell(i, k), obj, nil)
        --print(obj, 'OUT ', i, k)
    end end
    for i = nv1.x, nv2.x do for k = nv1.y, nv2.y do
        rawset(self:cell(i, k), obj, true)
        --print(obj, 'INTO', i, k)
    end end
end

function SpatialGrid:intersectionsWithSegment(v1, v2)
    local od = v2 - v1
    local mag, cur = od:mag(), 0
    local dir = od:normalized()
    local step = self.cellSize / 2
    local visited = {}
    local points = {}
    local mt = math.huge

    while (cur + step < mag) do
        local c = v1 + dir * cur
        local cell = self:cellAt(c)
        cur = cur + step

        for object in pairs(cell) do
            if not visited[object] then
                visited[object] = true

                local intersections = object:intersectionsWithRay(v1, dir)
                for _, t in ipairs(intersections) do
                    if t >= 0 and t <= mag then
                        local point = v1 + t * dir
                        table.insert(points, { object = object, t = t, point = point })
                    end
                end
            end
        end
    end
    table.sort(points, function(a, b)
        return a.t < b.t
    end)
    return points
end

function SpatialGrid:draw(bounds)
    local v1, v2 = cellCoords(bounds:tl(), self.cellSize), cellCoords(bounds:br(), self.cellSize)
    for i = v1.x, v2.x do for k = v1.y, v2.y do
        local cell = self:cell(i, k)
        local hasCamera = false
        local is_empty = #util.filterList(util.setToList(cell), function(obj)
            if obj.class == TheCamera then
                hasCamera = true
                return false
            end
            return true
        end) == 0
        local x = i * self.cellSize
        local y = k * self.cellSize
        if is_empty then
            love.graphics.setColor(1.0, 0.4, 0.4, 1.0)
        else
            love.graphics.setColor(1.0, 1.0, 1.0, 1.0)
        end
        love.graphics.rectangle(hasCamera and 'line' or 'fill', x + 3, y + 3, self.cellSize - 6, self.cellSize - 6)

        --if print_key then
        --    love.graphics.print(("%d:%d"):format(k1, k2), x + 3, y + 3)
        --end
    end end
end


