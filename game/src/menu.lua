local suit = require 'lib.suit'
local bitser = require 'lib.bitser'

TheMenu = Engine:EntityClass('TheMenu')

_G.MenuStage = {
    Loading = 0,
    MainMenu = 1,
    Playing = 2,
    Gameover = 3,
}

local DEFAULT_SETTINGS = {
    fullscreen = false,
    volume = 1
}

function TheMenu:loadPreferences()
    self.settings = DEFAULT_SETTINGS
    if love.filesystem.getInfo('userpreferences.lua') ~= nil then
        self.settings = util.mergeTables(self.settings, bitser.loadLoveFile('userpreferences.lua'))
        print("Loaded preferences")

        self.volumeSlider = { value = self.settings.volume, min = 0, max = 1 }
        love.audio.setVolume(self.settings.volume)
    end
end

function TheMenu:savePreferences()
    if self.settings then
        bitser.dumpLoveFile('userpreferences.lua', self.settings)
        print("Saved preferences")
    end
end

function TheMenu:setup()
    self:loadPreferences()

    --self.font = Engine:getAsset('fonts/HelvetiPixel.ttf:24').handle
    --self.bigFont = Engine:getAsset('fonts/HelvetiPixel.ttf:60').handle
    self.jfcFontForSuit = love.graphics.newFont('fonts/HelvetiPixel.ttf', 24)
    self.jfcBigFontForSuit = love.graphics.newFont('fonts/HelvetiPixel.ttf', 40)
    self.gameTitle = self.gameTitle or "Morning Gory"

    self.stage = self.stage or MenuStage.Loading
    self.stageChangeWallTime = self.stageChangeWallTime or love.timer.getTime()
    self.isPaused = util.default(self.isPaused, false)
    self.wasPaused = util.default(self.wasPaused, false)
    self.wasRestart = util.default(self.wasRestart, false)

    self.targetLevel = self.targetLevel or nil
    self.targetLevelIdx = self.targetLevelIdx or nil
    self.gameState = self.gameState or nil

    love.window.setTitle(self.gameTitle)

    self.ambientSound = self.ambientSound or Engine:getAsset('sfx/ambience.mp3')
    self.ambientSoundSource = self.ambientSoundSource or self.ambientSound.handle:clone()
    self.volumeSlider = self.volumeSlider or { value = self.settings.volume, min = 0, max = 1 }
    self.fadeFrac = self.fadeFrac or 0.0
end

