local Account = require 'accountProxy'

local b = Account:proxy()
print("initial balance: ", b:getbalance())
b:deposit(103.5)
print("new balance: ", b:getbalance())