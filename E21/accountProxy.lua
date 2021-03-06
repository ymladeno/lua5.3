local Account = {}
local proxies = {}
local mt = {
  __index = function(t, k)
    return proxies[t][k]
    end
}

function Account:withdraw(v)
  local o = proxies[self]
  o.balance = o.balance - v
end

function Account:deposit(v)
  local o = proxies[self]
  o.balance = o.balance + v
end

function Account:getbalance()
  local o = proxies[self]
  return o.balance
end

function Account:new(o)
  o = o or { balance = 0 }
  self.__index = self
  setmetatable(o, self)
  return o
end

function Account:proxy()
  local o = Account:new()
  local proxy = {}
  setmetatable(proxy, mt)
  proxies[proxy] = o
  return proxy
end

return Account