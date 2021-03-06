#!/usr/bin/lua

-- exercise 1

function prtable(a)
  for i=1,#a do print(a[i]) end
end
--
--
--a = {1,2,3}
--prtable(a)

-- exercise 2

--function prtable1(...)
--  return print(select(2,...))
--end
--
--prtable1(1,2,3,4)

-- exercise 3
function prtable2(...)
  local arg = table.pack(...)
  table.remove(arg)
  return prtable(arg)
end

prtable2(1,2,3,4)