function TheMenu:specialUpdate(time, dt)
    Engine.UP:pushEvent('menu special update')

    -- https://suit.readthedocs.io/en/latest/layout.html#
    local winW, winH = love.graphics.getDimensions()
    local menuW = 600
    local menuY = winH - 700
    local menuButtonH = 60

    local doCommonMenuButtons = function()

        if suit.Button('Toggle Fullscreen', { font = self.jfcBigFontForSuit }, suit.layout:row(menuW, menuButtonH)).hit then
            love.window.setFullscreen(not love.window.getFullscreen(), 'desktop')
        end

        if suit.Button("Quit Game", { font = self.jfcBigFontForSuit }, suit.layout:row(nil, menuButtonH)).hit then
            love.event.quit()
        end

        suit.Label("", { font = self.jfcFontForSuit }, suit.layout:row(200, 70))

        suit.layout:push(suit.layout:row(nil, 40))
        suit.Label("Master Volume", { font = self.jfcFontForSuit }, suit.layout:col(200, 20))
        if suit.Slider(self.volumeSlider, suit.layout:col(menuW - 240)).changed then
            self.settings.volume = self.volumeSlider.value
            love.audio.setVolume(self.settings.volume)
        end
        suit.Label(("%.02f"):format(self.volumeSlider.value), suit.layout:col(40))
        suit.layout:pop()

        suit.layout:push(suit.layout:row(nil, 140))
        if suit.Button("Cancel", { font = self.jfcFontForSuit }, suit.layout:col(menuW / 2 - 5 / 2, menuButtonH / 2)).hit then
            self:loadPreferences()
            self.isPaused = false
        end
        if suit.Button("Save", { font = self.jfcFontForSuit }, suit.layout:col(menuW / 2 - 5 / 2, menuButtonH / 2)).hit then
            self:savePreferences()
            if self.isPaused then self.isPaused = false end
        end
        suit.layout:pop()
    end

    suit.layout:reset(winW / 2 - menuW / 2, menuY, 5, 5) -- /* offX, offY, padX, padY */

    if self.stage == MenuStage.Loading then
        -- todo if loading starts to take a bit?
        self:gotoStage(MenuStage.MainMenu)

    elseif self.stage == MenuStage.MainMenu then
        --suit.layout:reset(winW / 2 - menuW / 2, 0.3 * winH - 100, 5, 5) -- /* offX, offY, padX, padY */
        --
        ----suit.Label(self.gameTitle, { align = "center", font = self.jfcBigFontForSuit }, suit.layout:row(menuW, 2 * menuButtonH))
        --suit.Label("", { align = "center", font = self.jfcBigFontForSuit }, suit.layout:row(menuW, 2 * menuButtonH))
        --
        --if suit.Button('Play', suit.layout:row(menuW, menuButtonH)).hit then
        --    self:gotoStage(MenuStage.Playing)
        --end

        suit.Label("", { align = "center", font = self.jfcBigFontForSuit }, suit.layout:row(menuW, 5 * menuButtonH))

        if suit.Button("Start Game", { font = self.jfcBigFontForSuit }, suit.layout:row(menuW, menuButtonH)).hit then
            self:loadLevel(1)
        end

        doCommonMenuButtons()

    elseif self.stage == MenuStage.Playing then

        if not self.ambientSoundSource:isPlaying() then
            self.ambientSoundSource:setVolume(0.1)
            self.ambientSoundSource:play()
            self.ambientSoundSource:setLooping(true)
        end

        if not love.window.hasFocus() and not IS_DEBUG then
            self.isPaused = true
        end

        if self.isPaused then
            if not self.wasPaused then
                Engine:onPause()
            end

            --suit.ImageButton(Engine:getAsset('art/ash.png').handle, suit.layout:row(menuW, 2 * menuButtonH))

            suit.Label("Paused", { align = "center", font = self.jfcBigFontForSuit }, suit.layout:row(menuW, 2 * menuButtonH))

            if suit.Button("Resume", { font = self.jfcBigFontForSuit }, suit.layout:row(nil, menuButtonH)).hit then
                self.isPaused = false
            end

            if suit.Button("Restart Level", { font = self.jfcBigFontForSuit }, suit.layout:row(nil, menuButtonH)).hit then
                self:loadLevel('curr', true)
                self.isPaused = false
            end

            if suit.Button("Skip Level", { font = self.jfcBigFontForSuit }, suit.layout:row(nil, menuButtonH)).hit then
                self:loadLevel('next')
                self.isPaused = false
            end

            if suit.Button("Restart Game", { font = self.jfcBigFontForSuit }, suit.layout:row(nil, menuButtonH)).hit then
                --self:loadLevel(1)
                --self.isPaused = false
                self:gotoStage(MenuStage.Loading)
            end

            doCommonMenuButtons()
        else
            if self.wasPaused then
                Engine:onResume()
            end
            Engine:accumulateUpdateTime(dt)

            if not GAMESTATE.player.alive then
                suit.layout:reset(winW / 2 - menuW / 2, menuY, 5, 5) -- /* offX, offY, padX, padY */

                suit.Label("Press R to restart", { align = "center", font = self.jfcBigFontForSuit }, suit.layout:row(menuW, 2 * menuButtonH))
            end
        end
        self.wasPaused = self.isPaused

        if self.gameState and self.gameState.player then
            self.gameState.player.inputActive = not suit.hasKeyboardFocus() and not self.isPaused
        end

    elseif self.stage == MenuStage.Gameover then

        suit.Label("", { align = "center", font = self.jfcBigFontForSuit }, suit.layout:row(menuW, 2 * menuButtonH))

        suit.Label("Thanks for playing!\n\nMorning Gory\nMade for Spring Jam 2021\nBy Ettiene, Keegan, Luke and Declan", { align = "center", font = self.jfcBigFontForSuit }, suit.layout:row(menuW, 8 * menuButtonH))

        if suit.Button("Continue", { font = self.jfcBigFontForSuit }, suit.layout:row(menuW, menuButtonH)).hit then
            self:gotoStage(MenuStage.Loading)
        end
    end

    if IS_DEBUG then
        love.window.setTitle(string.format('%s - %1.3fms / %3.1fFPS', self.gameTitle, love.timer.getAverageDelta() * 1000, love.timer.getFPS()))
    end

    Engine.UP:popEvent()
