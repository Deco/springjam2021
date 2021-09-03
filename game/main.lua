local conf = require 'conf'
local debugger = require 'src.misc.debugger'
local bytecodeParser = require 'lib.bytecode-parser'

local globalTable = _G
local isGMakerAllowed = true
globalTable.GMAKER = function(name, newVal)
    if not isGMakerAllowed and conf.isDebug then
        error(string.format('GMaker called unexpectedly!', name, newVal))
    end
    local currVal = rawget(globalTable, name)
    if currVal == nil then
        print(string.format("GMAKER: %s", name))
        if newVal == nil then newVal = {} end
    end
    if type(newVal) == 'table' then
        newVal.__name = name
    end
    if newVal ~= nil then
        rawset(globalTable, name, newVal)
        return newVal
    end
    return currVal
end
globalTable.ENUM = globalTable.GMAKER -- temp
globalTable.ERROR = ""
globalTable.DEBUGGER = debugger
globalTable.IS_DEBUG = conf.isDebug
globalTable.IS_HOT_RELOAD_ENABLED = conf.isHot
globalTable.ARE_WE_HOT_RIGHT_NOW = false
globalTable.BLOCK_NONREPEATABLE_STUFF = false
globalTable.HOTSTUFF_CALLBACKS = false
globalTable.HAD_HOT_BREAK = false
globalTable.UNBREAKME = false
globalTable.HOTSTUFF = function(callback)
    if not globalTable.ARE_WE_HOT_RIGHT_NOW then return end
    table.insert(globalTable.HOTSTUFF_CALLBACKS, callback)
end
globalTable.HOTSTUFF_LAST_CALLBACKS = false
globalTable.HOTSTUFF_LAST = function(callback)
    table.insert(globalTable.HOTSTUFF_LAST_CALLBACKS, callback)
end
globalTable.maybeError = function(msg, level)
    if not conf.isDebug then print("IGNORING ERROR!!", debug.traceback(msg)) end
    error(msg, (level or 1) + 1)
end
_G.wrap = function(func, ...)
    return xpcall(func, function(err)
        globalTable.ERROR = err
        print(debug.traceback(err))
        if (not globalTable.ARE_WE_HOT_RIGHT_NOW or not globalTable.HAD_HOT_BREAK) and not globalTable.UNBREAKME then
            if globalTable.ARE_WE_HOT_RIGHT_NOW then globalTable.HAD_HOT_BREAK = true end
            debugger.brk()
        end
        return err
    end, ...)
end
--_G.maybeWrap = function(func, ...)
--    if conf.isDebug then
--        return xpcall(func, function(err)
--            globalTable.ERROR = err
--            print(debug.traceback(err))
--            debugger.brk()
--            return err
--        end, ...)
--    end
--    return func(...)
--end
local wrap = _G.wrap

if conf.isDebug then
    setmetatable(globalTable, {
        __index = function(tbl, key) maybeError(string.format('Attempted to access unknown variable: %s', key)) end,
        __newindex = function(tbl, key, val)
            --if not allowNewGlobals then
            maybeError(string.format('Attempted to assign to unknown variable: %s (= %s)', key, val))
            --end
            --rawset(tbl, key, val)
        end,
    })
end

globalTable._G = setmetatable({}, { -- omg this is so hacky but... it helps with auto-complete
    __index = function(tbl, key) return globalTable[key] end,
    __newindex = function(tbl, key, val)
        GMAKER(key, val)
    end
})



--[[ All hot-reloadable files ]]
local hotFilesList = {}
local hotFilesPathInfoMap = {}--util.mapListToTable(hotFilesList, function(info) return info.path, info end)
for idx, path in ipairs({
    'src/util.lua',
    'src/math.lua',
    'src/misc/probe.lua',
    'src/misc/spatial-grid.lua',
    'src/misc/spatial.lua',
    'src/engine.lua',
    'assets.lua',
    'src/menu.lua',
    'src/gamestate.lua',
    'src/world.lua',
    'src/camera.lua',
    'src/entity-basics.lua',
    'src/rendering.lua',
    --
    'src/common.lua',
    'src/objects/triggers.lua',
    'src/player.lua',
    --
    'src/objects/bomb.lua',
    'src/objects/coffee.lua',
    'src/objects/crate.lua',
    'src/objects/gate.lua',
    'src/objects/key.lua',
    'src/objects/pressure-plate.lua',
    'src/objects/spikes.lua',
    'src/objects/tomb.lua',
    'src/objects/vampire.lua',
}) do
    local info = {
        path = path,
        kind = 'code',
        lastModified = -1,
        dirty = false,
    }
    hotFilesList[idx] = info
    hotFilesPathInfoMap[path] = info
