function substrings(s)
  local i = 1
  local j = 0
  return function()
    while i < #s do
      while j < #s do
        j = j + 1
        return string.sub(s, i, j)
      end
      i = i + 1
      j = i - 1
    end
    return nil
  end
end

for subs in substrings("abcd") do print(subs) end