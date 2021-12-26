local Stack = require 'stack_v2'

local s = Stack:new{}
s:push(1); s:push(2); s:push(3)
local s1 = Stack:new{10,20,30}
s1:push(40)

print(s:top(), s1:top())
print(s:pop(), s:pop(), s:pop())
print(s:isempty())
print(s1:pop(), s1:pop(), s1:pop(), s1:pop())
print(s1:isempty())