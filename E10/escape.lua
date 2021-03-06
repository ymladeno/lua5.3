function escape(s)
  local pattern_long_line = string.rep("\\x[^\n][^\n]", 5)
  local s1 = string.gsub(s, "[%W%w]", function(c) 
    local s2 = string.format("\\x%02X", string.byte(c))
    return s2 
    end
  )
  s2 = string.gsub(s1, pattern_long_line, 
    function(substr)
      local z = substr.."\\z"
      return z end)
  return s2
end

long_a = string.rep("a",4)
long_b = string.rep("b",4)
--print(escape("\0\1hello\200"))
print(escape(long_b..long_a))