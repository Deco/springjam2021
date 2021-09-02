GameState = Engine:EntityClass('GameState')

_G.WORLD = false
_G.GAMESTATE = false

function GameState:setup()
    self.player = self.player or nil
    self.world = self.world or nil
end

function GameState:spawned()
    GAMESTATE = self
    Engine.camera = TheCamera.new(self, { pos = Vec(0, 0) })
    self.player = Player.new(self, { pos = Vec(0, 0) })
    self.world = World.new(self, { pos = Vec(0, 0) })
    WORLD = self.world
end
function GameState:removed()
    WORLD = false
    Engine.camera = nil
end


