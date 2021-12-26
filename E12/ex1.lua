t = os.date("*t")
print(os.date("%Y/%m/%d", os.time(t)))
t.month = t.month + 1
print(os.date("%Y/%m/%d", os.time(t)))
