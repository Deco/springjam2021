--
local sti = require("lib.sti")
local openal_presets = require "lib.openal_presets"

GMAKER 'Engine' -- singleton

Engine.entityClassInfoMap = Engine.entityClassInfoMap or {}
local function getEntityClassInfo(class)
    return util.getOrPut(Engine.entityClassInfoMap, class, function() return SHAPED({
        instancesSet = {},
    }) end)
end

Engine.assetKeyInfoMap = Engine.assetKeyInfoMap or {}

GMAKER 'GAMETIME'
_G.GAMETIME = type(_G.GAMETIME) == 'table' and -1 or _G.GAMETIME -- aaahh
_G.ONETICK = 1 / 60
_G.SCREENTEXTSCALE = 0.2

_G.ProfileMode = {
    Off = 0,
    Running = 1,
    Paused = 2,
}

function Engine:load(args)
    -- Only runs when the game launches!
    self.profileMode = ProfileMode.Off
    self.debugDraw = false
    self.DP = PROBE.new()
    self.DP:enable(true)
    self.UP = PROBE.new()
    self.UP:enable(true)
    self.lastDrawTime = 0

    self.timeRate = self.timeRate or 1
    self.entitiesList = {}
    self.tempEntitiesList = nil
    self.nextId = 0
    self.accumulatedUpdateTime = 0
    self.entitiesThatJustDiedList = {}
    self.drawDebugText = {}
    self.updateDebugText = {}
    self.debugText = nil
    self.blockSpawned = false

    self.menu = TheMenu.new('special case for root')
    self.camera = nil
end

function Engine:callEntMethod(ent, methodName, additionalsName, ...)
    if additionalsName ~= nil then
        local additionals = rawget(ent, additionalsName)
        if additionals then
            for additionalKey, func in pairs(additionals) do
                wrap(func, ent, ...)
            end
        end
    end
    local func = rawget(ent, methodName)
    if func then
        wrap(func, ent, ...)
    end
end

local entityMetaExtensions = {
    __tostring = function(self) return string.format('[%s E%i%s]', self.__name, self.id, self.valid and '' or ' INVALID') end,
}
function Engine:EntityClass(name)
    local class = GMAKER(name)
    local classInfo = getEntityClassInfo(class)

    for instance in pairs(classInfo.instancesSet) do
        HOTSTUFF(function()
            BLOCK_NONREPEATABLE_STUFF = true
            util.autoShape(instance,
                function() util.copyFromTo(class, instance) end,
                function() if instance.setup then instance:setup(instance._initData) end end,
                entityMetaExtensions
            )
            BLOCK_NONREPEATABLE_STUFF = false
        end)
    end

    class.new = function(owner, initData)
        if BLOCK_NONREPEATABLE_STUFF and class ~= Cell then maybeError(string.format("Noooo you can't create entities here!")) end
        local instance = {
            valid = true,
            owner = owner,
            id = self.nextId,
            class = class,
            ownedSet = {},
            _initData = initData,
            _hooks_Update = {},
        }
        self.nextId = self.nextId + 1
        classInfo.instancesSet[instance] = true
        if not rawget(class, 'dontPutInEntitiesList') then
            table.insert(self.entitiesList, instance)
        end
        if self.tempEntitiesList ~= nil then table.insert(self.tempEntitiesList, instance) end
        if type(owner) ~= 'string' then
            --print(string.format("[%s E%i] -> [%s E%i]", owner.__name, owner.id, name, instance.id))
            owner.ownedSet[instance] = true
        end

        BLOCK_NONREPEATABLE_STUFF = true
        util.autoShape(instance,
            function()
                util.copyFromTo(class, instance, function(k) return k ~= "new" end)
            end,
            function()
                if instance.setup then instance:setup(initData) end
            end,
            entityMetaExtensions
        )
        BLOCK_NONREPEATABLE_STUFF = false

        if not self.blockSpawned then
            self:callEntMethod(instance, 'spawned', nil)
            if WORLD and WORLD.valid then WORLD:onEntSpawned(instance) end
        end

        return instance
    end

    return class
