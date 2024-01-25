-- server script

local TeleportService = game:GetService("TeleportService")
local Teleport = script.Parent

local TeleportData = {
	Crouching = false
}

Teleport.Touched:Connect(function(hit)
	local human = hit.Parent:FindFirstChild("Humanoid")
	if not human then return end
	local char = human.Parent
	local player = game.Players:GetPlayerFromCharacter(char)
	TeleportService:Teleport(16077237949, player, TeleportData)
end)

-- local script

local TeleportService = game:GetService("TeleportService")
local Player = game.Players.LocalPlayer

local TeleportData = TeleportService:GetLocalPlayerTeleportData()

if TeleportData.Crouching == true then
	print("Player is crouching.")
end
