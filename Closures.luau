function makeCounter()
    local count = 0
    return function()
        count = count + 1
        return count
    end
end

local counter = makeCounter()
print(counter())  -- Output: 1
print(counter())  -- Output: 2

local counter2 = createCounter()
print(counter2())  -- Output: 1