end

local levels = {
    { tiledmap = Engine:getAsset('src/maps/entrance.lua'), label = "Morning Gory", },
    { tiledmap = Engine:getAsset('src/maps/riseandshine.lua'), label = "Rise and Shine", },
    { tiledmap = Engine:getAsset('src/maps/spikes.lua'), label = "Spikes", },
    { tiledmap = Engine:getAsset('src/maps/back_and_forth.lua'), label = "Back and Forth", },
    { tiledmap = Engine:getAsset('src/maps/hallway_escape.lua'), label = "Hallway Escape", },
    { tiledmap = Engine:getAsset('src/maps/laser_push.lua'), label = "Light Grid", },
    { tiledmap = Engine:getAsset('src/maps/pits.lua'), label = "Pits", },
    { tiledmap = Engine:getAsset('src/maps/lighty_mcLightface.lua'), label = "Lighty McLightface", },
    { tiledmap = Engine:getAsset('src/maps/pipework.lua'), label = "Mission Probable", },
    { tiledmap = Engine:getAsset('src/maps/kaffeine withdrawal.lua'), label = "Kaffeine Withdrawal", },
    { tiledmap = Engine:getAsset('src/maps/tubular.lua'), label = "Tubular", },
    { tiledmap = Engine:getAsset('src/maps/rolling_out.lua'), label = "Rolling Out", },
    { tiledmap = Engine:getAsset('src/maps/seafloor_cavern.lua'), label = "Sea Floor Cavern", },
    { tiledmap = Engine:getAsset('src/maps/hide_and_seek.lua'), label = "Hide and Seek", },
}

if IS_DEBUG then
    local extraLevels = {
        { tiledmap = Engine:getAsset('src/maps/remote_control.lua'), label = "Remote Control", },
        { tiledmap = Engine:getAsset('src/maps/zigzag.lua'), label = "Zig Zag", },
    }
    for _, levelInfo in ipairs(extraLevels) do table.insert(levels, levelInfo) end
end

function TheMenu:gotoStage(newStage)
    if self.stage == MenuStage.Playing then
        self.gameState = Engine:Remove(self.gameState)
        self.isPaused = false
    end
    if newStage == MenuStage.Playing then
        if self.targetLevel == nil then
            self.targetLevelIdx = 1
            self.targetLevel = levels[self.targetLevelIdx]
        end
        GAMETIME = 0
        self.gameState = GameState.new(self, { level = self.targetLevel, })
    end
    self.stage = newStage
    self.stageChangeWallTime = love.timer.getTime()
end

