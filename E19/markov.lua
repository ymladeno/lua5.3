--local prefix_size = 1
local prefix_size = tonumber(io.read())

function prefix(words)
  return table.concat(words, " ")
end

local statetab = {}

function insert(prefix, value)
  local list = statetab[prefix]
  if not list then
    statetab[prefix] = {value}
  else
    list[#list + 1] = value
  end
end

function allwords()
  local line = io.read()
  local pos = 1
  return function()
    while line do
      local w, e = string.match(line, "(%w+[,;.:]?)()", pos)
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

local MAXGEN = 50
local NOWORD = "\n"

-- build table
local prefix_words = {}
local function init_prefix_words()
  for i = 1, prefix_size do
    prefix_words[i] = NOWORD
  end
end

local function next_prefix_words(finalword)
  for i = 1, prefix_size - 1 do
    prefix_words[i] = prefix_words[i + 1]
  end
  prefix_words[#prefix_words] = finalword
end

init_prefix_words()
for nextword in allwords() do
  insert(prefix(prefix_words), nextword)
  next_prefix_words(nextword)
end
insert(prefix(prefix_words), NOWORD)

-- generate text
init_prefix_words()
for i = 1, MAXGEN do
  local list = statetab[prefix(prefix_words)]
  local r = math.random(#list)
  local nextword = list[r]
  if nextword == NOWORD then return end
  io.write(nextword, " ")
  next_prefix_words(nextword)
end
io.write("\n")