end

globalTable._G.watchHotAssetFile = function(path, reloadHandlerKey, reloadHandlerFunc)
    local info = hotFilesPathInfoMap[path]
    if info == nil then
        info = {
            path = path,
            kind = 'asset',
            lastModified = love.timer.getTime() + 1,
            dirty = false,
            reloadHandlerFuncMap = {},
        }
        hotFilesPathInfoMap[path] = info
        table.insert(hotFilesList, info)
    end
    info.reloadHandlerFuncMap[reloadHandlerKey] = reloadHandlerFunc
end

globalTable._G.unwatchHotAssetFile = function(path, reloadHandlerKey)
    local info = hotFilesPathInfoMap[path]
    assert(info)
    info.reloadHandlerFuncMap[reloadHandlerKey] = nil
    if next(info.reloadHandlerFuncMap) == nil then
        hotFilesPathInfoMap[path] = nil -- no one wants this file anymore
        table.remove(hotFilesList, util.findIndex(info))
    end
end

local gatherDelay = 0.4
local checkInterval = 0.2
local gatherStartTime = nil
local lastCheckTime = -1
local function doHotness(time)
    local outcome = nil

    local firstRun = (time == nil)
    if firstRun or conf.isHot and (time > lastCheckTime + checkInterval or gatherStartTime ~= nil) then
        for _, fileInfo in ipairs(hotFilesList) do
            local stat = love.filesystem.getInfo(fileInfo.path)
            assert(stat, 'File does not exist: ' .. fileInfo.path)

            if firstRun or stat.modtime > fileInfo.lastModified then
                fileInfo.lastModified = stat.modtime
                fileInfo.dirty = true
                gatherStartTime = gatherStartTime or time
            end
        end
    end

    if firstRun or (gatherStartTime and time > gatherStartTime + gatherDelay) then
        local didHaveError = false
        local danglingSymbolActionsList = {}
        globalTable.HOTSTUFF_CALLBACKS = {}
        globalTable.HOTSTUFF_LAST_CALLBACKS = {}
        globalTable.ARE_WE_HOT_RIGHT_NOW = not firstRun
        for _, fileInfo in ipairs(hotFilesList) do
            if fileInfo.dirty then
                fileInfo.dirty = false
                print(string.format('%s %s', firstRun and 'Loading' or 'Reloading', fileInfo.path))
                if fileInfo.kind == 'code' then
                    local contents = love.filesystem.read(fileInfo.path)
                    local loadResult, loadErr = loadstring(contents, fileInfo.path)
                    if loadResult then
                        isGMakerAllowed = true
                        local evaluateSuccess, result = wrap(loadResult)
                        isGMakerAllowed = false
                        if evaluateSuccess then
                            --
                        else
                            didHaveError = true
                        end
                    else
                        didHaveError = true
                        globalTable.ERROR = loadErr
                        print(debug.traceback(nil, loadErr, 2))
                        if not globalTable.ARE_WE_HOT_RIGHT_NOW or not globalTable.HAD_HOT_BREAK then
                            if globalTable.ARE_WE_HOT_RIGHT_NOW then globalTable.HAD_HOT_BREAK = true end
                            debugger.brk()
                        end
                    end
                else
                    for key, func in pairs(fileInfo.reloadHandlerFuncMap) do
                        wrap(func, fileInfo.path)
                    end
                end
            end
        end
        if not didHaveError then
            for _, callback in ipairs(globalTable.HOTSTUFF_CALLBACKS) do
                local success, result = wrap(callback)
                if not success then
                    didHaveError = true
                end
            end
            for _, callback in ipairs(globalTable.HOTSTUFF_LAST_CALLBACKS) do
                local success, result = wrap(callback)
                if not success then
                    didHaveError = true
                end
            end
        end
        if not didHaveError then
            outcome = firstRun and 'load-success' or 'reload-success'
        else
            outcome = 'failure'
        end
        globalTable.HOTSTUFF_CALLBACKS = false
        globalTable.HOTSTUFF_LAST_CALLBACKS = false
        globalTable.ARE_WE_HOT_RIGHT_NOW = false
        globalTable.HAD_HOT_BREAK = false
        globalTable.UNBREAKME = false
    end

    return nil
