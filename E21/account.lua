local Account = { balance1 = 0}

function Account:withdraw(v)
  self.balance = self.balance - v
end

function Account:deposit(v)
  self.balance = self.balance + v
end

function Account:getbalance()
  return self.balance
end

function Account:new(o)
  o = o or { balance = 0 }
  self.__index = self
  setmetatable(o, self)
  o.balance = 0
  return o
end

return Account