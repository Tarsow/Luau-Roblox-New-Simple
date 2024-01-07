-- module script

local module = {
	dogs = {size = "big", domestic = true, weight = 50},
	cats = {size = "medium", domestic = true, weight = 10},
	rats = {size = "small", domestic = false, weight = 1}
}

module.Function = function(parameters)
	return parameters * 2
end 

return module

-- server script

local module = require(game.ServerStorage.ModuleScript)

print(module.rats.size) -- output = small
print(module.cats.weight*module.dogs.weight) -- output = 500
print(module.dogs) -- output = {["domestic"] = true, ["size"] = "big", ["weight"] = 50}


print(module.Function(15)) -- output = 30
