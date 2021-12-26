function remove(s,p,l)
  offset_start = utf8.offset(s,p)
  offset_end = utf8.offset(s,p+l)
  s1 = string.sub(s,offset_start,offset_end-1)
  s2 = string.gsub(s, s1, "")
  return s2
end

-- 1   1 a
-- 11  2 c
-- 11  4 a
-- 11  6 o

s = remove("ação", 2, 2)
print(s)