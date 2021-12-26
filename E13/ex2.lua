function bits(x)
  s = string.pack("J",x)
  return 8 * #s
end

function bits1()
  local x = ~0
  local cnt = 0
  while not math.ult(x,1) do
    x = x >> 1
    cnt = cnt + 1
  end
  return cnt
end

print(bits(tonumber(arg[1])))
print(bits1())