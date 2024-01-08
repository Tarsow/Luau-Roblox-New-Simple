-- server script

local part1 = game.Workspace.Part1
local part2 = game.Workspace.Part2

for i = 0, 1, 0.0001 do
	wait()
	part1.CFrame = part1.CFrame:Lerp(part2.CFrame, i)
end	
