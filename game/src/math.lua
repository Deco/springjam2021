--
local ffi = require "ffi"
local sqrt, cos, sin, atan2, pow = math.sqrt, math.cos, math.sin, math.atan2, math.pow

_G.Cardinal = {
    Up = 1,
    Right = 2,
    Down = 3,
    Left = 4,
}

_G.Diagonal = {
    Up = 1,
    UpRight = 2,
    Right = 3,
    DownRight = 4,
    Down = 5,
    DownLeft = 6,
    Left = 7,
    UpLeft = 8,
}

math.tau = 2 * math.pi
math.oneOverTau = 1 / (2 * math.pi)
math.epsilon = 0.00001

function math.cardinalToAng(dir)
    return (dir - 1) * 0.25 * math.tau
end

function math.turnCardinal(dir, turns)
    return math.indexWrap(dir + turns, 4)
end

function math.cardinalToOffset(dir)
    if dir == Cardinal.Up then return Vec(0, -1) end
    if dir == Cardinal.Right then return Vec(1, 0) end
    if dir == Cardinal.Down then return Vec(0, 1) end
    if dir == Cardinal.Left then return Vec(-1, 0) end
end

function math.offsetToCardinal(offset)
    if offset == Vec(0, -1) then return Cardinal.Up end
    if offset == Vec(1, 0) then return Cardinal.Right end
    if offset == Vec(0, 1) then return Cardinal.Down end
    if offset == Vec(-1, 0) then return Cardinal.Left end
end

--function math.wrapAng(ang)
--    -- into -0.5 to 0.5 range
--    return math.mod(ang + 0.5, 1.0) - 0.5
--end

function math.nearlyEqual(a, b, e)
    return math.abs(b - a) <= (e or math.epsilon)
end

function math.sign(val)
    return val > 0 and 1 or val < 0 and -1 or 0
end

function math.mod(a, b)
    return ((a % b) + b) % b
end

function math.indexWrap(idx, count)
    return math.mod(idx - 1, count) + 1
end

function math.floorTo(val, interval)
    return math.floor(val / interval) * interval
end

function math.remap(v, srcLow, srcHigh, destLow, destHigh)
    return destLow + (destHigh - destLow) * (v - srcLow) / (srcHigh - srcLow)
end

function math.clamp(v, min, max)
    return math.min(math.max(v, min), max)
end

function math.clampMag(v, mag)
    return math.sign(v) * math.clamp(math.abs(v), 0, mag)
end

function math.remapClamp(v, srcLow, srcHigh, destLow, destHigh)
    return destLow + (destHigh - destLow) * math.clamp((v - srcLow) / (srcHigh - srcLow), 0, 1)
end

function math.easeOutQuad(t, start, final) return (start - final) * t * (t - 2) + start end
function math.easeOutQuint(t, start, final) return (final - start) * (pow(t, 5) + 1) + start end


--function math.aspectFit(mode)
--    if mode == 'contain' then
--
--    elseif mode == 'cover' then
--    else assert(false) end
--end

