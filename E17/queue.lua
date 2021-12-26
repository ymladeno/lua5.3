-- Double ended queue
local function listNew()
  return {first = 0, last = 0}
end

local function pushFirst(list, value)
  local first = list.first - 1
  list.first = first
  list[first] = value
end

local function pushLast(list, value)
  local last = list.last + 1
  list.last = last
  list[last] = value
--  print("li:", list.last)
end

local function popFirst(list)
  local first = list.first
  if not (first<0) then error("list is empty") end
  local value = list[first]
  list[first] = nil
  list.first = first + 1
--  print("fi:", list.first)
  return value
end

local function popLast(list)
  local last = list.last
  if not (last>0) then error("list is empty") end
  local value = list[last]
  list[last] = nil
  list.last = last - 1
--  print("li:", list.last)
  return value
end

-- my module
queue = {}
queue.new = listNew
queue.pushFirst = pushFirst
queue.pushLast = pushLast
queue.popFirst = popFirst
queue.popLast = popLast

return queue