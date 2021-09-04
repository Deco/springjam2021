util = GMAKER 'util'

NIL = GMAKER('NIL', {})
function _G.SHAPED(tbl)
    local knownKeysSet = {}
    for key, val in pairs(tbl) do
        knownKeysSet[key] = true
        if val == _G.NIL then
            knownKeysSet[key] = nil
        end
    end
    return setmetatable(tbl, {
        __index = function(tbl, key)
            if knownKeysSet[key] then return nil end
            maybeError(string.format('Accessing unknown key on shaped table: %s', key))
        end,
        __newindex = function(tbl, key, val)
            if knownKeysSet[key] then
                tbl[key] = val
                return
            end
            maybeError(string.format('Assigning unknown key on shaped table: %s', key))
        end
    })
end

function util.autoShape(tbl, readOnlyFunc, assignableFunc, metaExtension)
    assert(getmetatable(tbl) == nil or getmetatable(tbl).hahahahahah)
    --setmetatable(tbl, nil)
    local stored = {}
    for k, v in pairs(tbl) do
        stored[k] = v
        tbl[k] = nil
    end
    local doingFunc
    local readableKeysSet = {}
    local writableKeysSet = {}
    setmetatable(tbl, {
        __index = function(tbl, key)
            readableKeysSet[key] = true
            if doingFunc == 'assignable' then
                writableKeysSet[key] = true
            end
            local val = stored[key]
            --if val == nil and meta ~= nil and meta.__index ~= nil then
            --    return meta.__index(tbl, key)
            --end
            return val
        end,
        __newindex = function(tbl, key, val)
            readableKeysSet[key] = true
            if doingFunc == 'assignable' then
                writableKeysSet[key] = true
            end
            stored[key] = val
        end,
    })
    if readOnlyFunc ~= nil then
        doingFunc = 'readOnly'
        readOnlyFunc(tbl)
    end
    if assignableFunc ~= nil then
        doingFunc = 'assignable'
        assignableFunc(tbl)
    end
    setmetatable(tbl, nil)
    util.copyFromTo(stored, tbl)
    local finalMeta = {
        hahahahahah = true,
        __index = function(tbl, key)
            if not readableKeysSet[key] then
                maybeError(string.format('Accessing unknown key on auto-shaped table: %s', key))
            end
            return nil
        end,
        __newindex = function(tbl, key, val)
            if not writableKeysSet[key] then
                if readableKeysSet[key] then
                    maybeError(string.format('Assigning read-only key on auto-shaped table: %s', key))
                else
                    maybeError(string.format('Assigning unknown key on auto-shaped table: %s', key))
                end
            end
            rawset(tbl, key, val)
        end
    }
    if metaExtension then util.copyFromTo(metaExtension, finalMeta) end
    setmetatable(tbl, finalMeta)
    return tbl
end

--function _G.ENUM(tbl)
--    return tbl
--end

--function util.enumToString(enum, val)
--
--end

function util.assertOnlyOne(list)
    assert(#list == 1)
    return list[1]
end

function util.getOrPut(tbl, key, make, ...)
    local val = tbl[key]
    if val ~= nil then return val end
    val = make(key, ...)
    tbl[key] = val
    return val
end

function util.shallowcopy(orig)
    local copy
    if type(orig) == 'table' then
        copy = {}
        for key, val in pairs(orig) do
            copy[key] = val
        end
    else
        copy = orig
    end
    return copy
end

function util.copyFromTo(src, dest, filterFunc)
    for k, v in pairs(src) do
        if not filterFunc or filterFunc(k, v) then
            dest[k] = v
        end
    end
    return dest
end

function util.setSubtract(a, b)
    local aa = {}
    for k, v in pairs(a) do aa[v] = true end
    for k, v in pairs(b) do aa[v] = nil end
    local list = {}
    local n = 0
    for k, v in pairs(a) do
        if aa[v] then
            n = n + 1
            list[n] = v
        end
    end
    return list
end

function util.filterList(list, func)
    local out = {}
    for _, v in ipairs(list) do
        if func(v) then
            table.insert(out, v)
        end
    end
    return out
end

function util.listToSet(list)
    local out = {}
    for _, v in ipairs(list) do
        out[v] = true
    end
    return out
end

function util.setToList(set)
    local out = {}
    for k, _ in pairs(set) do
        table.insert(out, k)
    end
    return out
end

function util.sizeOfSet(set)
    local count = 0
    for _ in pairs(set) do count = count + 1 end
    return count
end

function util.map(list, func)
    local out = {}
    for i, v in ipairs(list) do
        out[i] = func(v)
    end
    return out
end

function util.mapListToTable(list, kvFunc)
    local out = {}
    for _, v in ipairs(list) do
        local nk, nv = kvFunc(v)
        out[nk] = nv
    end
    return out
end

function util.clear(tbl)
    for k in pairs(tbl) do
        tbl[k] = nil
    end
end

function util.mergeLists(...)
    local out = {}
    local i = 1
    for listIdx = 1, select('#', ...) do
        local list = select(listIdx, ...)
        for _, val in ipairs(list) do
            out[i] = val
            i = i + 1
        end
    end
    return out
end

function util.mergeTables(...)
    local out = {}
    for tblIdx = 1, select('#', ...) do
        local tbl = select(tblIdx, ...)
        for key, val in pairs(tbl) do
            out[key] = val
        end
    end
    return out
end

function util.mapListToKeys(list, valFunc)
    local out = {}
    for _, val in ipairs(list) do
        out[val] = valFunc(val)
    end
    return out
end

function util.tablePairs(tbl)
    local out = {}
    for key, val in pairs(tbl) do
        table.insert(out, { key = key, val = val })
    end
    return out
end

function util.default(val, default)
    if val == nil then return default end
    return val
end

function util.findIndex(list, target)
    for idx, val in ipairs(list) do
        if val == target then return idx end
    end
    return nil
end

function util.reverseList(list)
    local out = {}
    local len = #list
    for idx = 1, len do
        out[idx] = list[len - idx + 1]
    end
    return out
end

function util.findPathTo(container, target)
    local function recurse(obj, ...)
        for k, v in pairs(obj) do
            if v == target then
                return true, util.reverseList({ k, ... })
            end
            if type(v) == 'table' then
                local success, path = recurse(v, k, ...)
                if success then return true, path end
            end
        end
        return nil
    end
    local success, path = recurse(container)
    return success and path or nil
end


function util.hex2rgb(hex)
	return {tonumber(string.sub(hex, 2, 3), 16)/256, tonumber(string.sub(hex, 4, 5), 16)/256, tonumber(string.sub(hex, 6, 7), 16)/256, 1}
end