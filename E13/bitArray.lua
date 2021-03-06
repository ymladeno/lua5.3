function newBitArray(n)
  local t = {}
  local w = n//64
  if n > w*64 then w = w + 1 end
  
  for i=1,w do
    t[#t+1] = 0
  end

  return t
end

function setBit(a,n,v)
  local byte = n//64 + 1
  local bit = n%64
  local val = a[byte]
  val = (val & ~(1<<bit)) | (v*1<<bit)
  a[byte] = val
end

function testBit(a,n)
  local byte = n//64+1
  local bit = n%64
  local val = a[byte] & 1<<bit
  return val == 0 and 0 or 1
end

t = newBitArray(tonumber(arg[1]))
print(#t)
setBit(t,10,1)
print(testBit(t,10))