function seqtest(a)
  for i =1,#a do
    if a[i] == nil then
      return false
    end
  end
  return true
end

a = {1,3,10}
b = {1, nil, 100}

print(seqtest(a))
print(seqtest(b))