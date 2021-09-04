GameState = Engine:EntityClass('GameState')

_G.WORLD = false
_G.GAMESTATE = false

function GameState:setup(data)
    self.player = self.player or nil
    self.level = data.level
    self.world = self.world or nil
end

function GameState:spawned()
    GAMESTATE = self
    self.world = World.new(self, { pos = Vec(0, 0), level = self.level })
    WORLD = self.world
    Engine.camera = TheCamera.new(self, { pos = Vec(0, 0) })
    self.player = Player.new(self, { pos = Vec(0, 0) })

    self.world:initLevel()
end
function GameState:removed()
    WORLD = false
    Engine.camera = nil
end


