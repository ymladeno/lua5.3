function fileExist(file)
  if file == nil then return false end
  local f = io.open(file, "r")
  if f ~= nil then f:close() return true end
  return false
end

function copy(input, output)
  local lines = {}
  for line in io.lines(input) do
    lines[#lines+1] = line
--    if #lines == 3 then break end
  end
  io.close()
  table.sort(lines)

  if fileExist(output) then
    io.write("yes?no: ")
    local anw = io.read()
    if anw ~= "yes" then
      print("Exiting ... ") 
      return
    end
  end

  local out = output and io.open(output, "w") or io.stdout
  for _,l in ipairs(lines) do
      out:write(l, '\n')
  end
  out:close()
end

copy("readme", "copy")
--copy()
--copy("readme")