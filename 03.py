import re

with open('03.txt') as f:
    program = f.read()

on = True
total = 0

for match in re.finditer(r"(mul|do(?:n't)?)\((?:(\d{1,3}),(\d{1,3}))?\)", program):
    func, x, y = match.groups()
    if func == 'do':
        on = True
    elif func == "don't":
        on = False
    elif func == 'mul' and on:
        total += int(x) * int(y)

print(total)
