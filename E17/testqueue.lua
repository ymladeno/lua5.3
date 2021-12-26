local queue = require "queue"

local q = queue.new()
queue.pushFirst(q, 10)
queue.pushFirst(q, 3)

print("first:", queue.popFirst(q))

queue.pushLast(q, 100)
queue.pushLast(q, 50)

print("first:",queue.popFirst(q))
print("last:", queue.popLast(q))
print("last:", queue.popLast(q))