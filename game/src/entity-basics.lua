--

local entityBasicStuff = {
    getPos = function(self)
        if self._body ~= nil then return Vec(self._body:getPosition()) end
        if self._attachedTo ~= nil and self._attachedTo.alive then return self._attachedTo:getPos() end
        return nil
    end,
    setPos = function(self, pos)
        self._body:setPosition(pos.x, pos.y)
    end,
    getRot = function(self)
        if self._body ~= nil then return self._body:getAngle() * math.oneOverTau end
        if self._attachedTo ~= nil and self._attachedTo.alive then return self._attachedTo:getRot() end
        return nil
    end,
    setRot = function(self, rot)
        self._body:setAngle(rot * math.tau)
    end,
    getBody = function(self)
        if self._body ~= nil then return self._body end
        if self._attachedTo ~= nil then return self._attachedTo:getBody() end
        return nil
    end,
    --getSize = function(self) return self._size end,
    --setSize = function(self, size)
    --    self._size = size
    --    self._bounds = AABBFromCenterAndSize(self._pos, self._size)
    --    Engine:_entBoundsChanged(self)
    --end,
    --getBounds = function(self) return self._bounds end,
}

function _G.BasicEntSetup(self, data)
    util.copyFromTo(entityBasicStuff, self)

    local pos = data.pos
    if self._body then
        pos = Vec(self._body:getPosition())
        self._body:destroy()
    end

    self._body = nil
    self._attachedTo = nil
    self._wantsContacts = false

    if data.solid then
        self._body = love.physics.newBody(Engine.physWorld, pos.x, pos.y, data.dynamic and "dynamic" or "static")
        self._body:setUserData(self)
        if data.shape then
            local fixture = love.physics.newFixture(self._body, data.shape, data.density or 1)
            fixture:setUserData(self)
            fixture:setFriction(data.friction or 1.0)
            self._body:resetMassData()
        end
        self._body:setLinearDamping(data.linearDamping or 87.0)
        self._body:setAngularDamping(data.angularDamping or 5.0)
        if data.wantsContacts then
            self._wantsContacts = true
            self._otherEntContactMap = {}
        else
            self._otherEntContactMap = nil
        end
    elseif data.attachTo then
        self._attachedTo = data.attachTo
    end

    --self._pos = self._pos or data.pos
    --assert(self._pos)
    --self._size = self._size or Vec(5, 5)
    --self._bounds = AABBFromCenterAndSize(self._pos, self._size)
    --self._attachedTo = nil
    --Engine:_entBoundsSetup(self)
end

--local function AttachToEnt_update(self, time, dt)
--    if self._attachedTo == nil or not self._attachedTo.alive then
--        self._attachedTo = nil
--        return false
--    end
--    if self._pos ~= self._attachedTo._pos then
--        self:setPos(self._attachedTo:getPos())
--    end
--end
--function _G.AttachToEnt(self, entToFollow)
--    self._attachedTo = entToFollow
--    self._additionalUpdates['AttachToEnt'] = AttachToEnt_update
--end

--_G.MoveToEnt = function(ent, owner)
--    if ent._pos ~= owner._pos then ent:setPos(owner:getPos()) end
--end




