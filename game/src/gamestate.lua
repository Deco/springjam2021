GameState = Engine:EntityClass('GameState')

_G.WORLD = false -- just use "GameState" as world for now

function GameState:setup()
    self.player = self.player or nil
end

local levelData = {
    { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', },
    { 'w', ' ', ' ', ' ', ' ', ' ', ' ', 'w', },
    { 'w', ' ', ' ', ' ', ' ', ' ', ' ', 'w', },
    { 'w', ' ', ' ', ' ', ' ', ' ', ' ', 'w', },
    { 'w', ' ', 'p', ' ', ' ', 'b', ' ', 'w', },
    { 'w', ' ', ' ', ' ', ' ', ' ', ' ', 'w', },
    { 'w', ' ', ' ', ' ', ' ', ' ', ' ', 'w', },
    { 'w', ' ', ' ', ' ', ' ', ' ', ' ', 'w', },
    { 'w', 'w', 'w', 'w', 'w', 'w', 'w', 'w', },
}

function GameState:spawned()
    WORLD = self

    Engine.camera = TheCamera.new(self, { pos = Vec(0, 0) })
    self.player = Player.new(self, { pos = Vec(0, 0) })

    local scale = 100

    for rowIdx, row in ipairs(levelData) do
        for colIdx, cellChar in ipairs(row) do
            local pos = Vec(scale * colIdx, scale * rowIdx)
            if cellChar == 'w' then
                Bomb.new(self, { pos = pos })
            elseif cellChar == 'p' then
                self.player:setPos(pos)
            elseif cellChar == 'b' then
                Bomb.new(self, { pos = pos })
            end
        end
    end
end
function GameState:removed()
    WORLD = false
    Engine.camera = nil
end


