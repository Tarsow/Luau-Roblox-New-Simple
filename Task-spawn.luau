function printMessage(message)
	wait(2)
	print(message)
end

for i = 1, 5 do
	task.spawn(printMessage, "hello") -- creates five functions that run at the same time
	-- output = 20:28:45 hello(x5)
end
