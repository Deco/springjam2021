--

local entityBasicStuff = {
    getPos = function(self)
        return self._pos
    end,
    setPos = function(self, pos)
        local oldCell = self._cellIn
        if self._cellIn ~= nil then
            self._cellIn.entsSet[self] = nil
        end
        local newCell = WORLD:getCell(pos)
        newCell.entsSet[self] = true
        self._cellIn = newCell
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
            if newCell:illuminated() or (oldCell and oldCell:illuminated()) then
                for _, lightSource in pairs(WORLD.lightSources) do
                    lightSource:updateLight()
                end
            end
            self._posChangeTime = GAMETIME
        end
    end,
    tryMove = function(self, dir)
        local destPos = self:getPos() + math.cardinalToOffset(dir)
        local destCell = WORLD:getCell(destPos)

        for ent in pairs(destCell.entsSet) do
            print("trying to move: " .. ent.__name)
            if rawget(ent, 'isMovable') then
                local entDestPos = destPos + math.cardinalToOffset(dir)
                local entDestCell = WORLD:getCell(entDestPos)
                if entDestCell:traversableTest(ent) then
                    ent:setPos(entDestPos)
                end
            end
        end
        if not destCell:traversableTest(self) then
            return false
        end
        self:setPos(destPos)
        return true


    end,
}

function _G.BasicEntSetup(self, data)
    util.copyFromTo(entityBasicStuff, self)

    self._cellIn = self._cellIn or nil
    self:setPos(self._pos or assert(data.pos))
    self._lastPos = self._lastPos or self._pos
    self._posChangeTime = self._posChangeTime or GAMETIME
end


