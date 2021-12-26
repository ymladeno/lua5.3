function allwords()
  local line = io.read()
  local pos = 1
  return function()
    while line do
      local w,e = string.match(line, "(%w+)()", pos)
      if w then
        pos = e
        return w
      else
        line = io.read()
        pos = 1
      end
    end
    return nil
  end
end

function uniquewords()
  local f = io.open("temp")
  local pos = 1
  local visited = {}
  local line = f:lines()()
  return function()
    while line do
      local w,e = string.match(line, "(%w+)()", pos)
      if w then
        pos = e
        if not visited[w] then
          visited[w] = true
          return w
        end
      else
        pos = 1
        line = f:lines()()
      end
    end
    return nil
  end
end

for word in uniquewords() do io.write(word, " ") end
io.write("\n")