end

function Engine:Remove(ent)
    if not ent.valid then return end
    --print(string.format("[%s E%i] X", ent.__name, ent.id))

    local cellIn = rawget(ent, '_cellIn')
    if cellIn then
        cellIn.entsSet[ent] = nil
    end

    ent.valid = false
    self:callEntMethod(ent, 'removed', nil)
    ent.owner.ownedSet[ent] = nil
    if not rawget(ent.class, 'dontPutInEntitiesList') then
        table.remove(self.entitiesList, util.findIndex(self.entitiesList, ent))
    end
    if self.tempEntitiesList ~= nil then table.remove(self.tempEntitiesList, util.findIndex(self.tempEntitiesList, ent)) end
    local entityClassInfo = getEntityClassInfo(ent.class)
    entityClassInfo.instancesSet[ent] = nil
    for owned in pairs(ent.ownedSet) do
        Engine:Remove(owned)
    end
    table.insert(self.entitiesThatJustDiedList, ent)
    return nil
end

function Engine:update(time, dt)
    self.UP:startCycle()

    self.menu:specialUpdate(time, dt)

    --if IS_DEBUG then
    self.timeRate = (love.keyboard.isDown('lshift') or love.keyboard.isDown('rshift')) and 3 or 1
    --end

    if not self.menu.isPaused then
        while self.accumulatedUpdateTime - ONETICK > 0.0 do
            self.updateDebugText = util.filterList(self.updateDebugText, function(dti)
                return dti.duration ~= nil and love.timer.getTime() < dti.startTime + dti.duration
            end)
            self.currDebugText = self.updateDebugText

            self.accumulatedUpdateTime = self.accumulatedUpdateTime - ONETICK
            GAMETIME = GAMETIME + ONETICK * self.timeRate

            for _, ent in ipairs(self.entitiesList) do
                --self.UP:pushEvent(string.format('update %s', tostring(ent)))
                self:callEntMethod(ent, 'update', '_hooks_Update', GAMETIME, ONETICK)
                --self.UP:popEvent()
            end
            for _, ent in ipairs(self.entitiesThatJustDiedList) do
                setmetatable(ent, nil)
                util.clear(ent)
                ent.valid = false
                setmetatable(ent, {
                    __tostring = function(self) return string.format('[%s E%i VERY DEAD]', ent.__name, ent.id) end,
                    __index = function() maybeError('dead entity!') end,
                    __newindex = function() maybeError('dead entity!') end,
                })
            end
            self.entitiesThatJustDiedList = {}

            self.currDebugText = nil
        end
    end

    self.UP:endCycle()
end

