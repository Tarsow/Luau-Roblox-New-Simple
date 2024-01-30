-- server script

local myTable = {1,2,3,4}

local myMetatable = {
	__add = function(OurTable, Value)
		local Result = {}
		for i, v in ipairs(OurTable) do
			Result[i] = v + Value
		end
		
		return Result
	end,
	
	__sub = function(OurTable, Value)
		local Result = {}
		for i, v in ipairs(OurTable) do
			Result[i] = v - Value
		end
		
		return Result
	end,
	


	__tostring = function(OurTable)
		local Result = ""
		for i, v in ipairs(OurTable) do
			Result = Result..OurTable[i]..", "
		end	
		return Result
	end
}

setmetatable(myTable, myMetatable)

print(myTable) -- 1,2,3,4,

NewTable = myTable + 10

print(NewTable) -- 11,12,13,14
print(myTable) -- 1,2,3,4,

print(tostring(myTable)) -- 1,2,3,4,

-- lines 37, 42 and 45 print the exact same value because when a table is printed it automatically calls the __tostring metamethod
