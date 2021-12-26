function pali(x)
  local t = {}
  while x > 0 do
--    print(string.format("0x%x", x))
    local r = x%2
    t[#t+1] = r
    x = (x -r) //2
--    print(string.format("0x%x %x", x, r))
  end
  
  local s = table.concat(t)
  return s == s:reverse()
end

print(pali(tonumber(arg[1])))