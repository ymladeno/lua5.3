function poly(a,x)
  res = 0
  for i=1,#a do
    res = res + a[i]*x^(i-1)
  end
  return res
end

--a = {1,2,3,4,5,6}
a = {1,2,3}

print(poly(a, 10))
-- 1 + 2*10 + 3*10(2) + 4