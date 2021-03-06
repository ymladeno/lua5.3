local function getFileByte(t, key)
  return t.bytes[key]
end

local function setFileByte(t, key, value)
  t.bytes[key] = value
  local str = string.char(table.unpack(t.bytes))
  local f = io.open("temp", "w")
  f:write(str)
  f:close()
end

local function getFileLength(t)
  return #t.bytes
end

local function nextFileByte(t)
  return function(_, k)
    local nextKey, nextValue = next(t.bytes, k)
    return nextKey, nextValue
  end
end

function fileAsArray(name)
  local f = io.open(name, "r")
  local s = f:read("a")
  f:close()
  local proxy = { filename = name, bytes = {string.byte(s, 1, -1)} }
  local mt = {
    __index = getFileByte,
    __newindex = setFileByte,
    __len = getFileLength,
    __pairs = nextFileByte
  }
  setmetatable(proxy, mt)
  return proxy
end

local t = fileAsArray("temp")
local x = t[2]
t[2] = x+1

print("second byte: ", string.char(x))
print("length: ", #t)

for k,v in pairs(t) do print(k, string.char(v)) end