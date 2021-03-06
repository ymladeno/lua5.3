function trim(s)
  s = string.gsub(s, "^%s*(.-)%s*$", "%1")
  return s
end

spaces_100K = string.rep(" ", 100*2^10)
--print(trim("a"..spaces_100K   this is not trimed "))
--print(trim("   this is not trimed "))
assert(trim "" == "")
assert(trim "   a " == "a")
assert(trim "a   " == "a")
assert(trim " a bc  " == "a bc")
assert(trim(" a ") == "a")