function Engine:draw()
    self.DP:startCycle()
    self.currDebugText = self.drawDebugText

    local pixelSize = Vec(love.graphics.getDimensions())
    if self.menu.stage == MenuStage.Playing then
        love.graphics.clear(37 / 255, 19 / 255, 26 / 255, 1, 1, 1)
    else
        love.graphics.clear(0, 0, 0, 1, 1, 1)
    end

    local dt = love.timer.getTime() - self.lastDrawTime

    if self.camera then
        self.camera:specialRender(dt)
    end

    love.graphics.push()

    love.graphics.translate(0.5 * pixelSize.x, 0.5 * pixelSize.y)
    local referenceSize = Vec(500, 250)
    local scale
    if (referenceSize.x / referenceSize.y) > (pixelSize.x / pixelSize.y) then
        scale = pixelSize.x / referenceSize.x
    else
        scale = pixelSize.y / referenceSize.y
    end
    --scale = math.floorTo(scale, 1)
    love.graphics.scale(scale)
    love.graphics.translate(-0.5 * referenceSize.x, -0.5 * referenceSize.y)

    --love.graphics.setColor(1, 1, 1, 1)
    --love.graphics.rectangle('line', 0, 0, referenceSize.x, referenceSize.y)

    for _, ent in ipairs(self.entitiesList) do
        self.DP:pushEvent(string.format('screenRender %s', tostring(ent)))
        love.graphics.push()
        self:callEntMethod(ent, 'screenRender', nil)
        love.graphics.pop()
        self.DP:popEvent()
    end

    love.graphics.pop()

    love.graphics.push()
    self.menu:specialRender()
    love.graphics.pop()

    if IS_DEBUG then
        love.graphics.push()
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setFont(Engine:getAsset('devfont').handle)
        --love.graphics.print(string.format("FT (ms): %3.3f", love.timer.getAverageDelta()), 10, 10)
        local screenTextIdx = 0
        for _, dti in ipairs(self.updateDebugText) do
            if dti.type == 'screen' then
                love.graphics.print(tostring(dti.text), 10, 10 + 20 * screenTextIdx)
                screenTextIdx = screenTextIdx + 1
            end
        end
        for _, dti in ipairs(self.drawDebugText) do
            if dti.type == 'draw' then
                love.graphics.print(tostring(dti.text), 10, 10 + 20 * screenTextIdx)
                screenTextIdx = screenTextIdx + 1
            end
        end
        self.drawDebugText = util.filterList(self.drawDebugText, function(dti)
            return dti.duration ~= nil and love.timer.getTime() < dti.startTime + dti.duration
        end)
        self.currDebugText = nil
        love.graphics.pop()
    end

    self.DP:endCycle()
    local winW, winH = love.graphics.getDimensions()
    if IS_DEBUG and self.profileMode ~= ProfileMode.Off then
        love.graphics.setColor(255, 255, 255)
        self.DP:draw(20, 20, 200, winH - 20 - 20, "DRAW CYCLE")
        self.UP:draw(winW - 20 - 200, 20, 200, winH - 40, "UPDATE CYCLE")
    end

    self.lastDrawTime = love.timer.getTime()
end

function _G.SCREENTEXT(text)
    if Engine.currDebugText then
        table.insert(Engine.currDebugText, { type = 'screen', text = text })
    end
end

function _G.WORLDTEXT(pos, text, duration)
    duration = duration or 1.0
    if Engine.currDebugText then
        table.insert(Engine.currDebugText, { type = 'world', pos = pos, text = text, startTime = love.timer.getTime(), duration = duration })
    end
end

function Engine:onWindowResize(w, h)
    --
end

function Engine:onKeyPressed(key, scancode, isrepeat)
    if IS_DEBUG then
        if key == 'f2' then
            if self.profileMode == ProfileMode.Off then
                self.profileMode = ProfileMode.Running
            elseif self.profileMode == ProfileMode.Running then
                self.profileMode = ProfileMode.Paused
            elseif self.profileMode == ProfileMode.Paused then
                self.profileMode = ProfileMode.Off
            end
            self.DP:enable(self.profileMode == ProfileMode.Running)
            self.UP:enable(self.profileMode == ProfileMode.Running)
        elseif key == 'f3' then
            self.debugDraw = not self.debugDraw
        elseif key == 'c' then
            GAMESTATE.player.inventory.coffee.count = GAMESTATE.player.inventory.coffee.count + 1
        elseif key == 'k' then
            GAMESTATE.player.inventory.goldenKey.count = GAMESTATE.player.inventory.goldenKey.count + 1
        elseif key == 'v' and WORLD and WORLD.valid then
            Vampire.new(WORLD, { pos = self:getMouseWorldPos() })
        end

        if tonumber(key, 10) ~= nil then
            local targetLevelNum = (key == '0' and 10 or tonumber(key, 10))
            if love.keyboard.isDown('lshift') then targetLevelNum = targetLevelNum + 10 end
            self.menu:loadLevel(targetLevelNum)
        end
    end
    self.menu:onKeyPressed(key, scancode, isrepeat)
end

function Engine:onKeyReleased(key, scancode)
    self.menu:onKeyReleased(key, scancode)
end

function Engine:onTextEdited(text, start, length)
    self.menu:onTextEdited(text, start, length)
end

function Engine:onTextInput(text)
    self.menu:onTextInput(text)
end

