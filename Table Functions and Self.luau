-- server script

local myTable = {}

myTable.newFunction1 = function (a, b)
	print(a, b)
	print("----------------")
end

function myTable:newFunction2(a, b)
	print(a, b)
	print(self)
	print("----------------")
end


myTable.newFunction1("function1") --function1 nil

myTable:newFunction1("function1") -- {["newFunction1"] = "function", ["newFunction2"] = "function"} function1


myTable.newFunction2("function2") -- nil nil, function2

myTable:newFunction2("function2") -- function2 nil, {["newFunction1"] = "function", ["newFunction2"] = "function"}


--[[ output =
function1 nil
----------------
{
	["newFunction1"] = "function",
	["newFunction2"] = "function"
} function1
----------------
nil nil
function2
----------------
function2 nil
{
	["newFunction1"] = "function",
	["newFunction2"] = "function"
}
----------------
]]--

myTable.Bag = {"apple","sword","helmet","sunglasses"}

function myTable:CountItems()
	local NumberOfItems = 0
	for i, v in pairs(self.Bag) do
		NumberOfItems += 1
	end
	return NumberOfItems
end

print(myTable:CountItems()) -- 4
