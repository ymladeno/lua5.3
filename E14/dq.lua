-- Double ended queue

function listNew()
  return {first = 0, last = 0}
end

function pushFirst(list, value)
  local first = list.first - 1
  list.first = first
  list[first] = value
end

function pushLast(list, value)
  local last = list.last + 1
  list.last = last
  list[last] = value
--  print("li:", list.last)
end

function popFirst(list)
  local first = list.first
  if not (first<0) then error("list is empty") end
  local value = list[first]
  list[first] = nil
  list.first = first + 1
--  print("fi:", list.first)
  return value
end

function popLast(list)
  local last = list.last
  if not (last>0) then error("list is empty") end
  local value = list[last]
  list[last] = nil
  list.last = last - 1
--  print("li:", list.last)
  return value
end

local l = listNew()
pushFirst(l, 10)
pushFirst(l, 3)

print("first:", popFirst(l))

pushLast(l, 100)
pushLast(l, 50)

print("first:",popFirst(l))
print("last:", popLast(l))
print("last:", popLast(l))

--print("first:",popFirst(l))
--print("last:", popLast(l))