function Engine:getMouseWorldPos(mousePosOrNil)
    mousePosOrNil = mousePosOrNil or Vec(love.mouse.getPosition())
    local trans = self.camera:getTransform()
    local worldPos = Vec(trans:inverseTransformPoint(mousePosOrNil:xy()))
    return worldPos
end

function Engine:onMouseMoved(x, y, dx, dy, istouch)
    --
end

function Engine:onMousePressed(x, y, button, istouch)
    if self.camera then
        local trans = self.camera:getTransform()
        local worldPos = Vec(trans:inverseTransformPoint(x, y))
        print(worldPos)
        --self.currDebugText = Engine.updateDebugText
        --WORLDTEXT(worldPos, 'test')
        --self.currDebugText = nil
        if GAMESTATE and WORLD then
            --local cell = WORLD:trace(GAMESTATE.player:getPos(), worldPos)
            --cell.isWall = not cell.isWall
        end
        if button == 2 and IS_DEBUG then
            GAMESTATE.player:setPos(worldPos)
        end
    end
end

function Engine:onMouseReleased(x, y, button)
    --
end

function Engine:onMouseWheel(dx, dy)
    self.menu:onMouseWheel(dx, dy)
end

function Engine:onGamepadAxis(joystick, axis, value)
    --
end

function Engine:onGamepadPressed(joystick, button)
    --
end

function Engine:onGamepadReleased(joystick, button)
    --
end

local AssetTypes = {
    font = {
        extensions = { "ttf", "otf" },
        create = function(info) info.handle = love.graphics.newFont(info.path, info.size) end,
        destroy = function(info) info.handle = info.handle:release() end,
        fallback = { handle = love.graphics.newFont(900), },
    },
    image = {
        extensions = { "png", "jpg" },
        create = function(info)
            info.handle = love.graphics.newImage(info.path)
            info.handle:setFilter(info.filterMin or 'nearest', info.filterMax or 'nearest', info.anisotropy or nil)
            info.size = Vec(info.handle:getWidth(), info.handle:getHeight())
        end,
        destroy = function(info)
            info.handle = info.handle:release()
            info.size = nil
        end,
        fallback = { handle = love.graphics.newImage('art/missing.png'), size = Vec(900, 900) },
    },
    anim = {
        extensions = {},
        create = function(info)
            info.handle = love.graphics.newImage(info.path)
            info.handle:setFilter(info.filterMin or 'nearest', info.filterMax or 'nearest', info.anisotropy or nil)
            info.fullSize = Vec(info.handle:getWidth(), info.handle:getHeight())
            info.frameSize = Vec(info.handle:getWidth() / info.frames, info.handle:getHeight())
            info.quads = {}
            for frameIdx = 0, info.frames - 1 do
                table.insert(info.quads, love.graphics.newQuad(info.frameSize.x * frameIdx, 0, info.frameSize.x, info.frameSize.y, info.fullSize.x, info.fullSize.y))
            end
        end,
        destroy = function(info)
            info.handle = info.handle:release()
            info.fullSize = nil
            info.frameSize = nil
            info.quads = nil
        end,
        fallback = { handle = love.graphics.newImage('art/missing.png'), fullSize = Vec(900, 900), frameSize = Vec(900, 900), quads = {}, },
    },
    reverb = {
        extensions = {},
        create = function(info)
            if love.audio.isEffectsSupported() then
                local success = love.audio.setEffect(info.key, openal_presets:GetReverbPreset(info.presetName))
                if success then
                    --love.audio.setEffect(info.key, true)
                end
            end
        end,
        destroy = function(info)
            if love.audio.isEffectsSupported() then
                --love.audio.setEffect(info.key, false)
            end
        end,
        fallback = { handle = nil, },
    },
    sfx = {
        extensions = { "wav", "mp3", "ogg" },
        create = function(info)
            info.handle = love.audio.newSource(info.path, info.sourceType or 'static')
            --love.audio.setEffect('REVERB_PRESET_CAVE', openal_presets:GetReverbPreset('REVERB_PRESET_MOUNTAINS'))
            --info.handle:setEffect('REVERB_PRESET_CAVE', true)
        end,
        destroy = function(info) info.handle = info.handle:release() end,
        fallback = { handle = love.audio.newSource('sfx/missing.ogg', 'static'), },
    },
    vfx = {
        extensions = {},
        create = function(info) info.imageHandle = love.graphics.newImage(info.path) end,
        destroy = function(info) info.imageHandle = info.imageHandle:release() end,
        fallback = { imageHandle = love.graphics.newImage('art/missing.png'), lifetime = 3.0, },
    },
    tiledmap = {
        extensions = {},
        create = function(info)
            info.handle = sti(info.path)
        end,
        destroy = function(info)
            sti:flush()
            info.handle = nil
        end,
        fallback = { handle = {} },
    },
    shader = {
        extensions = {},
        create = function(info) info.handle = love.graphics.newShader(info.src) end,
        destroy = function(info) info.handle = info.handle:release() end,
        fallback = { handle = love.graphics.newShader [[vec4 effect(vec4 c, Image t, vec2 tc, vec2 sc) { return vec4(1.0, 0.0, 0.0, 1.0); } ]], },
    }
}

