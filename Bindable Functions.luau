--server script

local binFunction = game.ReplicatedStorage.BindableFunction

local bannedList = {"banned1", "matador666213", "banned3", "banned4"}

binFunction.OnInvoke = function(player)
	for i, v in pairs(bannedList) do
		if player.Name == v then
			return true
		end
	end
end

-- server script

local binFunction = game.ReplicatedStorage.BindableFunction

game.Players.PlayerAdded:Connect(function(player)
	local banned = binFunction:Invoke(player)
	if banned then
		player:Kick("youre banned for eternity")
	end
end)
