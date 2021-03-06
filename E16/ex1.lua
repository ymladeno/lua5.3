function loadwithprefix(prefix, chunk)
  local type_prefix = type(prefix)
  local type_chunk = type(chunk)
  assert(type_prefix == "string", "invalid prefix type " .. type_prefix)
  assert(type_chunk == "string" or type_chunk == "function", "invalid chunk type " .. type_chunk)

    local prefixReturned = false
    local chunkReturned = false
    local code = function() 
      if not prefixReturned then 
        prefixReturned = true
        return prefix
      end
      if not chunkReturned then
        chunkReturned = true
        return chunk
      end
      return nil
    end
  return load(code)
end

-- Usage:
-- x = 10
-- local f = loadwithprefix("return ", "i + 1")
-- f()

-- local f = loadwithprefix("local i = ...", "return i + 1")
-- f(10)

-- local f = loadwithprefix("return 10 + ", io.read())
-- f()

-- loadwithprefix("return 10 + ", io.read())()