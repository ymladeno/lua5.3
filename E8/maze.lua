function room1()
  print("Enter room1")
  while true do
    move = io.read()
    if move ~= "south" and move ~= "east" then
       print("Room1: invalid room")
    else
      break
    end
  end
  if move == "south" then room3()
  elseif move == "east" then room2()
  end
end

function room2()
  print("Enter room2")
  while true do
    move = io.read()
    if move ~= "south" and move ~= "west" then 
      print("Room2: invalid room")
    else
      break
    end
  end
  if move == "south" then room4()
  elseif move == "west" then room1()
  end
end

function room3()
  print("Enter room3")
  while true do
    move = io.read()
    if move ~= "north" and move ~= "east" then 
      print("Room3: invalid room")
    else
      break
    end
  end
  if move == "north" then room1()
  elseif move == "east" then room4()
  end
end

function room4()
  print("Congratulations, you won!")
end

room1()