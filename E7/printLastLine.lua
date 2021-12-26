function lastLine(file)
  if not file then print("Expect file name!") return end
  
  local f = io.open(file, "r")
  local pos = f:seek("end")
  local chunkSize = 100

  while true do
    pos = pos - chunkSize
    f:seek("set", pos)

    lines = {}
    for line in f:lines() do
      lines[#lines+1] = line
    end
    
    if #lines > 1 then break end

  end
    print(lines[#lines])
end

function lastLineN(file,n)
  if not file then print("Expect file name!") return end

  local f = io.open(file, "r")
  local pos = f:seek("end")
  local chunkSize = 10

  while true do
    pos = pos - chunkSize
    f:seek("set", pos)

    lines = {}
    for line in f:lines() do
      lines[#lines+1] = line
    end
    
    if #lines > n then break end

  end
    for line=#lines-n+1,#lines do
      print(lines[line])
    end
end

lastLine("readme")
lastLineN("readme",10)