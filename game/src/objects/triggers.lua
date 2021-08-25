CircleTrigger = Engine:EntityClass('CircleTrigger')

function CircleTrigger:setup(data)
    data.pos = self.owner:getPos()
    BasicEntSetup(self, data)
    self.lastRadius = nil
    self.radius = assert(data.radius, 'trigger needs radius')
    self.filter = assert(data.filter, 'trigger needs filter')
    self.onTrigger = assert(data.onTrigger)
    self.activeEntsSet = self.activeEntsSet or {}
end

function CircleTrigger:update()
    MoveToEnt(self, self.owner)
    if self.radius ~= self.lastRadius then
        self.lastRadius = self.radius
        self:setSize(2 * Vec(self.radius, self.radius))
    end

    local foundEntsList = Engine:GetEntitiesWithCentersInRadius(self:getPos(), self.radius)
    local toBeActiveEntsSet = {}
    local enteringEntsList, leavingEntsList = {}, {}
    for _, ent in ipairs(foundEntsList) do
        local shouldBeActive = self.filter(ent, self)
        if shouldBeActive then
            toBeActiveEntsSet[ent] = true
            if self.activeEntsSet[ent] then
                -- active and staying active
            else
                -- just activated
                table.insert(enteringEntsList, ent)
            end
        end
    end
    for _, ent in pairs(self.activeEntsSet) do
        if toBeActiveEntsSet[ent] == true then
            -- active and staying active
        else
            -- just deactivated
            table.insert(leavingEntsList, ent)
        end
    end
    for _, ent in ipairs(enteringEntsList) do
        self.onTrigger(ent, 'enter')
    end
    for _, ent in ipairs(leavingEntsList) do
        self.onTrigger(ent, 'leave')
    end
    self.activeEntsSet = toBeActiveEntsSet
end

function CircleTrigger:render()
    if next(self.activeEntsSet) == nil then
        love.graphics.setColor(0, 1, 0, 1)
    else
        love.graphics.setColor(1, 0, 0, 1)
    end
    love.graphics.circle('line', 0, 0, self.radius)
end
