function isByTwo(x)
  return (x & (x-1)) == 0
end

print(isByTwo(tonumber(arg[1])))