-- table.unpack works for me only on lua5.3
-- otherwise I found that just unpack works
local unpack = table.unpack or unpack

function subSets(s,f)
  local subs = {{}}
  for i = 1, #s do
    for j = 1, #subs do
      local tmp = {unpack(subs[j])}
      tmp[#tmp + 1] = s[i]
      subs[#subs + 1] = tmp
      f(tmp)
    end
  end
end

function printSet(s)
  io.write("{")
  for i = 1,#s do io.write(i == 1 and "" or ",", s[i]) end
  io.write("}\n")
end

subSets({1,2,3,4}, printSet)