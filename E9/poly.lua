function poly(a,x)
  res = 0
  for i=1,#a do
    res = res + a[i]*x^(i-1)
  end
  return res
end

--a = {1,2,3,4,5,6}
a = {1,2,3}

function newpoly(coef,x)
  return function(x)
    local res = 0
    for i=1,#coef do
      res = res + coef[i]*x^(i-1)
    end
    return res
  end
end

f = newpoly({3,0,1})
print(f(0))
print(f(5))
print(f(10))