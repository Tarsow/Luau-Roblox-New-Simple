--server script (inside ball part)

script.Parent.Touched:Connect(function(hit)
	local Human = hit.Parent:WaitForChild("Humanoid")
	Human.WalkSpeed += 1
	script.Parent:Destroy()
	game.ReplicatedStorage:WaitForChild("BallsAlive").Value -= 1
	game.ReplicatedStorage:WaitForChild("RemoteEvent"):FireClient()
end)

--server script (in server script service)

while game.ReplicatedStorage:WaitForChild("BallsAlive").Value < 250 do
		local NewBall = game:GetService("ServerStorage").Ball:Clone()
		NewBall.Parent = workspace
		NewBall.Position = Vector3.new(math.random(-100,100), 2,math.random(-100,100))
		wait()
		game.ReplicatedStorage:WaitForChild("BallsAlive").Value += 1
end
