function split(s,sep)
  local list = {}
  local sep = sep or " "
  local pattern = string.format("[^%s]+", sep)
  string.gsub(s, pattern, function(chunk) list[#list+1] = chunk end)
  return list
end

--t = split("this is a test", "")
t = split("", "!")  -- empty sequence (table)

for _,i in ipairs(t) do print(i) end


-- '[^%d%d]' is different than '[%D%U]'