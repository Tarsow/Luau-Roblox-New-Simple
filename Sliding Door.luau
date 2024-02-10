local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")

local TweenInfo = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0.5, false, 0)

local function MoveDoor(model, IsOpen)
	model.Button.Color = IsOpen and Color3.new(1, 0, 0) or Color3.new(0, 1, 0)
	model.Button.ProximityPrompt.ActionText = IsOpen and "Open" or "Close" 
	local z = model.Door.Size.Z * (IsOpen and 1.1 or -1.1)
	local x = model.Door.Size.X * (IsOpen and 1.1 or -1.1)
	local cFrame = model.Door.CFrame * ((math.abs(x) > math.abs(z) and CFrame.new(x,0,0) or CFrame.new(0,0,z)))
	local Tween = TweenService:Create(model.Door, TweenInfo, {CFrame = cFrame})
	Tween:Play()
	Tween.Completed:Wait()
end 

for i, model in pairs(CollectionService:GetTagged("IsSlidingDoor")) do
	local prompt = model:FindFirstChild("ProximityPrompt", true)
	local door = model:FindFirstChild("Door", true)
	
	prompt.Triggered:Connect(function()
		prompt.Enabled = false
		local IsOpen = model:GetAttribute("IsOpen")
		MoveDoor(model, IsOpen)
		model:SetAttribute("IsOpen", not IsOpen)
		prompt.Enabled = true
	end)
end
