Point = {x = 0, y = 0}

function Point:new(x, y)
    local obj = {x = x, y = y}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Point:move(dx, dy)
    self.x = self.x + dx
    self.y = self.y + dy
end

local p1 = Point:new(1, 2)
local p2 = Point:new(3, 4)

p1:move(5, 5)
print(p1.x, p1.y)  -- Output: 6 7
