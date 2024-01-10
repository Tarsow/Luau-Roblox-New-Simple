-- local script

local marketPlaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer
local hasgamepass = false
local gamepassId = 685760245

local function promptPurchase ()
	
	local success, errormessage = pcall(function()
		hasgamepass = marketPlaceService:UserOwnsGamePassAsync(player.UserId, gamepassId)
	end)
	
	if not success then print(errormessage) end
	
	if hasgamepass then
		warn(player.Name.." has gamepass")
	else
		marketPlaceService:PromptGamePassPurchase(player, gamepassId)
	end

end

promptPurchase()

-- server script

local marketPlaceService = game:GetService("MarketplaceService")

local gamepassId = 685760245
local RP = game.ReplicatedStorage
local sword = RP.Sword

marketPlaceService.PromptGamePassPurchaseFinished:Connect(function(player, gamepass, purchased)
	
	if purchased and gamepass == gamepassId then
		print("player bought the gamepass")
		local newSword = sword:Clone()
		newSword.Parent = player.Backpack
	end
	
end)

game.Players.PlayerAdded:Connect(function(player)
	
	local hasgamepass = false
	
	local success, errormessage = pcall(function()
		hasgamepass = marketPlaceService:UserOwnsGamePassAsync(player.UserId, gamepassId)
	end)

	if hasgamepass and success then
		local newSword = sword:Clone()
		newSword.Parent = player.Backpack
	else 	
		print(errormessage)
	end
end)
