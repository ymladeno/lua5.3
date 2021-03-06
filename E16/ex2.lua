function multiload(...)
  local args = table.pack(...)

  local i = 1
  local code = function()
    while i <= args.n do
      if type(args[i]) == "function" then
        return args[i]()
      end
      local chunk = args[i]
      i = i + 1
      return chunk
    end
    return nil
  end
  
  return load(code, "load code", "t")
end

--f = multiload("local x = 10;", io.lines("temp", "*L"), "print(x)")