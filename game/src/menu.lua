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
    self.gameTitle = "Untitled!"

    self.stage = self.stage or MenuStage.Loading
    self.isPaused = self.isPaused or false
    self.wasPaused = self.wasPaused or false

    self.targetLevel = self.targetLevel or nil
    self.targetLevelIdx = self.targetLevelIdx or nil
    self.gameState = self.gameState or nil

    love.window.setTitle(self.gameTitle)
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
        suit.layout:reset(winW / 2 - menuW / 2, menuY, 5, 5) -- /* offX, offY, padX, padY */

        suit.Label(self.gameTitle, { align = "center", font = self.jfcBigFontForSuit }, suit.layout:row(menuW, 2 * menuButtonH))

        if suit.Button('Play', suit.layout:row(menuW, menuButtonH)).hit then
            self:gotoStage(MenuStage.Playing)
        end

    elseif self.stage == MenuStage.Playing then
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
    {
        label = "Pits",
        tiledmap = Engine:getAsset('src/maps/pits.lua'),
    },
    {
        label = "Back and Forth",
        tiledmap = Engine:getAsset('src/maps/back_and_forth.lua'),
    },
    {
        label = "Bloody Blood Blood",
        tiledmap = Engine:getAsset('src/maps/hand_fucking_coded.lua'),
    },
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
        self.gameState = GameState.new(self, { level = self.targetLevel, })
    end
    self.stage = newStage
end

function TheMenu:loadLevel(targetIdx)
    if targetIdx == 'curr' then
        targetIdx = self.targetLevelIdx
    elseif targetIdx == 'next' then
        targetIdx = math.indexWrap(self.targetLevelIdx + 1, #levels)
    end
    if levels[targetIdx] then
        self.targetLevelIdx = targetIdx
        self.targetLevel = levels[self.targetLevelIdx]
        self:gotoStage(MenuStage.Playing)
    end
end

function TheMenu:specialRender()
    local winW, winH = love.graphics.getDimensions()

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
        self:loadLevel('curr')
        return
    end

    if IS_DEBUG and key == 'f1' then
        self:gotoStage(MenuStage.Loading)
        return
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



