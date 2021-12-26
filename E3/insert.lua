function insert(s, p, w)
  s1 = string.sub(s,1,p-1)
  s2 = string.sub(s,p,string.len(s))
  return s1..w..s2
end

s = insert("hello world", 1, "start: ")
print(s)

s = insert("hello world", 7, "small ")
print(s)