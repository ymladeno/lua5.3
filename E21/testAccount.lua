local Account = require 'account'

local a = Account:new()
a:deposit(100.0)
print(a:balance())

--[=[
# run from console
dofile 'testAccount.lua'
# after change in module. Reload it again
package.loaded["account"] = nil
]=]--
