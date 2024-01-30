-- server script

local myTable = {1,2,3,4}

local myMetatable = {
	__add = function(OurTable, Value)
		for i, v in ipairs(OurTable) do
			OurTable[i] = v + Value
		end
		
		return OurTable
	end,
	
	__sub = function(OurTable, Value)
		for i, v in ipairs(OurTable) do
			OurTable[i] = v - Value
		end
		
		return OurTable
	end,
}

setmetatable(myTable, myMetatable)

print(myTable) -- 1,2,3,4

myTable += 2

print(myTable) -- 3,4,5,6

myTable -= 3

print(myTable) -- 0,1,2,3

print(getmetatable(myTable))
