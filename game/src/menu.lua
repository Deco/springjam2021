local suit = require 'lib.suit'

TheMenu = Engine:EntityClass('TheMenu')

_G.MenuStage = {
    Loading = 0,
    MainMenu = 1,
    Playing = 2,
    Gameover = 3,
}

function TheMenu:setup()
    --self.font = Engine:getAsset('fonts/HelvetiPixel.ttf:24').handle
    --self.bigFont = Engine:getAsset('fonts/HelvetiPixel.ttf:60').handle
    self.jfcFontForSuit = love.graphics.newFont('fonts/HelvetiPixel.ttf', 24)
    self.jfcBigFontForSuit = love.graphics.newFont('fonts/HelvetiPixel.ttf', 60)
    self.gameTitle = "Morning Gory"

    self.stage = self.stage or MenuStage.Loading
    self.isPaused = util.default(self.isPaused, false)
    self.wasPaused = util.default(self.wasPaused, false)
    self.wasRestart = util.default(self.wasRestart, false)

    self.targetLevel = self.targetLevel or nil
    self.targetLevelIdx = self.targetLevelIdx or nil
    self.gameState = self.gameState or nil

    love.window.setTitle(self.gameTitle)

    self.ambientSound = Engine:getAsset('sfx/Dark_Amb.mp3')
    self.ambientSoundSource = self.ambientSound.handle:clone()

    self.fadeFrac = 0.0

    self.thanksForPlaying = false
end

function TheMenu:specialUpdate(time, dt)
    Engine.UP:pushEvent('menu special update')

    -- https://suit.readthedocs.io/en/latest/layout.html#
    local winW, winH = love.graphics.getDimensions()
    local menuW = 400
    local menuY = 130
    local menuButtonH = 80

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
        --
        --if suit.Button('Toggle Fullscreen', suit.layout:row(menuW, menuButtonH)).hit then
        --    love.window.setFullscreen(not love.window.getFullscreen(), 'desktop')
        --end

    elseif self.stage == MenuStage.Playing then

        if not self.ambientSoundSource:isPlaying() then
            self.ambientSoundSource:setVolume(0.1)
            self.ambientSoundSource:play()
            self.ambientSoundSource:setLooping(true)
        end

        if self.isPaused then
            if not self.wasPaused then
                Engine:onPause()
            end
            suit.layout:reset(winW / 2 - menuW / 2, menuY, 5, 5) -- /* offX, offY, padX, padY */

            suit.Label("Paused", { align = "center", font = self.jfcBigFontForSuit }, suit.layout:row(menuW, 2 * menuButtonH))
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
        -- todo
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
    { tiledmap = Engine:getAsset('src/maps/hide_and_seek.lua'), label = "Hide and Seek", },

    { tiledmap = Engine:getAsset('src/maps/laser_push.lua'), label = "Light Grid", },
    { tiledmap = Engine:getAsset('src/maps/zigzag.lua'), label = "Zig Zag", },
    { tiledmap = Engine:getAsset('src/maps/pits.lua'), label = "Pits", },
    { tiledmap = Engine:getAsset('src/maps/seafloor_cavern.lua'), label = "Sea Floor Cavern", },
    { tiledmap = Engine:getAsset('src/maps/lighty_mcLightface.lua'), label = "Lighty McLightface", },
    { tiledmap = Engine:getAsset('src/maps/pipework.lua'), label = "Mission Probable", },
    { tiledmap = Engine:getAsset('src/maps/tubular.lua'), label = "Tubular", }
}

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
end

function TheMenu:loadLevel(targetIdx, isRestart)
    self.fadeFrac = 1.0
    self.wasRestart = isRestart
    if targetIdx == 'curr' then
        targetIdx = self.targetLevelIdx
    elseif targetIdx == 'next' then
        targetIdx = math.indexWrap(self.targetLevelIdx + 1, #levels)
        self.thanksForPlaying = (targetIdx < self.targetLevelIdx)
    end
    if levels[targetIdx] then
        self.targetLevelIdx = targetIdx
        self.targetLevel = levels[self.targetLevelIdx]
        self:gotoStage(MenuStage.Playing)
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

    love.graphics.setColor(0, 0, 0, self.fadeFrac)
    love.graphics.rectangle('fill', 0, 0, winW, winH)

    local promptFont = Engine:getAsset('PromptFont')
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(promptFont.handle)
    local text = ""
    if self.stage == MenuStage.MainMenu then
        text = "WASD or ARROW KEYS to move.\nE or SPACE to interact.\nR to restart.\nEscape to pause.\n\nF to toggle fullscreen.\nR to start game now."
    elseif self.thanksForPlaying then
        text = "Thanks for playing!\n\nMorning Gory\nMade for Spring Jam 2021\nBy Ettiene, Keegan, Luke and Declan"
    end
    local textW, textH = promptFont.handle:getWidth(text), promptFont.handle:getHeight(text)
    love.graphics.printf(text, winW / 2 - 1200 / 2, winH / 2 - 130, 1200, 'center')
    if text ~= "" then
        local img = Engine:getAsset('art/Morning_Gory.png').handle
        love.graphics.draw(img, winW / 2 - img:getWidth() / 2, winH / 2 - img:getHeight() / 2 - 240)
    end

    if self.isPaused then
        love.graphics.setColor(0, 0, 0, 0.7)
        love.graphics.rectangle('fill', 0, 0, winW, winH)
    end
    if self.stage == MenuStage.Playing and not GAMESTATE.player.alive then
        love.graphics.setColor(1, 0, 0, 0.1)
        love.graphics.rectangle('fill', 0, 0, winW, winH)
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

    if key == 'f' then
        love.window.setFullscreen(not love.window.getFullscreen(), 'desktop')
    end

    if IS_DEBUG and key == 'f1' then
        self:gotoStage(MenuStage.Loading)
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



