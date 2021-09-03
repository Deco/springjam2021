Player = Engine:EntityClass('Player')

local playerSize = 0.4

function Player:setup(data)
    self.renderDepth = 20
    self.image_dir_set = {
        {Cardinal.Up = Engine:getAsset('art/player/idle_u.png')},
        {Cardinal.Left = Engine:getAsset('art/player/idle.png')},
        {Cardinal.Down = Engine:getAsset('art/player/idle.png')},
        {Cardinal.Right = Engine:getAsset('art/player/idle.png')}
    self.inputActive = false
    self.moveDir = nil
    BasicEntSetup(self, data)

    self.lastMoveTime = 0

    self.alive = util.default(self.alive, true)

    self.inventory = {
        coffee = {
            order = 0,
            image = Engine:getAsset('art/coffee.png'),
            count = 0,
        },
        key = {
            order = 1,
            image = Engine:getAsset('art/key.png'),
            count = 0,
        },
    }
end

function Player:spawned()
    --
end

function Player:update(time, dt)
    if self.inputActive then
        self:processInput(time, dt)
    end
end

function Player:processInput(time, dt)
    if not self.alive then return end
    self.moveDir = nil
    if love.keyboard.isDown('w') then self.moveDir = Cardinal.Up end
    if love.keyboard.isDown('a') then self.moveDir = Cardinal.Left end
    if love.keyboard.isDown('s') then self.moveDir = Cardinal.Down end
    if love.keyboard.isDown('d') then self.moveDir = Cardinal.Right end

    if self.moveDir ~= nil and GAMETIME >= self.lastMoveTime + 20 * ONETICK then
        self.lastMoveTime = GAMETIME
        self:tryMove(moveDir)
        self:setRot(moveDir)
    end
end

function Player:onTouch(other)
    if other.class == Key then
        self.inventory.key.count = self.inventory.key.count + 1
        Engine:Remove(other)
    elseif other.class == Coffee then
        self.inventory.coffee.count = self.inventory.coffee.count + 1
        Engine:Remove(other)
    elseif other.class == Spikes or other.class == Vampire then
        self.alive = false
        print('DEAD')
    end
end

function Player:render()
    if self.alive then
        love.graphics.setColor(1, 1, 1, 1)
    else
        love.graphics.setColor(0.3, 0, 0, 1)
    end
    DrawSimpleEntImage(self, self.image_dir_set(self.moveDir), playerSize)

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


