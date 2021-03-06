Player = Engine:EntityClass('Player')

local playerSize = 0.4

function Player:setup(data)
    self.renderDepth = RenderingDepth.Player
    self.directionInfo = {
        [Cardinal.Up] = {
            keys = { 'up', 'w' },
            desired = false,
            idle = Engine:getAsset('art/player/idle_up.png'),
            moving = Engine:getAsset('art/player/walking_up-sheet.png'),
            die = nil,
        },
        [Cardinal.Right] = {
            keys = { 'right', 'd' },
            desired = false,
            idle = Engine:getAsset('art/player/idle_right.png'),
            moving = Engine:getAsset('art/player/walking_right-sheet.png'),
            die = Engine:getAsset('art/player/die_right-sheet.png'),
        },
        [Cardinal.Down] = {
            keys = { 'down', 's' },
            desired = false,
            idle = Engine:getAsset('art/player/idle_down.png'),
            moving = Engine:getAsset('art/player/walking_down-sheet.png'),
            die = nil,
        },
        [Cardinal.Left] = {
            keys = { 'left', 'a' },
            desired = false,
            idle = Engine:getAsset('art/player/idle_left.png'),
            moving = Engine:getAsset('art/player/walking_left-sheet.png'),
            die = Engine:getAsset('art/player/die_left-sheet.png'),
        },
    }
    self.inputActive = util.default(true, self.inputActive)
    self.movedAtAll = util.default(false, self.movedAtAll)
    self.lastMoveDir = self.lastMoveDir or Cardinal.Right
    self.lastHorzMoveDir = self.lastHorzMoveDir or Cardinal.Right
    BasicEntSetup(self, data)

    self.lastMoveTime = self.lastMoveTime or 0

    self.alive = util.default(self.alive, true)
    self.deathTime = self.deathTime or nil

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

function Player:blocksLight() return true end
function Player:activatesFloorSensors() return true end

function Player:spawned()
    --
end

function Player:update(time, dt)
    if Engine.menu.targetLevelIdx == 1 and not Engine.menu.wasRestart and GAMETIME < 4.0 then
        -- aaaahhhh
        GAMESTATE.player._lastPos = WORLD.playerStartPos + Vec(0, -20)
        for dir, dirInfo in pairs(self.directionInfo) do
            dirInfo.desired = false
        end

    elseif self.inputActive then
        self:processInput(time, dt)
    end
    SCREENTEXT(self:getPos())
end

function Player:processInput(time, dt)
    if not self.alive then return end

    if Engine.menu.targetLevelIdx == 1 and not Engine.menu.wasRestart and GAMETIME < 1.5 then
        for dir, dirInfo in pairs(self.directionInfo) do
            dirInfo.desired = false
        end
        return
    end
    if GAMETIME >= self.lastMoveTime + 10 * ONETICK then
        local someMoveDir = nil
        local possibleDirs = {}
        for dir, dirInfo in pairs(self.directionInfo) do
            local isDown = dirInfo.desired or util.some(dirInfo.keys, function(key) return love.keyboard.isDown(key) end)
            if isDown then
                someMoveDir = dir
                local canMove = self:tryMove(dir, true)
                if canMove then
                    table.insert(possibleDirs, dir)
                end
            end
        end
        if #possibleDirs >= 2 then
            possibleDirs = util.filterList(possibleDirs, function(dir) return dir ~= self.lastMoveDir end)
        end
        if #possibleDirs >= 1 then
            local moveDir = possibleDirs[1]
            self.lastMoveTime = GAMETIME
            self:tryMove(moveDir)
            self.movedAtAll = true
            EmitSound({
                'sfx/robe_walk_01.ogg',
                'sfx/robe_walk_02.ogg',
                'sfx/robe_walk_03.ogg',
                'sfx/robe_walk_04.ogg',
                'sfx/robe_walk_05.ogg',
                'sfx/robe_walk_06.ogg',
                'sfx/robe_walk_07.ogg',
                'sfx/robe_walk_08.ogg',
                'sfx/robe_walk_09.ogg',
                'sfx/robe_walk_10.ogg',
                'sfx/robe_walk_11.ogg'
            }, self, { pitch = util.randomRange(0.9, 1.1), })
            self.lastMoveDir = moveDir
        elseif someMoveDir then
            self.lastMoveDir = someMoveDir
        end
        if self.lastMoveDir == Cardinal.Left or self.lastMoveDir == Cardinal.Right then
            self.lastHorzMoveDir = self.lastMoveDir
        end

        for dir, dirInfo in pairs(self.directionInfo) do
            dirInfo.desired = false
        end
    end
