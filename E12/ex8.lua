function timeZone()
  local t = os.date("*t")
  local zone = os.date("%z", os.time(t))
  return zone
end

print(timeZone())