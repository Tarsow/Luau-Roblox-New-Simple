-- server script

local partToRegion = game.Workspace.Part
local pos1 = partToRegion.Position - (partToRegion.Size/2)
local pos2 = partToRegion.Position + (partToRegion.Size/2)
local region1 = Region3.new(Vector3.new(pos1),Vector3.new(pos2))

--

local region2 = Region3.new(Vector3.new(20,0,20),Vector3.new(25,25,25))

local regionToPart = Instance.new("Part", workspace)
regionToPart.Anchored = true
regionToPart.Size = region2.Size
regionToPart.Transparency = 0.5
regionToPart.CanCollide = false

regionToPart.Touched:Connect(function(hit)
	local partsInRegion = workspace:FindPartsInRegion3WithIgnoreList(region2, {regionToPart, workspace.SpawnLocation, workspace.Baseplate}, math.huge)
	
	if hit.Parent:FindFirstChild("Humanoid") ~= nil then
		hit:Destroy()
	end
end)
