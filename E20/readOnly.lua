function readOnly(t)
  local proxy = {}
  local mt = {
    __index = t,
    __newindex = function (t, k, v)
      error("attemp to update a read-only table", 2)
    end
  }
  setmetatable(proxy, mt)
  return proxy
end

function readOnly1(t)
  local proxy = {}
  internalT = t
  local mt = {
    __index = function(_, k) return internalT[k] end,
    __newindex = function(t, k, v) error("attemp to update a read-only table", 2) end
  }
  setmetatable(proxy, mt)
  return proxy
end

days = readOnly1{"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
print(days[1])

days[2] = "Noday"

-- see alternative better approach here
-- https://github.com/ymladeno/pil4/blob/master/chapter20/chapter20.lua