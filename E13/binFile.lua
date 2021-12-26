function writeFile()
  local f = io.open("records", "wb")
  local s = string.pack("i b b b f", 100, 0x46, 0x47, 0x48, 102.3)
  f:write(s)
  f:close()
end

function readFile()
  local f = io.open("records", "rb")
  local data = f:read("a")
  local x,pos = string.unpack("i", data)
  local a = {}
  a[1],pos = string.unpack("b", data, pos)
  a[2],pos = string.unpack("b", data, pos)
  a[3],pos = string.unpack("b", data, pos)
  local y = string.unpack("f", data, pos)
  f:close()
  print(x, a[1], a[2], a[3], y)
  print(x + a[1] + a[2] + a[3] + y)
end

readFile()