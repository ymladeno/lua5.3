function day1Friday(y)
  local t = os.time({year=y, month=1, day=1, hour=0})
  local d = os.date("*t", t)
  local diffwday = 6 - d.wday%7
  local diffday = 1 + diffwday
  return diffday
end

--print(day1Friday(1980))
print(day1Friday(tonumber(arg[1])))