function TheMenu:loadLevel(targetIdx, isRestart)
    self.fadeFrac = 1.0
    self.wasRestart = isRestart or false
    local isGameover = false
    if targetIdx == 'curr' then
        targetIdx = self.targetLevelIdx
    elseif targetIdx == 'next' then
        targetIdx = math.indexWrap(self.targetLevelIdx + 1, #levels)
        if targetIdx == 1 then
            isGameover = true
        end
    end
    if levels[targetIdx] then
        self.targetLevelIdx = targetIdx
        self.targetLevel = levels[self.targetLevelIdx]
        if not isGameover then
            self:gotoStage(MenuStage.Playing)
        else
            self:gotoStage(MenuStage.Gameover)
        end
    end
end

function TheMenu:setFade(frac)
    self.fadeFrac = frac
end

function TheMenu:specialRender()
    local winW, winH = love.graphics.getDimensions()

    if GAMETIME < 10.0 then
        self.fadeFrac = math.remapClamp(GAMETIME, 0, 1, 1, 0)
    end

    love.mouse.setVisible(self.stage ~= MenuStage.Playing or self.isPaused or IS_DEBUG)

    love.graphics.setColor(0, 0, 0, self.fadeFrac)
    love.graphics.rectangle('fill', 0, 0, winW, winH)

    local promptFont = Engine:getAsset('PromptFont')
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(promptFont.handle)

    --local text, showSplash = "", false
    --if self.stage == MenuStage.MainMenu then
    --    showSplash = true
    --    --text = controls .. "\nR to start game now."
    --elseif self.stage == MenuStage.Gameover then
    --    showSplash = true
    --    text = "Thanks for playing!\n\nMorning Gory\nMade for Spring Jam 2021\nBy Ettiene, Keegan, Luke and Declan\n\n\nPress any key to continue."
    --elseif self.stage == MenuStage.Playing and self.isPaused then
    --    text = "ESCAPE to resume.\nF to toggle fullscreen."
    --end

    if self.isPaused then
        love.graphics.setColor(0, 0, 0, 0.7)
        love.graphics.rectangle('fill', 0, 0, winW, winH)
    end
    if self.stage == MenuStage.Playing and not GAMESTATE.player.alive then
        love.graphics.setColor(1, 0, 0, 0.1)
        love.graphics.rectangle('fill', 0, 0, winW, winH)
    end

    if self.stage == MenuStage.MainMenu or self.stage == MenuStage.Gameover then
        local img = Engine:getAsset('art/ash.png').handle
        local vertSize = winH / 720 * 400
        local scale = vertSize / img:getHeight()
        local imgSize = Vec(img:getWidth(), img:getHeight()) * scale
        love.graphics.draw(img, winW / 2 - imgSize.x / 2, 30, 0, scale, scale)
    end
    if self.stage == MenuStage.Gameover then
        -- AAAAAAHHHHH
        love.graphics.setColor(0, 0, 0, 0.4)
        love.graphics.rectangle('fill', (winW - 600) / 2, winH - 360, 600, winH)
    end
    if self.stage == MenuStage.MainMenu or (self.stage == MenuStage.Playing and self.isPaused) then
        local scale = math.remapClamp(winH, 720, 1440, 0.45, 0.7)
        local controls = "WASD or ARROW KEYS to move.\nE or SPACE to interact.\nSHIFT to accelerate time.\nR to restart."
        local textW, lineH = promptFont.handle:getWidth(controls) * scale, promptFont.handle:getHeight(controls) * scale
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.printf(controls, winW - textW - 15, winH - 5 * lineH, 1200, 'left', 0, scale, scale)
    end

    love.graphics.reset()
    love.graphics.push()
    suit.draw()
    love.graphics.pop()
end

function TheMenu:onKeyPressed(key, scancode, isrepeat)
    if suit.hasKeyboardFocus() then
        suit.keypressed(key)
        return
    end

    if isrepeat then return end

    --if self.stage == MenuStage.Gameover and love.timer.getTime() > self.stageChangeWallTime + 0.6 then
    --    self:gotoStage(MenuStage.MainMenu)
    --end

    if key == 'escape' and self.stage == MenuStage.Playing then
        self.isPaused = not self.isPaused
        return
    end

    if key == 'r' and self.stage == MenuStage.Playing then
        self:loadLevel('curr', true)
        return
    end

    if key == 'r' and self.stage == MenuStage.MainMenu then
        self:gotoStage(MenuStage.Playing)
    end

    --if key == 'f' then
    --    love.window.setFullscreen(not love.window.getFullscreen(), 'desktop')
    --end

    if IS_DEBUG and key == 'f1' then
        self:gotoStage(MenuStage.Loading)
        return
    end

    if IS_DEBUG and key == 'f12' then
        self:gotoStage(MenuStage.Gameover)
        return
    end

    if IS_DEBUG and key == 'f5' then
        self:loadLevel('next')
    end

    if self.gameState and self.gameState.player then
        self.gameState.player:onKeyPressed(key, scancode)
    end

end

function TheMenu:onKeyReleased(key, scancode)
    if self.gameState and self.gameState.player then
        self.gameState.player:onKeyReleased(key, scancode)
    end
end

function TheMenu:onTextEdited(text, start, length)
    suit.textedited(text, start, length)
end

function TheMenu:onTextInput(text)
    suit.textinput(text)
end

function TheMenu:onMouseWheel(dx, dy)
    --if Engine.camera then
    --    local rate = 0.3
    --    Engine.camera:setZoomScale(Engine.camera:getZoomScale() * (dy < 0 and (1 + rate) or 1 / (1 + rate)))
    --end
end