do
    local vector = {}
    vector.__index = vector
    local new

    --function vector:clone()
    --    return new(self.x, self.y)
    --end

    function vector:withX(x) return new(x, self.y) end
    function vector:withY(y) return new(self.x, y) end

    function vector:xy()
        return self.x, self.y
    end

    function vector:__tostring()
        return "<" .. tonumber(self.x) .. "," .. tonumber(self.y) .. ">"
    end

    function vector.__unm(a)
        return new(-a.x, -a.y)
    end

    function vector.__add(a, b)
        return new(a.x + b.x, a.y + b.y)
    end

    function vector.__sub(a, b)
        return new(a.x - b.x, a.y - b.y)
    end

    function vector.__mul(a, b)
        if type(a) == "number" then
            return new(a * b.x, a * b.y)
        elseif type(b) == "number" then
            return new(a.x * b, a.y * b)
        else
            return Vec(a.x * b.x, a.y * b.y)
        end
    end

    function vector.__div(a, b)
        if type(a) == "number" then
            return new(a / b.x, a / b.y)
        elseif type(b) == "number" then
            return new(a.x / b, a.y / b)
        else
            return Vec(a.x / b.x, a.y / b.y)
        end
    end

    function vector.__eq(a, b)
        if type(a) ~= "cdata" and type(a) ~= "table" then return false end
        if type(b) ~= "cdata" and type(b) ~= "table" then return false end
        return a.x == b.x and a.y == b.y
    end

    --function vector.__lt(a, b)
    --    return a.x < b.x or (a.x == b.x and a.y < b.y)
    --end
    --
    --function vector.__le(a, b)
    --    return a.x <= b.x and a.y <= b.y
    --end

    function vector:magSq()
        return self.x * self.x + self.y * self.y
    end

    function vector:mag()
        return sqrt(self.x * self.x + self.y * self.y)
    end

    function vector.dist(a, b)
        local dx, dy = a.x - b.x, a.y - b.y
        return sqrt(dx * dx + dy * dy)
    end

    function vector.distSq(a, b)
        local dx, dy = a.x - b.x, a.y - b.y
        return (dx * dx + dy * dy)
    end

    --function vector:normalizeMe()
    --    local mag = self:mag()
    --    if mag < math.epsilon then return end -- uuuuuh
    --    self.x, self.y = self.x / mag, self.y / mag
    --end

    function vector:normalizedOrNil()
        local mag = self:mag()
        if mag < math.epsilon then return nil end -- careful!
        return new(self.x / mag, self.y / mag)
    end

    function vector:normalized()
        local mag = self:mag()
        if mag < math.epsilon then return new(0, 0) end
        return new(self.x / mag, self.y / mag)
    end

    --function vector:rotateMe(frac)
    --    local phi = frac * -math.tau
    --    local c, s = cos(phi), sin(phi)
    --    self.x, self.y = c * self.x - s * self.y, s * self.x + c * self.y
    --    return self
    --end

    function vector:rotated(frac)
        local phi = frac * -math.tau
        local c, s = cos(phi), sin(phi)
        return new(c * self.x - s * self.y, s * self.x + c * self.y)
    end

    function vector:projectOn(v)
        local s = (self.x * v.x + self.y * v.y) / (v.x * v.x + v.y * v.y)
        return new(s * v.x, s * v.y)
    end

    function vector:mirrorOn(v)
        local s = 2 * (self.x * v.x + self.y * v.y) / (v.x * v.x + v.y * v.y)
        return new(s * v.x - self.x, s * v.y - self.y)
    end

    -- ref.: http://blog.signalsondisplay.com/?p=336
    function vector:clampedMag(maxMag)
        if self:magSq() <= maxMag * maxMag then return self end
        return self:normalized() * maxMag
    end

    function vector:angle()
        return atan2(self.x, -self.y) / math.tau -- returns -0.5 to 0.5
    end
    function vector:angleTo(other)
        return atan2(other.x - self.x, self.y - self.y) / math.tau -- returns -0.5 to 0.5
    end
    _G.MakeVecFromAng = function(frac, mag)
        local phi = frac * math.tau
        if mag == nil then mag = 1 end
        return new(sin(phi) * mag, -cos(phi) * mag)
    end

    function vector.__new(ct, x, y)
        return ffi.new(ct, x, y)
    end
    _G.Vec = ffi.metatype("struct { const double x, y; }", vector)
    new = Vec

    --local function hmm(frac, mag)
    --    local v = MakeVecFromAng(frac, mag)
    --    print(string.format('frac=% 1.4f, mag=% 1.4f, x=% 1.4f, y=% 1.4f, a=% 1.4f, m=% 1.4f', frac, mag, v.x, v.y, v:angle(), v:mag()))
    --end
    ----hmm(0, 1)
    ----hmm(0.125, 1)
    ----hmm(0.25, 1)
    ----hmm(0.375, 1)
    ----hmm(0.5, 1)
    ----hmm(0.625, 1)
    ----hmm(0.75, 1)
    ----hmm(0.875, 1)
    ----hmm(1, 1)
    ----hmm(3, 1)
    --hmm(-0.500, 1)
    --hmm(-0.375, 1)
    --hmm(-0.250, 1)
    --hmm(-0.125, 1)
    --hmm(0.000, 1)
    --hmm(0.125, 1)
    --hmm(0.25, 1)
    --hmm(0.375, 1)
    --hmm(0.5, 1)
    --hmm(0.625, 5)


    --local function hmm(x0, y0, x1, y1)
    --    local v0 = new(x0, y0)
    --    local v1 = new(x1, y1)
    --    local d = v1 - v0
    --    print(string.format('dx=% 1.4f, dy=% 1.4f, a=% 1.4f, m=% 1.4f', d.x, d.y, v0:angleTo(v1), v0:dist(v1)))
    --end
    --hmm(10, 10, 10, 20)
    --hmm(10, 10, 20, 20)
    --hmm(10, 10, 20, 10)
    --hmm(10, 10, 0, 0)
end

do
    local aabb = {}
    aabb.__index = aabb
    local new

    function aabb:clone()
        return ffi.new(new, self.x0, self.y0, self.x1, self.y1)
    end

    function aabb:tl() return Vec(self.x0, self.y0) end
    function aabb:tr() return Vec(self.x1, self.y0) end
    function aabb:bl() return Vec(self.x0, self.y1) end
    function aabb:br() return Vec(self.x1, self.y1) end
    function aabb:size() return Vec(self.x1 - self.x0, self.y1 - self.y0) end

    function aabb:xy()
        return self.x, self.y
    end

    function aabb:expandToIncludeVec(vec)
        return ffi.new(new,
            math.min(self.x0, vec.x),
            math.min(self.y0, vec.y),
            math.max(self.x1, vec.x),
            math.max(self.y1, vec.y)
        )
    end

    function aabb:expandToIncludeAABB(other)
        return ffi.new(new,
            math.min(self.x0, other.x0),
            math.min(self.y0, other.y0),
            math.max(self.x1, other.x1),
            math.max(self.y1, other.y1)
        )
    end

    function aabb:__tostring()
        return string.format("<AABB|%f,%f|%f,%f>", self.x0, self.y0, self.x1, self.y1)
    end

    _G.AABBFromCenterAndSize = function(center, size)
        local halfSize = size * 0.5
        return ffi.new(new, center.x - halfSize.x, center.y - halfSize.y, center.x + halfSize.x, center.y + halfSize.y)
    end
    _G.AABBfromXYWH = function(x, y, w, h)
        return ffi.new(new, x, y, x + w, y + h)
    end

    function aabb.__new(ct, tl, br)
        return ffi.new(ct, math.min(tl.x, br.x), math.min(tl.y, br.y), math.max(tl.x, br.x), math.max(tl.y, br.y))
    end
    _G.AABB = ffi.metatype("struct { double x0, y0, x1, y1; }", aabb)
    new = AABB
end


