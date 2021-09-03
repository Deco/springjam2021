--

local entityBasicStuff = {
    getPos = function(self)
        return self._pos
    end,
    setPos = function(self, pos)
        if self._lastPos ~= nil then
            local currCell = WORLD:getCell(self._lastPos)
            currCell.entsSet[self] = nil
        end
        local newCell = WORLD:getCell(pos)
        newCell.entsSet[self] = true
        self._lastPos = self._pos
        self._pos = Vec(math.floor(pos.x), math.floor(pos.y))

        if self._pos ~= self._lastPos then
            for other in pairs(newCell.entsSet) do
                if other ~= self then
                    if self.class ~= TheCamera and other.class ~= TheCamera then
                        print('touch', self, other)
                    end
                    if rawget(self, 'onTouch') then self:onTouch(other) end
                    if rawget(other, 'onTouch') then other:onTouch(self) end
                end
            end
        end
    end,
    getRot = function(self)
        return self._rot
    end,
    setRot = function(self, rot)
        self._lastRot = rot
        self._rot = rot
    end,
    tryMove = function(self, dir)
        local destPos = self:getPos() + math.cardinalToOffset(dir)
        local destCell = WORLD:getCell(destPos)
        if destCell:solidTest(self) then
            return
        end
        self:setPos(destPos)
    end,
}

function _G.BasicEntSetup(self, data)
    util.copyFromTo(entityBasicStuff, self)

    self:setPos(self._pos or assert(data.pos))
    self._lastPos = self._lastPos or self._pos
    self:setRot(self._rot or data.rot or Cardinal.Up)
    self._lastRot = self._lastRot or self._rot
end


