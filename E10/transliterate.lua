function translate(s,tab)
  local s = string.gsub(s, ".", function(c) return tab[c] or "" end)
  return s
end

tab = {["a"] = "A", ["b"] = "B", ["c"] = "C"}
print(translate("aadbc", tab))