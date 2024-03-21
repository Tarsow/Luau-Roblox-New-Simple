function PrintNoodles(i)
  while true do
    task.wait(0.5) -- waits 0.5 second  
    print("Noodles: "..i)
  end  
end

task.delay(3, for i, 3, 1 do
  task.spawn(PrintNoodles(i) -- spawns the function
end)  -- waits 3 seconds before running the task

--[[ functions with task. are better than their normal selfs, because they are made specifically for roblox studio.
  task.wait, task.spawn and task.delay are functions created by roblox studio so they have a much better performance than
  wait, spawn and delay, which are from lua
  ]]--
