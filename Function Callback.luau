-- server script

local GameServices = require(game.ServerScriptService.ServiceModules.Services)

local function OnEat(food)
	print("Ate "..food)
end

GameServices.Eat("apple", OnEat)

-- module script

local Services = {}

function Services.Eat(food, callback)
	print("Eating "..food)
	
	if callback then
		callback(food)
	end
end

return Services
