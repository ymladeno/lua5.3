function translateUTF8(s, match)
  return (string.gsub(s, utf8.charpattern, function(c) return match[c] or "" end))
end

local match = {["ã"] = "a", ["ç"] = "ã"}
print(translateUTF8("ação", match))