end

--[[ Entry/Exit ]]
--function love.run() end
function love.load(args)
    isGMakerAllowed = false
    if doHotness(nil) == 'failure' then
        print('File load failed. Aborting.')
        love.event.quit(1)
    end
    if rawget(globalTable, 'Engine') and Engine.load then
        Engine.__ALLOW_NEW_FIELDS = true
        if not wrap(Engine.load, Engine) then
            print('Engine load failed. Aborting.')
            love.event.quit(1)
        end
        Engine.__ALLOW_NEW_FIELDS = false
    end
end
--function love.quit() end

--[[ Simulate/Render ]]
function love.update(dt)
    local time = love.timer.getTime()
    doHotness(time)

    if rawget(globalTable, 'Engine') and Engine.update then
        wrap(Engine.update, Engine, time, dt)
    end
end
function love.draw()
    --love.graphics.reset()
    if rawget(globalTable, 'Engine') and Engine.draw then
        wrap(Engine.draw, Engine)
    end
end


--[[ Error handlers ]]
--function love.errhand(msg) end
--function love.threaderror(thread, errorstr) end
--function love.errorhandler(msg) end
--function love.lowmemory() end

--[[ Windowing ]]
function love.resize(w, h)
    if rawget(globalTable, 'Engine') and Engine.onWindowResize then
        wrap(Engine.onWindowResize, Engine, w, h)
    end
end
--function love.displayrotated(index, orientation) end
--function love.visible(visible) end
--function love.focus(focus) end
--function love.mousefocus(focus) end

--[[ Keyboard/Text Input ]]
function love.textedited(text, start, length)
    if rawget(globalTable, 'Engine') and Engine.onTextEdited then
        wrap(Engine.onTextEdited, Engine, text, start, length)
    end
end
function love.textinput(text)
    if rawget(globalTable, 'Engine') and Engine.onTextInput then
        wrap(Engine.onTextInput, Engine, text)
    end
end
function love.keypressed(key, scancode, isrepeat)
    if rawget(globalTable, 'Engine') and Engine.onKeyPressed then
        wrap(Engine.onKeyPressed, Engine, key, scancode, isrepeat)
    end
end
function love.keyreleased(key, scancode)
    if rawget(globalTable, 'Engine') and Engine.onKeyReleased then
        wrap(Engine.onKeyReleased, Engine, key, scancode)
    end
end

--[[ Mouse/Touch ]]
function love.mousemoved(x, y, dx, dy, istouch)
    if rawget(globalTable, 'Engine') and Engine.onMouseMoved then
        wrap(Engine.onMouseMoved, Engine, x, y, dx, dy, istouch)
    end
end
function love.mousepressed(x, y, button, istouch)
    if rawget(globalTable, 'Engine') and Engine.onMousePressed then
        wrap(Engine.onMousePressed, Engine, x, y, button, istouch)
    end
end
function love.mousereleased(x, y, button)
    if rawget(globalTable, 'Engine') and Engine.onMouseReleased then
        wrap(Engine.onMouseReleased, Engine, x, y, button)
    end
end
function love.wheelmoved(dx, dy)
    if rawget(globalTable, 'Engine') and Engine.onMouseWheel then
        wrap(Engine.onMouseWheel, Engine, dx, dy)
    end
end

--[[ Gamepad/Joystick ]]
function love.gamepadaxis(joystick, axis, value)
    if rawget(globalTable, 'Engine') and Engine.onGamepadAxis then
        wrap(Engine.onGamepadAxis, Engine, joystick, axis, value)
    end
end
function love.gamepadpressed(joystick, button)
    if rawget(globalTable, 'Engine') and Engine.onGamepadPressed then
        wrap(Engine.onGamepadPressed, Engine, joystick, button)
    end
end
function love.gamepadreleased(joystick, button)
    if rawget(globalTable, 'Engine') and Engine.onGamepadReleased then
        wrap(Engine.onGamepadReleased, Engine, joystick, button)
    end
end
--function love.joystickadded(joystick) end
--function love.joystickremoved(joystick) end
--function love.joystickaxis(joystick, axis, value) end
--function love.joystickhat(joystick, hat, direction ) end
--function love.joystickpressed(joystick, button) end
--function love.joystickreleased(joystick, button) end

--[[ Misc ]]
--function love.directorydropped(path) end
--function love.filedropped(path) end
