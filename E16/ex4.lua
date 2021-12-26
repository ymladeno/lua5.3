-- pcall(pcall, f)
-- the question is:
-- is the possible to propagate error outside pcall
-- https://stackoverflow.com/questions/39113323/how-do-i-find-an-f-that-makes-pcallpcall-f-return-false-in-lua

local status, error = pcall(function() error("my error") end)
print(status, error)