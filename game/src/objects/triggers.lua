--

function _G.SetCircleTrigger(self, radius, filterFunc, onTriggerFunc)
    local body = self:getBody()
    body:setSleepingAllowed(false)
    self._otherEntContactMap = self._otherEntContactMap or {}

    local shape = love.physics.newCircleShape(radius)
    local fixture = love.physics.newFixture(body, shape)
    fixture:setUserData(self)
    fixture:setSensor(true)

    self._hooks_OnBeginContact['SetCircleTrigger'] = function(_, ourFixture, other, otherFixture, contact)
        if not filterFunc(other) then return end
        onTriggerFunc(other)
    end
end



--CircleTrigger = Engine:EntityClass('CircleTrigger')
--
--function CircleTrigger:setup(data)
--    self._radius = assert(data.radius, 'trigger needs radius')
--    self._shape = nil
--    self._fixture = nil
--
--    local extraData = { wantsContacts = true, }
--    if data.attachTo == nil then
--        extraData.solid = true
--    end
--    BasicEntSetup(self, util.mergeTables(extraData, data))
--
--    self._shape = love.physics.newCircleShape(self._radius)
--    self._fixture = love.physics.newFixture(self:getBody(), self._shape)
--    self._fixture:setUserData(self)
--    self._fixture:setSensor(true)
--    self:getBody():setSleepingAllowed(false)
--
--    self.filter = assert(data.filter, 'trigger needs filter')
--    self.onTrigger = assert(data.onTrigger)
--    self.activeEntsSet = self.activeEntsSet or {}
--
--end
--
--function CircleTrigger:update()
--    --Engine.UP:pushEvent(tostring(self))
--    --local foundEntsList = Engine:GetEntitiesWithCentersInRadius(self:getPos(), self.radius, self.filter)
--    --local toBeActiveEntsSet = {}
--    --local enteringEntsList, leavingEntsList = {}, {}
--    --for _, ent in ipairs(foundEntsList) do
--    --    local shouldBeActive = self.filter(ent, self)
--    --    if shouldBeActive then
--    --        toBeActiveEntsSet[ent] = true
--    --        if self.activeEntsSet[ent] then
--    --            -- active and staying active
--    --        else
--    --            -- just activated
--    --            table.insert(enteringEntsList, ent)
--    --        end
--    --    end
--    --end
--    --for _, ent in pairs(self.activeEntsSet) do
--    --    if toBeActiveEntsSet[ent] == true then
--    --        -- active and staying active
--    --    else
--    --        -- just deactivated
--    --        table.insert(leavingEntsList, ent)
--    --    end
--    --end
--    --for _, ent in ipairs(enteringEntsList) do
--    --    self.onTrigger(ent, 'enter')
--    --end
--    --for _, ent in ipairs(leavingEntsList) do
--    --    self.onTrigger(ent, 'leave')
--    --end
--    --self.activeEntsSet = toBeActiveEntsSet
--    --Engine.UP:popEvent(tostring(self))
--end
--
--function CircleTrigger:render()
--    --if next(self.activeEntsSet) == nil then
--    --    love.graphics.setColor(0, 1, 1, 1)
--    --else
--    --    love.graphics.setColor(1, 0, 0, 1)
--    --end
--    --love.graphics.circle('line', 0, 0, self.radius)
--end
