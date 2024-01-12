-- module script

local module = {}

module.devs = {
	"matador666213",
	"dev2",
	"dev3",
	"dev4"
}

return module

-- server script

game.Players.PlayerAdded:Connect(function(player)
	local devs = require(game.ServerScriptService.ModuleScript).devs
	print(devs)
	player.CharacterAdded:Connect(function(character)
		for i, v in pairs(devs) do
			print("loop"..i.." done")
			if player.Name == v then
				local newSword = game.ReplicatedStorage.Sword:Clone()
				newSword.Parent = player.Backpack
				print("gave sword")
			end
		end
	end)
end)
