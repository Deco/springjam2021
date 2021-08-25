--

local entityBasicStuff = {
    getPos = function(self) return self._pos end,
    setPos = function(self, pos)
        self._pos = pos
        self._bounds = AABBFromCenterAndSize(self._pos, self._size)
        Engine:_entBoundsChanged(self)
    end,
    getSize = function(self) return self._size end,
    setSize = function(self, size)
        self._size = size
        self._bounds = AABBFromCenterAndSize(self._pos, self._size)
        Engine:_entBoundsChanged(self)
    end,
    getBounds = function(self) return self._bounds end,
}

function _G.BasicEntSetup(self, data)
    util.copyFromTo(entityBasicStuff, self)
    self._pos = self._pos or data.pos
    assert(self._pos)
    self._size = self._size or Vec(5, 5)
    self._bounds = AABBFromCenterAndSize(self._pos, self._size)
    self._attachedTo = nil
    Engine:_entBoundsSetup(self)
end

local function AttachToEnt_update(self, time, dt)
    if self._attachedTo == nil or not self._attachedTo.alive then
        self._attachedTo = nil
        return false
    end
    if self._pos ~= self._attachedTo._pos then
        self:setPos(self._attachedTo:getPos())
    end
end
function _G.AttachToEnt(self, entToFollow)
    self._attachedTo = entToFollow
    self._additionalUpdates['AttachToEnt'] = AttachToEnt_update
end

_G.MoveToEnt = function(ent, owner)
    if ent._pos ~= owner._pos then ent:setPos(owner:getPos()) end
end

_G.DrawEntImage = function(ent, imageAsset)
    if imageAsset then
        love.graphics.push()
        love.graphics.translate((-ent._pos):xy())
        local boundsSize = ent._bounds:size()
        local scale = boundsSize / imageAsset.size
        love.graphics.scale(scale:xy())
        love.graphics.translate(((ent._pos - 0.5 * boundsSize) / scale):xy())
        love.graphics.draw(imageAsset.handle)
        love.graphics.pop()
        --love.graphics.push()
        --love.graphics.scale((ent._bounds:size() / imageAsset.size):xy())
        --love.graphics.translate((-0.5 * ent._pos):xy())
        --love.graphics.draw(imageAsset.handle)
        --love.graphics.pop()
        --local offset = -0.5 * ent._pos
        --local scale = ent._bounds:size() / imageAsset.size
        --love.graphics.draw(
        --    imageAsset.handle
        --    --offset.x, offset.y,
        --    --0,
        --    --scale.x, scale.y,
        --    --offset.x, offset.y
        --)
    end
end



