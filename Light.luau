-- local script

local runService = game:GetService("RunService")
local char = script.Parent
local HRP = char:FindFirstChild("HumanoidRootPart")
local light = game.ReplicatedStorage.Assets.Light
local UIS = game:GetService("UserInputService")
local active = false

runService.Heartbeat:Connect(function()
	light.SpotLight.Enabled = active
	light.Parent = char
	light.CFrame = HRP.CFrame
end)

UIS.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F then
		active = not active
	end
end)

