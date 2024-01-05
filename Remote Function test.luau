-- local script

local player = game:GetService("Players").LocalPlayer
local part = game.Workspace.Part

part.Touched:Connect(function()
	print("got it")
	game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(player)
end)

-- server script

game:GetService("ReplicatedStorage").RemoteFunction.OnServerInvoke = function(player)
	print(player.Name)
end
