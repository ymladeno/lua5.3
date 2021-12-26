local function fromto(n,m)
  print("V1")
  return function() 
          if n > m then return nil end
          local r = n
          n = n + 1
          return r
         end
end

local function fromto(n,m,step)
  print("V2")
  return function() 
          local r = n
          n = n + step
          if step < 0 then
            if r < m then return nil end
          else
            if r > m then return nil end
          end
          return r
         end
end

for i in fromto(10,1,-2) do print(i) end
