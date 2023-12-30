-- server script

local clickDetector = script.Parent
local porta = clickDetector.Parent
local aberta = false
local pivot = porta:GetPivot()


clickDetector.MouseClick:Connect(function()
	local number = math.random(0,200)
	if aberta then
		porta:PivotTo(pivot)
		aberta = false
	else
		porta:PivotTo(pivot*CFrame.Angles(0,math.rad(90),0))
		aberta = true
		print(number)
	end
end)
