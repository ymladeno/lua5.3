function prtable(a)
  for i=1,#a do print(a[i]) end
end

function shuffle(a)
  for i=#a,2,-1 do
    local j = math.random(i)
    a[i], a[j] = a[j], a[i]
  end
end

a = {1,2,3,4,5,6}

shuffle(a)
prtable(a)