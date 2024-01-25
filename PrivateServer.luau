local TeleportService = game:GetService("TeleportService")
local Teleport = script.Parent

Teleport.Touched:Connect(function(hit)
	local human = hit.Parent:FindFirstChild("Humanoid")
	if not human then return end
	local char = human.Parent
	local player = game.Players:GetPlayerFromCharacter(char)
	local ServerAccessCode = TeleportService:ReserveServer(16077237949)

	TeleportService:TeleportToPrivateServer(16077237949, ServerAccessCode, player)
end)
