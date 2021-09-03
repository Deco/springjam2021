-- Mostly solid walls and stuff


World = Engine:EntityClass('World')

local levelData = {
    'wwwwwwwww                  ',
    'w                      w   ',
    'w             wwwww        ',
    'w               w      www ',
    'w p   b         w      w w ',
    'w               w      www ',
    'w     c    c               ',
    'w                    w     ',
    'wwwwwwwww             w    ',
    'wwwwwwwww             bbbbb',
    'wwwwwwwww             bbbbb',
    'wwwwwwwww             bbbbb',
    'wwwwwwwww             bbbbb',
    'wwwwwwwww             bbbbb',
    '                      bbbbb',
    'wb wb wb wb wb wb wb wb wb ',
    '                           ',
    'wb wb wb wb wb wb wb wb wb ',
    '                           ',
    'wb wb wb wb wb wb wb wb wb ',
    '                           ',
    'wb wb wb wb wb wb wb wb wb ',
}

function World:setup(data)
    self.cellSize = 1.0
    self.grid = self.grid or {}
    self.coordBounds = self.coordBounds or AABBfromXYWH(0, 0, 0, 0)

    if not self._body then
        -- aaaah
        BasicEntSetup(self, util.mergeTables({
            solid = true,
        }, data))
    end
end

function World:spawned()
    for rowIdx, rowStr in ipairs(levelData) do
        for colIdx = 1, #rowStr do
            local cellChar = rowStr:sub(colIdx, colIdx)
            local cell = self:getCellAtCoords(Vec(colIdx, rowIdx))
            local pos = Vec((colIdx + 0.5) * self.cellSize, (rowIdx + 0.5) * self.cellSize)

            if cellChar == 'w' then
                cell.contents = 'wall'
            elseif cellChar == 'p' then
                GAMESTATE.player:setPos(pos)
            elseif cellChar == 'b' then
                Bomb.new(self, { pos = pos })
            elseif cellChar == 'c' then
                Crate.new(self, { pos = pos })
            end
        end
    end

    local edgesList = {}
    local edgesByStartPointListMap = {} -- key = 'x:y'
    local makeEdge = function(x0, y0, x1, y1)
        local edge = { x0 = x0, y0 = y0, x1 = x1, y1 = y1 }
        table.insert(edgesList, edge)
        table.insert(
            util.getOrPut(edgesByStartPointListMap, string.format('%i:%i', x0, y0), function() return {} end),
            edge)
    end
    for xIdx = self.coordBounds.x0, self.coordBounds.x1 do
        for yIdx = self.coordBounds.y0, self.coordBounds.y1 do
            local cell = self:getCellAtCoords(Vec(xIdx, yIdx))
            if cell.contents == 'wall' then
                local upCell = self:getCellAtCoords(Vec(xIdx, yIdx - 1))
                if upCell.contents ~= 'wall' then
                    makeEdge(xIdx, yIdx, xIdx + 1, yIdx) -- from TL to TR
                end
                local rightCell = self:getCellAtCoords(Vec(xIdx + 1, yIdx))
                if rightCell.contents ~= 'wall' then
                    makeEdge(xIdx + 1, yIdx, xIdx + 1, yIdx + 1) -- from TR to BR
                end
                local downCell = self:getCellAtCoords(Vec(xIdx, yIdx + 1))
                if downCell.contents ~= 'wall' then
                    makeEdge(xIdx + 1, yIdx + 1, xIdx, yIdx + 1) -- from BR to BL
                end
                local leftCell = self:getCellAtCoords(Vec(xIdx - 1, yIdx))
                if leftCell.contents ~= 'wall' then
                    makeEdge(xIdx, yIdx + 1, xIdx, yIdx) -- from BL to TL
                end
            end
        end
    end

    --local function getEdgeDir(dx, dy)
    --    if dx == 0 then
    --        if dy > 0 then return 'down' end
    --        if dy < 0 then return 'up' end
    --    elseif dy == 0 then
    --        if dx > 0 then return 'right' end
    --        if dx < 0 then return 'left' end
    --    end
    --    return nil
    --end
    --
    --local function getClockwiseDir(dir)
    --end

    local edgesDoneSet = {}
    for _, loopStartEdge in pairs(edgesList) do
        if not edgesDoneSet[loopStartEdge] then
            local shapePoints = {}

            local currEdge = loopStartEdge
            local runStartEdge = nil
            repeat
                edgesDoneSet[currEdge] = true

                if runStartEdge == nil then
                    runStartEdge = currEdge
                    table.insert(shapePoints, currEdge.x0 * self.cellSize)
                    table.insert(shapePoints, currEdge.y0 * self.cellSize)
                end

                local currDX, currDY = currEdge.x1 - currEdge.x0, currEdge.y1 - currEdge.y0
                local clockwiseNeighbourList = util.filterList(
                    edgesByStartPointListMap[string.format('%i:%i', currEdge.x1, currEdge.y1)],
                    function(e) return e ~= currEdge end
                )
                if #clockwiseNeighbourList > 1 then
                    clockwiseNeighbourList = util.filterList(clockwiseNeighbourList, function(e)
                        local eDX, eDY = e.x1 - e.x0, e.y1 - e.y0
                        return eDX == currDY and eDY == -currDX -- prefer clockwise turn
                    end)
                end
                local nextEdge = util.assertOnlyOne(clockwiseNeighbourList)
                local nextDX, nextDY = nextEdge.x1 - nextEdge.x0, nextEdge.y1 - nextEdge.y0
                if nextDX == currDX and nextDY == currDY then
                    -- same direction, continue the run!
                else
                    -- change in direction, start a new run
                    runStartEdge = nil
                end

                currEdge = nextEdge
            until currEdge == loopStartEdge

            local shape = love.physics.newChainShape(true, unpack(shapePoints))
            local fixture = love.physics.newFixture(self:getBody(), shape)
            fixture:setUserData(self)
        end
    end
end

function World:render()
    -- temp

    love.graphics.setLineWidth(0.03)
    for fixtureIdx, fixture in ipairs(self:getBody():getFixtures()) do
        local shape = fixture:getShape()
        love.graphics.setColor(1, 1, 1, 1)

        local lx, ly
        for pointIdx = 1, shape:getVertexCount() do
            local px, py = shape:getPoint(pointIdx)
            if lx then
                --love.graphics.print(string.format("%i", pointIdx), (lx + px) / 2, (ly + py) / 2, 0, 0.05, 0.05)
                love.graphics.line(lx, ly, px, py)
            end
            lx, ly = px, py
        end
    end
end

function World:getCellAtCoords(coords)
    local isNew = false
    local row = self.grid[coords.y]
    if row == nil then
        row = {}
        self.grid[coords.y] = row
        isNew = true
    end
    local cell = row[coords.x]
    if cell == nil then
        cell = SHAPED({
            coord = coords,
            contents = NIL,
        })
        row[coords.x] = cell
        isNew = true
    end
    if isNew then
        self.coordBounds = self.coordBounds:expandToIncludeVec(coords)
    end
    return cell
end

function World:getCellAtPos(pos)
    local xIdx = math.floor(pos / self.cellSize)
    local yIdx = math.floor(pos / self.cellSize)
    return self:getCellAtCoords(Vec(xIdx, yIdx))
end




