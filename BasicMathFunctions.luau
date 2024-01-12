-- server script

local basicMathFunctions = {
	floor = math.floor(3.3123124), -- returns the nearest integer below the number
	ceil = math.ceil(3.3123124), -- returns the nearest integer above the number
	abs = math.abs(-3.3123124), -- returns the absolute value of a number
	sqrt = math.sqrt(9), -- returns the square root of a number
	pow = math.pow(2, 5), -- raises a number to an exponent power
	rad = math.rad(90), -- returns the degrees in radians
	deg = math.deg(1), -- returns the radians in degrees
	max = math.max(1,2,3,4,5), -- returns the highest value in a list of numbers
	min = math.min(1,2,3,4,-5), -- returns the lowest value in a list of numbers
	random = math.random(0,10), -- return a random number between the two values
	pi = math.pi, -- returns pi
	round = math.round(5.7) -- returns the nearest integer
}

-- pi radians = 180 degrees

for i, v in pairs(basicMathFunctions) do
	print(i.." : "..v)
end


--[[ output =

ceil : 4
floor : 3
abs : 3.3123124
sqrt : 3
min : -5
max : 5
rad : 1.5707963267948966
pi : 3.141592653589793
pow : 32
round : 6
random : 0
deg : 57.29577951308232

]]--
