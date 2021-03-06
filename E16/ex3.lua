function stringrep(s,n)
  local r = ""
  if n > 0 then
    while n > 1 do
      if n % 2 ~= 0 then r = r .. s end
      s = s .. s
      n = math.floor(n / 2)
    end
    r = r .. s
  end
  return r
end

function stringrep_5(s)
  local r = ""
  r = r .. s
  s = s .. s
  s = s .. s
  r = r .. s
  return r
end

function stringrep_n(n)
  local code = {"local args = {...}", "local r = ''", "local s = args[1]"}
  if n > 0 then
    while n > 1 do
      if n % 2 ~= 0 then code[#code+1] = "r = r .. s " end
      code[#code+1] = "s = s .. s "
      n = math.floor(n / 2)
    end
    code[#code+1] = "r = r .. s "
  end
  code[#code+1] = "return r"

  return load(table.concat(code), "stringrep_n")
end

start = os.clock()
f = stringrep_n(10000)
f('a')
duration = os.clock() - start
print("second: ", duration)

start = os.clock()
stringrep("a",10000)
duration = os.clock() - start
print("first: ", duration)

-- f = load('ex3.lua')
-- f()
-- f1 = stringrep_n(2)
-- f1("a")
-- f1("b")