function createFolder(folder)
  os.execute("mkdir "..folder)
end

function removeFolder(folder)
  os.execute("rm -rf "..folder)
end

function collectEntries(folder)
  local f = io.popen("ls "..folder, "r")
  local entries = {}
  for entry in f:lines() do
    entries[#entries+1] = entry
  end

  for _,l in ipairs(entries) do
    print(l)
  end
end

--createFolder("test")
--removeFolder("test")
collectEntries("../E7")