function concat(a)
  res = ""
  for i=1,#a do
    res = res..a[i]
  end
  return res 
end

--function concat(a, sep, b)
--  res = {}
--  for i=1,#a do
--    res[i] = a[i]
--  end
--  res[#a+1] = sep
--  for i=1,#b do
--    res[i+#a+#sep] = b[i] 
--  end
--  return res 
--end

--a = {"hello"}
--b = {"world"}

print(concat({"hi","!","there"}))

--for i=1,#c do print(c[i]) end