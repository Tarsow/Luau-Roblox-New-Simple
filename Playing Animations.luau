-- local script

local animation = script.Animation
animation.AnimationId = "rbxassetid://15930245508"

local player = game.Players.LocalPlayer
local char = player.Character

local function onCharacterAdded(character)
	local hum = character:WaitForChild("Humanoid")

	local animationTrack = hum:LoadAnimation(animation)

	while wait(2) do
		animationTrack:Play()
	end
end

player.CharacterAdded:Connect(onCharacterAdded)
