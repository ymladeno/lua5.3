local function allPowerSet(f,set)
    local t = {{}}
    f(t[1])
    for i = 1, #set do
        for j = 1, #t do
            local tmp = {table.unpack(t[j])}
            tmp[#tmp + 1] = set[i]
            t[#t+1] = tmp
            f(tmp)
        end
    end
end

local function printSubSet(subset)
    io.write("{")
    for i = 1,#subset do
        io.write(i == 1 and "" or ",",subset[i])
    end
    io.write("}\n")
end

allPowerSet(printSubSet,{1,2,3,4})