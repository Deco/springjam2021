Player = Engine:EntityClass('Player')

local playerSize = 0.4

function Player:setup(data)
    self.renderDepth = 20
    self.image_dir_set = {
        [Cardinal.Up] = Engine:getAsset('art/player/idle_up.png'),
        [Cardinal.Right] = Engine:getAsset('art/player/idle_right.png'),
        [Cardinal.Down] = Engine:getAsset('art/player/idle_down.png'),
        [Cardinal.Left] = Engine:getAsset('art/player/idle_left.png'),
    }
    self.inputActive = false
    self.lastMoveDir = self.lastMoveDir or Cardinal.Right
    BasicEntSetup(self, data)

    self.lastMoveTime = self.lastMoveTime or 0

    self.alive = util.default(self.alive, true)

    self.topPrompts = {}

    self.inventory = {
        coffee = {
            order = 0,
            niceName = "VAMPIRE COFFEE",
            image = Engine:getAsset('art/coffee.png'),
            count = 0,
        },
        key = {
            order = 1,
            niceName = "GOLDEN KEY",
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
    local moveDir = nil
    if love.keyboard.isDown('up') or love.keyboard.isDown('w') then moveDir = Cardinal.Up end
    if love.keyboard.isDown('left') or love.keyboard.isDown('a') then moveDir = Cardinal.Left end
    if love.keyboard.isDown('down') or love.keyboard.isDown('s') then moveDir = Cardinal.Down end
    if love.keyboard.isDown('right') or love.keyboard.isDown('d') then moveDir = Cardinal.Right end

    if moveDir ~= nil and GAMETIME >= self.lastMoveTime + 10 * ONETICK then
        self.lastMoveTime = GAMETIME
        self:tryMove(moveDir)
        --self:setRot(moveDir)
        self.lastMoveDir = moveDir
    end
end

function Player:onTouch(other)
    if other.class == Key then
        self:giveItem('goldenKey')
        Engine:Remove(other)
    elseif other.class == Coffee then
        self:giveItem('coffee')
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
    DrawSimpleEntImage(self, self.image_dir_set[self.lastMoveDir], playerSize)

    --love.graphics.setColor(1, 1, 0, 1)
    --love.graphics.line(-10, 0, 10, 0)
    --love.graphics.line(0, -10, 0, 10)
end

function Player:getUseCandidates()
    local facingPos = self:getPos() + math.cardinalToOffset(self.lastMoveDir)
    local facingCell = WORLD:getCell(facingPos)
    local candidates = {}
    for ent in pairs(facingCell.entsSet) do
        if rawget(ent, 'onUse') then
            table.insert(candidates, ent)
        end
    end
    return candidates
end

function Player:hasItem(kind)
    return self.inventory[kind].count > 0
end

function Player:giveItem(kind)
    self.inventory[kind].count = self.inventory[kind].count + 1
    table.insert(self.topPrompts, { t = GAMETIME, d = 2.0, msg = "Obtained 1x " .. self.inventory[kind].niceName })
end

function Player:takeItem(kind)
    assert(self.inventory[kind].count > 0)
    self.inventory[kind].count = self.inventory[kind].count - 1
    table.insert(self.topPrompts, { t = GAMETIME, d = 2.0, msg = "Used 1x " .. self.inventory[kind].niceName })
end

function Player:screenRender()
    local promptFont = Engine:getAsset('PromptFont')
    local winSize = Vec(love.graphics.getDimensions())
    local text = ""
    for _, candidate in ipairs(self:getUseCandidates()) do
        text = text .. (candidate:getUsePrompt() or "") .. "\n"
    end
    local textW = promptFont.handle:getWidth(text)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(promptFont.handle)
    love.graphics.print(text, winSize.x / 2 - textW / 2, winSize.y * 0.8)

    --for topPromptIdx, topPromptInfo in ipairs()
    --local textW = promptFont.handle:getWidth(text)
    --love.graphics.setColor(1, 1, 1, 1)
    --love.graphics.setFont(promptFont.handle)
    --love.graphics.print(text, winSize.x / 2 - textW / 2, winSize.y * 0.8)

    local inv = util.tablePairs(self.inventory)
    table.sort(inv, function(a, b) return a.val.order < b.val.order end)
    love.graphics.setColor(0.1, 0.1, 0.1, 0.5)
    love.graphics.rectangle('fill', 25, 175, 6 + 20 * #inv, 26)
    for entryIdx, entry in ipairs(inv) do
        local info = entry.val

        --love.graphics.draw(info.image.handle, 0.03 + 0.04 * winSize.x, 0.9 * winSize.y)
        love.graphics.setColor(1, 1, 1, 0.3)
        love.graphics.rectangle('line', 30 + 20 * (entryIdx - 1), 180, 16, 16)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(info.image.handle, 30 + 20 * (entryIdx - 1), 180, 0, 16/info.image.size.x, 16/info.image.size.y)
        love.graphics.print('x'..info.count, 40 + 20 * (entryIdx - 1), 190, 0, 0.2, 0.2)
    end
end

function Player:onKeyPressed(key, scancode)
    --if key == 'p' then
    --    local source = love.audio.newSource('sfx/explosion1.wav', 'static')
    --    source:play()
    --end
    if key == 'space' or key == 'e' then
        for _, candidate in ipairs(self:getUseCandidates()) do
            candidate:onUse(self)
        end
    end
end

function Player:onKeyReleased(key, scancode)
end


