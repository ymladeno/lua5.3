local t = os.date("*t", os.time({year=2015, month=2, day=28}))
t.month = t.month + 1
t = os.date("*t", os.time(t))
t.day = t.day + 1

local t1 = os.date("*t", os.time({year=2015, month=2, day=28}))
t1.day = t1.day + 1
t1 = os.date("*t", os.time(t1))
t1.month = t1.month + 1

print(os.time(t), os.time(t1), os.difftime(os.time(t1),os.time(t)) == 0)
print(os.date("%Y-%m-%d", os.time(t)))
print(os.date("%Y-%m-%d", os.time(t1)))