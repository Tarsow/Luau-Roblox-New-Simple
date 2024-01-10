function printMessage(message)
	wait(2)
	print(message)
end

for i = 1, 5 do
	task.spawn(printMessage, "hello") -- creates 5 threads with the same function
	-- output = 20:28:45 hello(x5)

	task.delay(5, printMessage, "hello") -- the same as task.spawn, but functions wait 5 seconds before starts

	task.wait(3) -- a better version of wait()
end


for i = 1, 5 do
	local thread = task.spawn(printMessage, "hello")
	-- output = 20:28:45 hello(x3)
	if i > 3 then
		task.cancel(thread) -- cancels the running thread, in the example, instead of printing hello(x5), it prints hello (x3), because the 2 others thread were cancelled
	end
end
