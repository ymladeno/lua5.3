function bits(x)
  local cnt = 0
  local mask = 0x01
  for i=1,64 do
    cnt = cnt + (x & mask)
    x = x >> 1
  end
  return cnt
end

function bits1(x)
  local cnt = 0
  local mask = 0x01
  for i=1,64 do
    if not math.ult((x & mask),1) then
      cnt = cnt + 1
    end
--    print(string.format("%d. 0x%02x 0x%x %d", i,mask,x,cnt))
    mask = mask << 1
  end
  return cnt
end

print(bits(tonumber(arg[1])))
print(bits1(tonumber(arg[1])))