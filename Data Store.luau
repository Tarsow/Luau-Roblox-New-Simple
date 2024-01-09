-- server script

local dataStoreService = game:GetService("DataStoreService")
local dataStore1 = dataStoreService:GetDataStore("dataStore1") -- its possible to assign data to multiple data stores

local part = Instance.new("Part", workspace)
part.Position = Vector3.new(3,0,3)

game.Players.PlayerAdded:Connect(function(player) -- load data when player enters
	local leaderstats = Instance.new("Folder", player) -- leaderboard
	leaderstats.Name = "leaderstats"
	
	local Money = Instance.new("IntValue", leaderstats)
	Money.Name = "Money"
	
	local Wins = Instance.new("IntValue", leaderstats)
	Wins.Name = "Wins"
	
	local playerUserId = "Player_"..player.UserId -- every account has an unique userId
	
	local data = {} -- creating data as a table to store multiple things
	
	local success, errormessage = pcall(function() -- calls a protected function where it doesnt stop even when an error occurs
		data = dataStore1:GetAsync(playerUserId) -- assigning the data in the dataStore to the table
	end)
	
	if success then
		print("data loaded successfully")
	else	
		print("error: "..errormessage)
	end
	
	if success and data then -- if the pcall was a success and data exists then
		Money.Value = data.Money
		Wins.Value = data.Wins
	end
	
end)

game.Players.PlayerRemoving:Connect(function(player)
	local playerUserId = "Player_"..player.UserId
	
	local data = {
	Money = player.leaderstats.Money.Value, 
	Wins = player.leaderstats.Wins.Value
	}
	
	local success, errormessage = pcall(function()
		dataStore1:SetAsync(playerUserId, data) -- saving the data
	end)
	
	if success then
		print("data saved successfully")
	else	
		print("error: "..errormessage)
	end
	
	
end)

part.Touched:Connect(function(hit)
	local humanoid = hit.Parent:FindFirstChild("Humanoid")
	if humanoid == nil then return end
	local char = humanoid.Parent
	local player = game.Players:GetPlayerFromCharacter(char)
	player.leaderstats.Money.Value += 10
	player.leaderstats.Wins.Value += 1
end)
