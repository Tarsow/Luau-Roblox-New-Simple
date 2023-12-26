local player = game:GetService("Players").LocalPlayer

local mouse = player:GetMouse()

local UIS = game:GetService("UserInputService")

while true do
	local block = mouse.Target
	if block then
		block:Destroy()
	end
	wait()
end
