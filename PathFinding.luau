-- server script

local pathFinding = game:GetService("PathfindingService")

local finish = workspace.finish

local char = script.Parent

local human = char:FindFirstChild("Humanoid")
local HRP = char:FindFirstChild("HumanoidRootPart")

local path = pathFinding:CreatePath({
	AgentRadius = 3,
	AgentHeight = 6,
	AgentCanJump = true,
	Costs = {
		Water = 20
	}
})

path:ComputeAsync(HRP.Position, finish.Position)

local wayPoints = {}
local wpIndex = 1

local function followPath(goal)
	wayPoints = {}
	path:ComputeAsync(HRP.Position, finish.Position)
	if path.Status == Enum.PathStatus.Success then
		wayPoints = path:GetWaypoints()
		wpIndex = 1
		human:MoveTo(wayPoints[wpIndex].Position)
	end
end

human.MoveToFinished:Connect(function(reached)
	if reached and wpIndex < #wayPoints then
		wpIndex += 1
		if wayPoints[wpIndex].Action == Enum.PathWaypointAction.Jump then
			human.Jump = true
		end
		human:MoveTo(wayPoints[wpIndex].Position)
	end
end)

path.Blocked:Connect(function(blockedWpIndex)
	if blockedWpIndex > wpIndex then
		followPath(finish)
	end
end)

followPath(finish)
