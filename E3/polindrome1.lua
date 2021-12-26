-- ignore spaces and punctuations

function ispali(s)
  s = string.gsub(s," ","")
  s = string.gsub(s,"!","")
  return s == string.reverse(s)
end

print(ispali("step on no pets "))
print(ispali("!step on no pets "))
print(ispali("banana"))
