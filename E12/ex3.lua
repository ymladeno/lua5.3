function currentHourToSec(t)
  local sec2hour = 60 * 60
  local sec2day = sec2hour * 24
  local hour = t % sec2day // sec2hour
  return hour * sec2hour
end

sec = currentHourToSec(os.time())
print(sec)