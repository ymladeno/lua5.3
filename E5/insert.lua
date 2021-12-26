function insert(a, p, b)
  res = {}
  for i=1,p-1 do
    res[i] = a[i]
  end
  for i=1,#b do
    res[i+p-1] = b[i]
  end
  for i=p,#a do
    res[i+#b] = a[i]
  end
  return res
end

a = {1,100}
b = {2,3,4,5,6}

a = insert(a,2,b)
for i=1,#a do print(a[i]) end

--c = (insert(a,2,b))
--print(a)
--print(b)