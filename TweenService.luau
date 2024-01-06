local tweenService = game:GetService("TweenService")
local part = script.Parent

local info = TweenInfo.new(
	2,								 -- tempo de duração da tween
	Enum.EasingStyle.Sine,			 -- estilo de easing
	Enum.EasingDirection.InOut,		 -- se o efeito vai ser de entrada, saída ou ambos
	-1,                              -- número de vezes que vai repetir (-1 = infinito) (0 = não vai repetir nenhuma vez)
	true,							 -- se ele vai ir e voltar
	2								 -- tempo antes de tocar a tween
)

local goals = { -- o destino do tween
	Size = Vector3.new(20,20,20),
	Position = Vector3.new(10,10,10),
	Color = Color3.fromRGB(5, 255, 34),
	Anchored = true
}

local tween = tweenService:Create(part, info, goals)
tween:Play()
