-- the same implementation of stack, but using a dual representation

local list = {}
local Stack = {}

function Stack:push(v)
  table.insert(list[self], v)
end

function Stack:pop()
  if self:isempty() then error("stack is empty", 2) end
  return table.remove(list[self])
end

function Stack:top()
  return self.list[#list[self]]
end

function Stack:isempty()
  return #list[self] == 0
end

function Stack:new(o)
  o = o or {}
  self.__index = self
  o.list = o
  list[o] = o
  setmetatable(o, self)
  return o
end

return Stack