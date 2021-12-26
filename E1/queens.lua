-- n-th queen
-- column c
N = 8
function printsolution(a)
  for i=1, N do
    for j=1, N do
      io.write(a[i] == j and "X" or "-", " ")
    end
    io.write("\n")
  end
  io.write("\n")
end

function isplaceok(a,n,c)
  for i=1, n-1 do
    if (a[i] == c) or       -- the same column
       (a[i]-i == n-c) or   -- the same diagonal
       (a[i]+i == c+n) then -- the same diagonal
      return false          -- place can be attacked
    end
  end
  return true
end

function addqueen(a,n)
  for n=1, N do
    for c=1, N do
      if isplaceok(a,n,c) then
        a[n] = c
        break
      end
    end
  end
    printsolution(a)
end

--function addqueen(a,n)
--  if (n>N) then
--    printsolution(a)
--  else
--    for c=1, N do
--      if isplaceok(a,n,c) then
--        a[n] = c
--        addqueen(a,n+1)
--      end
--    end
--  end
--end

-- run program
addqueen({},1)