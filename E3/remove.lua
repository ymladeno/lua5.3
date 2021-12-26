function remove(s,p,l)
  s1 = string.sub(s,p,p+l-1)
  s2 = string.gsub(s, s1, "")
  return s2
end

s = remove("hello world", 7, 4)
print(s)