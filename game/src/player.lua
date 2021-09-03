Player = Engine:EntityClass('Player')

local playerSize = 0.4

function Player:setup(data)
    self.image = Engine:getAsset('art/player/idle.png')
    self.inputActive = false
    BasicEntSetup(self, data)

    self.lastMoveTime = 0
    self.lastMoveDir = nil
end

function Player:update(time, dt)
    if self.inputActive then
        self:processInput(time, dt)
    end
end

function Player:processInput(time, dt)
    local moveDir = nil
    if love.keyboard.isDown('w') then moveDir = Cardinal.Up end
    if love.keyboard.isDown('a') then moveDir = Cardinal.Left end
    if love.keyboard.isDown('s') then moveDir = Cardinal.Down end
    if love.keyboard.isDown('d') then moveDir = Cardinal.Right end

    if moveDir ~= nil and GAMETIME >= self.lastMoveTime + 20 * ONETICK then
        self.lastMoveTime = GAMETIME
        self:tryMove(moveDir)
    end
end

function Player:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawSimpleEntImage(self, self.image, playerSize)

    --love.graphics.setColor(1, 1, 0, 1)
    --love.graphics.line(-10, 0, 10, 0)
    --love.graphics.line(0, -10, 0, 10)
end

function Player:screenRender()
    --love.graphics.setColor(1, 1, 1, 1)
    --love.graphics.setFont(Engine:getAsset('devfont').handle)
    --love.graphics.print(string.format("wtf %s", tostring(self._pos)), 10, 30)
end

function Player:onKeyPressed(key, scancode)
    --if key == 'p' then
    --    local source = love.audio.newSource('sfx/explosion1.wav', 'static')
    --    source:play()
    --end
end

function Player:onKeyReleased(key, scancode)
end


