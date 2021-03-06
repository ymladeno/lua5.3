function udiv(n,d)
  if d < 0 then
    if math.ult(n,d) then return 0
    else return 1
    end
  end
  local q = ((n >> 1) // d) << 1
  local r = n - q * d
  if not math.ult(r, d) then q = q + 1 end
  return q
end

function umod(n,d)
  if d < 0 then
    if math.ult(n,d) then return 0
    else return 1
    end
  end
  local q = ((n >> 1) // d) << 1
  local r = n - q * d
  if not math.ult(r, d) then q = q + 1 end
  local mod = n - d * q
  return mod
end

x = 0x8000000000000010
print(string.format("0x%x", udiv(tonumber(arg[1]),tonumber(arg[2]))))
print(string.format("0x%x", umod(tonumber(arg[1]),tonumber(arg[2]))))