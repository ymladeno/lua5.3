function copytable(t)
  local t1 = {}
  for k,v in pairs(t) do t1[k] = v end
  return t1
end

function isSimpleTable(t, saved)
  local visit = copytable(saved)

  if visit[t] then
    return false
  end

  visit[t] = true
  if type(t) == "table" then
    for k,v in pairs(t) do   
      local r = isSimpleTable(v, visit)
      if not r then return r end
    end
  end
  return true
end

function basicSerialize(o)
  return string.format("%q", o)
end

function serialize(name, o, saved, indent)
  indent = indent or 0
  saved = saved or {}

  local t = type(o)
  if t == "number" or t == "string" or t == "boolean" or t == "nil" then
    io.write(string.format("%q", o))
  elseif t == "table" then
    indent = indent+2
    if saved[value] then
      io.write(saved[value], "\n")
    else
      saved[o] = name
      io.write("{ ")
      for k,v in pairs(o) do
        if type(v) == "table" then
          io.write(string.rep(" ", indent))
        end
        if k~=1 then io.write(", ") end
        local fname = string.format("%s[%s]", name, k)
        serialize(fname, v, saved, indent)
      end
      io.write("}")
    end
  else
    error("cannot serialize a "..type(o))
  end 
end

function save(name, value, saved, indent)
  saved = saved or {}
  indent = indent or 0
  io.write(name, " = ")

  local t = type(value)
  if t == "number" or t == "string" then
    io.write(basicSerialize(value), "\n")
  elseif t == "table" then
    if saved[value] then
      io.write(saved[value], "\n")
    else
      if isSimpleTable(value, saved) then
        saved[value] = name
        serialize(name, value, saved)
        io.write("\n")
      else
        saved[value] = name
        io.write("{}\n")
        for k,v in pairs(value) do
          k = basicSerialize(k)
          local fname = string.format("%s[%s]", name, k)
          save(fname, v, saved, indent)
        end
      end
    end
  else
    error("cannot save a "..type(value))
  end
end

a = {x=1, y=2; {3,4,5}}
a[2] = a
a.z = a[1]
save("a", a)

a = {{"one", "two"}, 3}
b = {k = a[1]}

local t = {}
save("a", a, t)
save("b", b, t)

t = {14,15,19}
save("t", t)