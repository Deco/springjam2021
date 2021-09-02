Player = Engine:EntityClass('Player')

function Player:setup(data)
    self.image = Engine:getAsset('art/player/idle.png')
    self.inputActive = false
    BasicEntSetup(self, util.mergeTables({
        solid = true,
        shape = love.physics.newCircleShape(0.4),
        dynamic = true,
        density = 1,
    }, data))
    self:getBody():setBullet(true)
    self:getBody():setSleepingAllowed(false)
    self:getBody():setFixedRotation(true)
end

function Player:update(time, dt)
    if self.inputActive then
        self:processInput(time, dt)
    end
end

function Player:processInput(time, dt)
    local moveDir = Vec(0, 0)
    if love.keyboard.isDown('w') then moveDir.y = moveDir.y - 1 end
    if love.keyboard.isDown('a') then moveDir.x = moveDir.x - 1 end
    if love.keyboard.isDown('s') then moveDir.y = moveDir.y + 1 end
    if love.keyboard.isDown('d') then
        moveDir.x = moveDir.x + 1
    end
    moveDir:normalizeMe()
    local speed = 11
    self:getBody():setLinearVelocity((moveDir * speed):xy())
    --self:getBody():setPosition((Vec(self:getBody():getPosition()) + moveDir * speed * dt):xy())
    self:getBody():setAngle(moveDir:angle() * math.tau)
end

function Player:render()
    love.graphics.setColor(1, 1, 1, 1)
    DrawEntImage(self, self.image)

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


