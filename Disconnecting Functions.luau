-- server script or local script

local part = Instance.new("Part", workspace)
part.Position = Vector3.new(math.random(0,10), 0, math.random(0,10))

local timesLooped = 0

local touchedEvent

touchedEvent = part.Touched:Connect(function(hit) -- will be called 10 times and then stop
	
	local humanoid = hit.Parent:FindFirstChild("Humanoid")
	
	if humanoid == nil then return end
	
	humanoid.Health -= 5
	
	timesLooped += 1
	
	print(hit.Name.." touched the part")
	
	if timesLooped >= 10 then
		touchedEvent:Disconnect() -- disconnects the event (it will not work anymore)
	end
end)
