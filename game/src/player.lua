Player = Engine:EntityClass('Player')

local playerSize = 0.4

function Player:setup(data)
    self.image = Engine:getAsset('art/player/idle.png')
    self.inputActive = false
    BasicEntSetup(self, util.mergeTables({
        solid = true,
        shape = love.physics.newCircleShape(playerSize),
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
    if love.keyboard.isDown('w') then moveDir = moveDir:withY(moveDir.y - 1) end
    if love.keyboard.isDown('a') then moveDir = moveDir:withX(moveDir.x - 1) end
    if love.keyboard.isDown('s') then moveDir = moveDir:withY(moveDir.y + 1) end
    if love.keyboard.isDown('d') then moveDir = moveDir:withX(moveDir.x + 1) end
    moveDir = moveDir:normalized()
    local speed = 11
    self:getBody():setLinearVelocity((moveDir * speed):xy())
    --self:getBody():setPosition((Vec(self:getBody():getPosition()) + moveDir * speed * dt):xy())
    if moveDir:magSq() > 0 then
        local currAng = self:getRot()
        local desiredAng = moveDir:angle()
        local delta = math.wrapAng(desiredAng - currAng)
        local newAng = currAng + math.clampMag(2 * dt * math.sign(delta), math.abs(delta)) + math.remap(math.random(), 0, 1, -0.001, 0.001)

        SCREENTEXT(currAng)
        SCREENTEXT(desiredAng)
        SCREENTEXT(delta)

        self:getBody():setAngle(newAng * math.tau)
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


