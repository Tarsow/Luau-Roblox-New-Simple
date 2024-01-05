local part = script.Parent

part.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local char = hit.Parent
		local head = char:FindFirstChild("Head")
		local weld = Instance.new("Weld", workspace)
		weld.Part0 = part
		weld.Part1 = head
	end
end)
