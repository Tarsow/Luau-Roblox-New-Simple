-- local script

local ContextActionService = game:GetService("ContextActionService")

local Part = Instance.new("Part", workspace)
Part.Anchored = true
Part.Size = Vector3.new(10,10,10)

local debounce = false

local function TurnBrickRed()
	if not debounce then
		Part.Color = Color3.fromRGB(255, 0, 0)
		debounce = true
	else
		Part.Color = Color3.fromRGB(255, 255, 255)
		debounce = false
	end
end

local function TurnBrickYellow()
	if not debounce then
		Part.Color = Color3.fromRGB(255, 255, 0)
		debounce = true
	else
		Part.Color = Color3.fromRGB(255, 255, 255)
		debounce = false
	end
end

ContextActionService:BindAction("BrickRed", TurnBrickRed, true, "d") -- send one signal when pressed and another signal when finished pressing
task.wait(5)

ContextActionService:BindAction("BrickYellow", TurnBrickYellow, true, "d") -- overrides the past action binded to the keycode
ContextActionService:SetPosition("BrickYellow", UDim2.new(0.2,0,0.2,0)) -- sets the position of the touch button
task.wait(5)

ContextActionService:UnbindAction("BrickYellow") -- unbinds the 2nd action binded to the keycode

task.wait(20)
ContextActionService:UnbindAllActions() -- unbinds all the actions
