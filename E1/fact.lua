function fact(n)
  if (n < 0) then
    return 0
  else if (n ==0) then
    return 1
  else
    return n * fact(n-1)
  end
  end
end