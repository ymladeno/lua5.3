-- ignore spaces and punctuactions

function ispali(s)
  s = string.gsub(s," ","")
  s = string.gsub(s,"!","")
  r = string.gsub(s, utf8.charpattern, function(c) return #c > 1 and c:reverse() end)
  r = r:reverse()

  print(r, '==', s)
  return s == r
end

print(ispali("ação"))
print(ispali("açoãoça"))
