function insert(s, p, w)
  offset = utf8.offset(s,p)
  s1 = string.sub(s,1,offset-1)
  s2 = string.sub(s,offset,string.len(s))
  return s1..w..s2
end


print("ação")
s = insert("ação", 5, "!")
print(s)