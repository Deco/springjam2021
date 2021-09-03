--

local entityBasicStuff = {
    getPos = function(self)
        return self._pos
    end,
    setPos = function(self, pos)
        self._lastPos = self._pos
        self._pos = Vec(math.floor(pos.x), math.floor(pos.y))
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

    self._pos = self._pos or assert(data.pos)
    self._lastPos = self._lastPos or self._pos
    self._rot = self._rot or data.rot or Cardinal.Up
    self._lastRot = self._lastRot or self._rot
end


