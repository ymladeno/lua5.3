function words(n, ctl)
  local counter = {}
  local cnt = 0
  for line in io.lines() do
    for word in string.gmatch(line, "%w+") do
      if ctl(word) then
        counter[word]=(counter[word] or 0)+1
      end
    end
  end
  
  local words = {}
  for w in pairs(counter) do
    words[#words+1] = w
  end
  
  table.sort(words, function(w1,w2) 
                      return counter[w1] > counter[w2] or
                             counter[w1] == counter[w2] and w1 < w2
                    end)
  
  for i = 1,n do
    if not counter[words[i]] then
      return
    end
    io.write(words[i], "\t", counter[words[i]],"\n")
  end
end

local n = math.min(tonumber(arg[1]) or math.huge)
longer = function(word) return #word > 3 end
ignore = function(word)
           ignoreFile = io.input("ignore")
            for line in io.lines() do
              for w in string.gmatch(line,"%w+") do
                if w == word then
                  return false
                end
              end
            end 
            return true
          end

words(n, ignore)