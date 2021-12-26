--0.007775
function copyByteByByte(file)
  if not file then print("Expect file name!") return end
  local startTime = os.clock()
  
  local l =""
  local cmd = "cat "..file
  local f = io.popen(cmd, "r")

  while true do
    l = f:read(1)
    if not l then break end
    io.write(l)
  end

  f:close()
  local endTime = os.clock()
  print("Time byte by byte: ", endTime-startTime)
end

--0.0032
function copyLineByLine(file)
  if not file then print("Expect file name!") return end

  local startTime = os.clock()
  local cmd = "cat "..file
  local f = io.popen(cmd, "r")

  for l in f:lines() do
    io.write(l, '\n')
  end

  f:close()

  local endTime = os.clock()
  print("Time line by line: ", endTime-startTime)
end

--0.001385
function copyChunk8K(file)
  if not file then print("Expect file name!") return end

  local startTime = os.clock()
  local cmd = "cat "..file
  local f = io.popen(cmd, "r")

  while true do
    local block, rest = f:read(2^13, "L")
    if not block then break end
    if rest then block = block..rest end
    io.write(block)
  end
  f:close()
  
  local endTime = os.clock()
  print("Time chunk: ", endTime-startTime)
end

--0.002032
function copyAll(file)
  if not file then print("Expect file name!") return end

  local startTime = os.clock()
  local cmd = "cat "..file
  local f = io.popen(cmd, "r")
  local l = f:read("a")
  io.write(l)
  f:close()

  local endTime = os.clock()
  print("Time whole file: ", endTime-startTime)
end

copyByteByByte("readme")
copyLineByLine("readme")
copyChunk8K("readme")
copyAll("readme")