function average(func,...)
  return function(...) return func(...)/2 end
end

function integral(...)
  local s = 0
  for _,v in ipairs{...} do
    s = s + v
  end
  return s
end

a = average(integral)
print(a(1,2,3,4))