-- local script

local devProductId = 1729533334
local marketPlaceService = game:GetService("MarketplaceService")
local player = game.Players.LocalPlayer

while task.wait(3) do
	marketPlaceService:PromptProductPurchase(player, devProductId, true)
end	

-- server script

local devProductId = 1729533334
local marketPlaceService = game:GetService("MarketplaceService")
local sword = game.ReplicatedStorage.Sword

local function receipt(info)
	local player = game.Players:GetPlayerByUserId(info["PlayerId"])
	
	print(info) -- output = ["CurrencySpent"] = 0,
				--["CurrencyType"] = Robux,
				--["PlaceIdWherePurchased"] = 15741687089,
				--["PlayerId"] = 141554776,
				--["ProductId"] = 1729533334,
				--["PurchaseId"] = "303288dbe0f5eb4e75624f09a7d3f790"
	
	if not player then
		-- player probally left the game, will receive the product when comes back
		return Enum.ProductPurchaseDecision.NotProcessedYet
	else
		if info.ProductId == devProductId then
			local newSword = sword:Clone()
			newSword.Parent = player.Backpack
		else
			player:Kick("get out of here")
		end
		
		return Enum.ProductPurchaseDecision.PurchaseGranted
		
	end
end


marketPlaceService.ProcessReceipt = receipt
