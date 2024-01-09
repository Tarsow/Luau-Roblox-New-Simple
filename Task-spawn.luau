function printMessage(message)
	wait(2)
	print(message)
end

for i = 1, 5 do
	task.spawn(printMessage, "hello") -- creates 5 threads with the same function
	-- output = 20:28:45 hello(x5)
end
