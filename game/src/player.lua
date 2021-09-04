Player = Engine:EntityClass('Player')

local playerSize = 0.4

function Player:setup(data)
    --self.renderDepth = 20
    self.directionInfo = {
        [Cardinal.Up] = {
            desired = false,
            idle = Engine:getAsset('art/player/idle_up.png'),
            moving = Engine:getAsset('art/player/walking_up-sheet.png'),
        },
        [Cardinal.Right] = {
            desired = false,
            idle = Engine:getAsset('art/player/idle_right.png'),
            moving = Engine:getAsset('art/player/walking_right-sheet.png'),
        },
        [Cardinal.Down] = {
            desired = false,
            idle = Engine:getAsset('art/player/idle_down.png'),
            moving = Engine:getAsset('art/player/walking_down-sheet.png'),
        },
        [Cardinal.Left] = {
            desired = false,
            idle = Engine:getAsset('art/player/idle_left.png'),
            moving = Engine:getAsset('art/player/walking_left-sheet.png'),
        },
    }
    self.inputActive = false
    self.lastMoveDir = self.lastMoveDir or Cardinal.Right
    BasicEntSetup(self, data)

    self.lastMoveTime = self.lastMoveTime or 0

    self.alive = util.default(self.alive, true)

    self.topPrompts = {}

    self.inventory = self.inventory or {}
    self.inventory.coffee = self.inventory.coffee or {
        order = 0,
        niceName = "VAMPIRE COFFEE",
        image = Engine:getAsset('art/coffee.png'),
        count = 0,
    }
    self.inventory.goldenKey = self.inventory.goldenKey or {
        order = 1,
        niceName = "GOLDEN KEY",
        image = Engine:getAsset('art/golden-key.png'),
        count = 0,
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
    self:showTopPrompt("Obtained 1x " .. self.inventory[kind].niceName)
end

function Player:takeItem(kind)
    assert(self.inventory[kind].count > 0)
    self.inventory[kind].count = self.inventory[kind].count - 1
    self:showTopPrompt("Used 1x " .. self.inventory[kind].niceName)
end

function Player:showTopPrompt(msg, color, duration)
    duration = duration or 2.0
    table.insert(self.topPrompts, { t = GAMETIME, d = duration, c = color or { 1, 1, 1 }, msg = msg })
end

function Player:render(dt, isMoving)
    if self.alive then
        love.graphics.setColor(1, 1, 1, 1)
    else
        love.graphics.setColor(0.3, 0, 0, 1)
    end
    local ass = self.directionInfo[self.lastMoveDir]
    if self.alive then
        DrawSimpleEntAnim(self, ass.moving, 2 * GAMETIME)
    else
        DrawSimpleEntImage(self, ass.idle)
    end

    --love.graphics.setColor(1, 1, 0, 1)
    --love.graphics.line(-10, 0, 10, 0)
    --love.graphics.line(0, -10, 0, 10)
end

function Player:screenRender()
    local promptFont = Engine:getAsset('PromptFont')
    local text = ""
    for _, candidate in ipairs(self:getUseCandidates()) do
        text = text .. (candidate:getUsePrompt(self) or "") .. "\n"
    end
    local textW = promptFont.handle:getWidth(text) * SCREENTEXTSCALE
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(promptFont.handle)
    love.graphics.print(text, 250 - textW / 2, 160, 0, SCREENTEXTSCALE, SCREENTEXTSCALE)

    for topPromptIdx, topPromptInfo in ipairs(self.topPrompts) do
        local textSize = Vec(promptFont.handle:getWidth(topPromptInfo.msg), promptFont.handle:getHeight()) * SCREENTEXTSCALE
        local slideIn = math.remapClamp(GAMETIME - topPromptInfo.t, 0.0, 0.2, -5.0, 0.0)
        local alphaOut = math.remapClamp(GAMETIME - topPromptInfo.t, topPromptInfo.d - 0.2, topPromptInfo.d, 1.0, 0.0)
        love.graphics.setColor(topPromptInfo.c[1], topPromptInfo.c[2], topPromptInfo.c[3], alphaOut)
        love.graphics.print(topPromptInfo.msg, 250 - textSize.x / 2, 20 + (textSize.y * 1.1) * (topPromptIdx - 1) + slideIn, 0, SCREENTEXTSCALE, SCREENTEXTSCALE)
    end
    self.topPrompts = util.filterList(self.topPrompts, function(tpi) return GAMETIME < tpi.t + tpi.d end)

    local inv = util.tablePairs(self.inventory)
    table.sort(inv, function(a, b) return a.val.order < b.val.order end)
    love.graphics.setColor(0.1, 0.1, 0.1, 0.5)
    love.graphics.rectangle('fill', 25, 225, 6 + 20 * #inv, 26)
    for entryIdx, entry in ipairs(inv) do
        local info = entry.val

        --love.graphics.draw(info.image.handle, 0.03 + 0.04 * winSize.x, 0.9 * winSize.y)
        love.graphics.setColor(1, 1, 1, 0.3)
        love.graphics.rectangle('line', 30 + 20 * (entryIdx - 1), 230, 16, 16)
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.draw(info.image.handle, 30 + 20 * (entryIdx - 1), 230, 0, 16 / info.image.size.x, 16 / info.image.size.y)
        love.graphics.print('x' .. info.count, 40 + 20 * (entryIdx - 1), 240, 0, 0.2, 0.2)
    end
end

function Player:onKeyPressed(key, scancode)

    if key == 'up' or key == 'w' then self.directionInfo[Cardinal.Up].desired = true end
    if key == 'left' or key == 'a' then self.directionInfo[Cardinal.Left].desired = true end
    if key == 'down' or key == 's' then self.directionInfo[Cardinal.Down].desired = true end
    if key == 'right' or key == 'd' then self.directionInfo[Cardinal.Right].desired = true end
    --if key == 'p' then
    --    local source = love.audio.newSource('sfx/explosion1.wav', 'static')
    --    source:play()
    --end
    if key == 'space' or key == 'e' then
        for _, candidate in ipairs(self:getUseCandidates()) do
            candidate:onUse(self)
        end
    end
    if key == 'l' then
        --self:showTopPrompt("Testing! Testing! Testing! Testing! Testing!")
        SpawnVFX('art/fx/explosion.png', self:getPos())
    end
end

function Player:onKeyReleased(key, scancode)
end


