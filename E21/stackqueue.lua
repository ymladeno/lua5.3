local Stack = require 'stack'

local StackQueue = Stack:new{}

function StackQueue:insertbottom(v)
  table.insert(self.list, 1, v)
end

local sq = StackQueue:new{}
sq:push(100); sq:push(101); sq:push(103)
sq:insertbottom(104);
print(sq:pop(), sq:pop(), sq:pop(), sq:pop())
