--

local entityBasicStuff = {
    getPos = function(self)
        return self._pos
    end,
    setPos = function(self, pos)
        assert(pos, 'pos is nil')
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
            if rawget(self, 'blocksLight') and self:blocksLight() and newCell:isIlluminated() or (oldCell and oldCell:isIlluminated()) then
                WORLD:refreshLight()
            end
            self._posChangeTime = GAMETIME
        end
    end,
    tryMove = function(self, dir, dontActuallyMove)
        local destPos = self:getPos() + math.cardinalToOffset(dir)
        local destCell = WORLD:getCell(destPos)

        local ignoreEnt = nil
        for ent in pairs(destCell.entsSet) do
            local checkFunc = rawget(ent, 'isMovable')
            if checkFunc and checkFunc(ent, self) then
                local entDestPos = destPos + math.cardinalToOffset(dir)
                local entDestCell = WORLD:getCell(entDestPos)
                if entDestCell:traversalPassTest(ent) then
                    if dontActuallyMove then
                        ignoreEnt = ent
                    else
                        ent:setPos(entDestPos)
                    end
                end
            end
        end
        if not destCell:traversalPassTest(self, ignoreEnt) then
            return false
        end
        if not dontActuallyMove then
            self:setPos(destPos)
        end
        return true
    end,
}

function _G.BasicEntSetup(self, data)
    util.copyFromTo(entityBasicStuff, self)

    self.renderDepth = self.renderDepth or RenderingDepth.Default
    self._cellIn = self._cellIn or nil
    self:setPos(self._pos or assert(data.pos))
    self._lastPos = self._lastPos or self._pos
    self._posChangeTime = self._posChangeTime or GAMETIME
end


