function createMat(R,C)
  local mt = {}
  for i = 1, R do
    local row = {}
    mt[i] = row
    for j = 1, C do
      row[j] = 0
    end
  end
  return mt
end

function add(a,b)
  assert(#a == #b)
  local rows = #a

  local c = {}
  for i = 1, rows do
    local line = {}
    local vb = b[i]
    for k, va in pairs(a[i]) do
      line[k] = va + vb[k]
    end
    c[i] = line
  end
  return c
end

function printMat(t)
  for i = 1, #t do
    for _,vt in pairs(t[i]) do
      print(vt)
    end
  end
end
--local m = createMat(2,3)
--print(#m)

local t1 = {{3,nil,10},{4,nil,0}}
local t2 = {{4,nil,2},{1,nil,4}}
local t = add(t1,t2)
printMat(t)