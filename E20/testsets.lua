local Set = require 'sets'

local s1 = Set.new{10, 20, 30, 50}
local s2 = Set.new{30, 1}

local s3 = s1 + s2
print("union: ", s3)
print("intersection: ", (s1+s2)*s1)

s3 = s1 - s2
print("sub: ", s3)

print("len s1: ", Set.len(s1))
print("len s2: ", #s2)
print("len s3: ", #s3)