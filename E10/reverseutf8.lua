function reverse(s)
  r = string.gsub(s, utf8.charpattern, function(c) return #c > 1 and c:reverse() end)
  r = r:reverse()
  return r
end

print(reverse("ação"))