--

GMAKER 'Engine' -- singleton

Engine.entityClassInfoMap = Engine.entityClassInfoMap or {}
local function getEntityClassInfo(class)
    return util.getOrPut(Engine.entityClassInfoMap, class, function() return SHAPED({
        instancesSet = {},
    }) end)
end

Engine.assetKeyInfoMap = Engine.assetKeyInfoMap or {}

_G.GAMETIME = -1

function Engine:load(args)
    -- Only runs when the game launches!

    self.entitiesList = {}
    self.nextId = 0
    self.spatialGrid = SpatialGrid.new()
    self.lastGameTime = 0
    self.entitiesThatJustDiedList = {}
    self.debugScreenText = {}

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
    __tostring = function(self) return string.format('[%s E%i%s]', self.__name, self.id, self.alive and '' or ' DEAD') end,
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
        if BLOCK_NONREPEATABLE_STUFF then maybeError(string.format("Noooo you can't create entities here!")) end
        local instance = {
            alive = true,
            owner = owner,
            id = self.nextId,
            class = class,
            ownedSet = {},
            _initData = initData,
            _additionalUpdates = {},
        }
        self.nextId = self.nextId + 1
        classInfo.instancesSet[instance] = true
        table.insert(self.entitiesList, instance)
        if type(owner) ~= 'string' then
            print(string.format("[%s E%i] -> [%s E%i]", owner.__name, owner.id, name, instance.id))
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

        self:callEntMethod(instance, 'spawned', nil)
        print(util.findIndex(self.entitiesList, instance))

        return instance
    end

    return class
end

function Engine:_entBoundsSetup(ent)
    self.spatialGrid:registerObject(ent, ent._bounds)
    ent._oldBounds = ent._bounds
end
function Engine:_entBoundsChanged(ent)
    self.spatialGrid:updateObject(ent, ent._oldBounds, ent._bounds)
    ent._oldBounds = ent._bounds
end

function Engine:GetEntitiesWithCentersInRadius(center, radius)
    local potentials = self.spatialGrid:inSameCells(AABBFromCenterAndSize(center, Vec(2 * radius, 2 * radius)))
    local radiusSq = radius * radius
    local out = {}
    for _, potentialObject in ipairs(potentials) do
        if potentialObject._pos:distSq(center) <= radiusSq then
            table.insert(out, potentialObject)
        end
    end
    return out
end

function Engine:Remove(ent)
    if not ent.alive then return end
    print(string.format("[%s E%i] X", ent.__name, ent.id))
    if rawget(ent, '_pos') then
        self.spatialGrid:deregisterObject(ent, ent._bounds)
    end
    ent.alive = false
    self:callEntMethod(ent, 'removed', nil)
    ent.owner.ownedSet[ent] = nil
    table.remove(self.entitiesList, util.findIndex(self.entitiesList, ent))
    local entityClassInfo = getEntityClassInfo(ent.class)
    entityClassInfo.instancesSet[ent] = nil
    for owned in pairs(ent.ownedSet) do
        Engine:Remove(owned)
    end
    table.insert(self.entitiesThatJustDiedList, ent)
    return nil
end

function Engine:update(time, dt)
    self.menu:specialUpdate(time, dt)
    if self.menu.isPaused then return end
    local gameTime = GAMETIME
    local gameDelta = math.max(0, GAMETIME - self.lastGameTime)
    self.lastGameTime = gameTime
    for _, ent in ipairs(self.entitiesList) do
        SCREENTEXT('updoot' .. tostring(ent))
        self:callEntMethod(ent, 'update', '_additionalUpdates', gameTime, gameDelta)
    end
    for _, ent in ipairs(self.entitiesThatJustDiedList) do
        setmetatable(ent, nil)
        util.clear(ent)
        setmetatable(ent, util.copyFromTo(entityMetaExtensions, {
            __tostring = function(self) return string.format('[%s E%i VERY DEAD]', ent.__name, ent.id) end,
            __index = function() maybeError('dead entity!') end,
            __newindex = function() maybeError('dead entity!') end,
        }))
    end
    self.entitiesThatJustDiedList = {}
end

function Engine:setGameTime(t)
    assert(t >= GAMETIME)
    GAMETIME = t
end
function Engine:resetGameTime()
    GAMETIME = -1
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

function Engine:draw()
    --love.graphics.setColor(0, 1, 1, 1)
    --love.graphics.rectangle('fill', 10, 10, 1280 - 20, 720 - 20)

    if self.camera then
        self.camera:specialRender()
    end
    for _, ent in ipairs(self.entitiesList) do
        love.graphics.push()
        self:callEntMethod(ent, 'screenRender', nil)
        love.graphics.pop()
    end
    love.graphics.push()
    self.menu:specialRender()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.setFont(Engine:getAsset('devfont').handle)
    --love.graphics.print(string.format("FT (ms): %3.3f", love.timer.getAverageDelta()), 10, 10)
    for idx, text in ipairs(self.debugScreenText) do
        love.graphics.print(tostring(text), 10, 10 + 20 * idx)
    end
    self.debugScreenText = {}
    love.graphics.pop()
end

function _G.SCREENTEXT(text)
    table.insert(Engine.debugScreenText, text)
end

function Engine:onWindowResize(w, h)
    --
end

function Engine:onKeyPressed(key, scancode, isrepeat)
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

function Engine:onMouseMoved(x, y, dx, dy, istouch)
    --
end

function Engine:onMousePressed(x, y, button, istouch)
    --
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
            info.size = Vec(info.handle:getWidth(), info.handle:getHeight())
        end,
        destroy = function(info)
            info.handle = info.handle:release()
            info.size = nil
        end,
        fallback = { handle = love.graphics.newImage('art/missing.png'), size = Vec(900, 900) },
    },
    sfx = {
        extensions = { "wav", "mp3", "ogg" },
        create = function(info) info.handle = love.audio.newSource(info.path, 'static') end,
        destroy = function(info) info.handle = info.handle:release() end,
        fallback = { handle = love.audio.newSource('sfx/missing.mp3', 'static'), },
    },
    vfx = {
        extensions = {},
        create = function(info) info.imageHandle = love.graphics.newImage(info.path) end,
        destroy = function(info) info.imageHandle = info.imageHandle:release() end,
        fallback = { imageHandle = love.graphics.newImage('art/missing.png'), lifetime = 3.0, },
    },
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
            }
            self.assetKeyInfoMap[assetKey] = assetInfo
            if assetInfo.path ~= false then
                watchHotAssetFile(assetInfo.path, function()
                    AssetTypes[assetInfo.type].destroy(assetInfo)
                    if assetInfo.create ~= nil then
                        assetInfo.create(assetInfo)
                    else
                        AssetTypes[assetInfo.type].create(assetInfo)
                    end
                end)
            end
        end
        util.copyFromTo(assetDescriptor, assetInfo)
        if assetInfo.create ~= nil then
            assetInfo.create(assetInfo)
        else
            AssetTypes[assetInfo.type].create(assetInfo)
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


