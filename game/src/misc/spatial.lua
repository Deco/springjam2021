GMAKER 'SpatialThing'

function SpatialThing.new()
    return setmetatable({
        objectsSet = {},
    }, { __index = SpatialThing, })
end

function SpatialThing:registerObject(obj)
    self.objectsSet[obj] = true
end

function SpatialThing:deregisterObject(obj)
    self.objectsSet[obj] = nil
end

function SpatialThing:updateObject(obj)
    --
end








