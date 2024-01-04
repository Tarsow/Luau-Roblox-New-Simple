local UIS = game:GetService("UserInputService")
local pressed = false

UIS.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		print("player pressed: ",input.KeyCode)
		wait()
	end
end)
