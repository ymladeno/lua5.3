local Stack = {}

function Stack:new(o)
  o = o or {}
  self.__index = self
  o.list = o
  setmetatable(o, self)
  return o
end

function Stack:push(v)
  self.list[#self.list + 1] = v
end

function Stack:pop()
  if self:isempty() then error("stack is empty", 2) end
  return table.remove(self.list)
end

function Stack:top()
  return self.list[#self.list]
end

function Stack:isempty()
  return #self.list == 0
end

return Stack