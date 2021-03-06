function mysearcher(name, path)
  print("my search")
  local file = package.searchpath(name, path)
  if file then
    local f = loadfile(file)
    if not f then
      f = assert(package.loadlib(file), file .. "not found")
    end
    return f
  end
  err = "\n\tno file " .. name
  return nil, err
end

--package.searchers[#package.searchers+1] = mysearcher
package.preload["queue"] = mysearch

local p = "./?.lua;./?.so;/usr/lib/lua5.3/?.so;/usr/share/lua5.3/?.lua"
local queue = mysearcher("queue", p)()
--local queue = require("queue", p)
local q = queue.new()
queue.pushFirst(q, 3); queue.pushLast(q, 100)
print("fist: ", queue.popFirst(q))
print("last: ", queue.popLast(q))