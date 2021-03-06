function serialize(o, indent)
  indent = indent or 0
  local t = type(o)
  if t == "number" or t == "string" or t == "boolean" or t == "nil" then
    io.write(string.format("%q", o))
  elseif t == "table" then
    indent = indent+2
    io.write("{\n")
    for k,v in pairs(o) do
      io.write(string.rep(" ", indent))
      if string.match(k, "[_%a][_%w]*") then
        io.write(string.format(" [\"%s\"] = ", k))
      else
        io.write(string.rep(" ", indent), k, " = ")
      end
      serialize(v, indent)
      io.write(",\n")
    end
    io.write("}\n")
  else
    error("cannot serialize a "..type(o))
  end 
end


books = {"More Programming Pearls", "Literate Programming"}
t = { author = "John Bentley", book = "Lua programming"}
serialize(t)

function serialize1(o, indent)
  indent = indent or 0
  local t = type(o)
  if t == "number" or t == "string" or t == "boolean" or t == "nil" then
    io.write(string.format("%q", o))
  elseif t == "table" then
    indent = indent+2
    io.write("{\n")
    for k,v in pairs(o) do
      io.write(string.rep(" ", indent))
--      if string.match(k, "[_%a][_%w]*") then
--        io.write(string.format(" [\"%s\"] = ", k))
--      else
--        io.write(string.rep(" ", indent), k, " = ")
--      end
      serialize1(v, indent)
      io.write(",\n")
    end
    io.write("}\n")
  else
    error("cannot serialize a "..type(o))
  end 
end

t = {14,15,19}
serialize1(t)