function Engine:_theseAreTheAssets(assetDescriptors)
    for assetKey, assetDescriptor in pairs(assetDescriptors) do
        local assetInfo = self.assetKeyInfoMap[assetKey]
        if assetInfo ~= nil then
            AssetTypes[assetInfo.type].destroy(assetInfo)
        end
        if assetInfo == nil then
            print(string.format("New asset: %s", assetKey))
            assetInfo = {
                key = assetKey,
                type = assetDescriptor.type,
                path = assetDescriptor.path,
                alreadyWatchedPath = nil,
            }
            self.assetKeyInfoMap[assetKey] = assetInfo
        end
        if assetInfo.alreadyWatchedPath ~= nil and assetInfo.path ~= assetInfo.alreadyWatchedPath then
            unwatchHotAssetFile(assetInfo.alreadyWatchedPath, 'engine hotness')
            assetInfo.alreadyWatchedPath = nil
        end
        if assetInfo.path ~= false then
            watchHotAssetFile(assetInfo.path, 'engine hotness', function()
                wrap(AssetTypes[assetInfo.type].destroy, assetInfo)
                if assetInfo.create ~= nil then
                    wrap(assetInfo.create, assetInfo)
                else
                    wrap(AssetTypes[assetInfo.type].create, assetInfo)
                end
            end)
            assetInfo.alreadyWatchedPath = assetInfo.path
        end
        util.copyFromTo(assetDescriptor, assetInfo)
        if assetInfo.create ~= nil then
            wrap(assetInfo.create, assetInfo)
        else
            wrap(AssetTypes[assetInfo.type].create, assetInfo)
        end
    end
end

function Engine:_guessAssetType(key)
    for assetType, assetTypeInfo in pairs(AssetTypes) do
        for _, extension in ipairs(assetTypeInfo.extensions) do
            if string.find(key, '%.' .. extension) then
                return assetType
            end
        end
    end
    return nil
end

function Engine:getAsset(key)
    local assetInfo = self.assetKeyInfoMap[key]
    if assetInfo == nil then
        print(string.format("WARNING: Missing asset %s", key))
        --DEBUGGER.brk()
        local assetType = Engine:_guessAssetType(key)
        return assetType and AssetTypes[assetType].fallback or nil
    end
    return assetInfo
end

function Engine:accumulateUpdateTime(dt)
    self.accumulatedUpdateTime = math.min(self.accumulatedUpdateTime + dt, 1.0)
end
function Engine:resetGameTime()
    self.accumulatedUpdateTime = -1
end
function Engine:onPause()
    for _, ent in ipairs(self.entitiesList) do
        self:callEntMethod(ent, 'onPause', nil)
    end
end
function Engine:onResume()
    for _, ent in ipairs(self.entitiesList) do
        self:callEntMethod(ent, 'onResume', nil)
    end
end