end

function Player:onKeyPressed(key, scancode)
    if not self.inputActive then return end

    for dir, dirInfo in pairs(self.directionInfo) do
        if util.some(dirInfo.keys, function(dirKey) return dirKey == key end) then
            dirInfo.desired = true
        end
    end

    --if key == 'p' then
    --    local source = love.audio.newSource('sfx/explosion1.wav', 'static')
    --    source:play()
    --end
    if key == 'space' or key == 'e' then
        for _, candidate in ipairs(self:getUseCandidates()) do
            candidate:onUse(self)
        end
    end
    if key == 'b' then
        --EmitSound('sfx/beanslol', self)
    end
    if IS_DEBUG and key == 'l' then
        --self:showTopPrompt("Testing! Testing! Testing! Testing! Testing!")
        --SpawnVFX('art/fx/explosion.png', self:getPos())
        --WORLD:pathFind(self:getPos(), Vec(3, 3))
        --EmitSound('sfx/Beans.ogg', self)
        EmitSound('sfx/Dragon_Growl_01.ogg', self)
    end
end

function Player:onTouch(other)
    if other.class == Key then
        self:giveItem('goldenKey')
        EmitSound({ 'sfx/Key_Get_00.ogg', 'sfx/Key_Get_01.ogg' }, self)
        Engine:Remove(other)
    elseif other.class == Coffee then
        EmitSound('sfx/bottle.ogg', self)
        self:giveItem('coffee')
        Engine:Remove(other)
    elseif other.class == Spikes then
        self:youAreDead()
        print('DEAD')
    elseif other.class == Vampire and other.stage ~= VampireStage.Dust and other.stage ~= VampireStage.Dying then
        self:youAreDead()
        print('DEAD')
    elseif other.class == Salt then
        EmitSound({
            'sfx/snow_walk_01.ogg',
            'sfx/snow_walk_02.ogg',
            --'sfx/salt_walk_03.ogg',
            --'sfx/salt_walk_04.ogg',
            --'sfx/salt_walk_05.ogg'
        }, self)
    end
end

function Player:youAreDead()
    if self.alive then
        self.alive = false
        self.deathTime = GAMETIME
        EmitSound('sfx/death.ogg', self, { pitch = util.randomRange(0.6, 0.66), })
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
        love.graphics.getBlendMode("lighten")
        love.graphics.setColor(5, 5, 1, 1)
    else
        love.graphics.setColor(0.3, 0, 0, 1)
    end
    local ass = self.directionInfo[self.lastMoveDir]
    if Engine.menu.targetLevelIdx == 1 and not Engine.menu.wasRestart and GAMETIME < 4.5 then
        DrawSimpleEntAnim(self, self.directionInfo[Cardinal.Right].die, math.remapClamp(GAMETIME, 0.6, 3.5, 1.0, 0.0))
    elseif self.alive then
        DrawSimpleEntAnim(self, ass.moving, 2 * GAMETIME)
    else
        --DrawSimpleEntImage(self, ass.idle)
        ass = self.directionInfo[self.lastHorzMoveDir]
        DrawSimpleEntAnim(self, ass.die, math.remapClamp(GAMETIME - self.deathTime, 0, 0.6, 0.0, 1.0))
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
    if GAMETIME > self.lastMoveTime + (self.movedAtAll and 45.0 or 7.0) then
        text = text .. "WASD or ARROW KEYS to move.\n"
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

function Player:onKeyReleased(key, scancode)
end


