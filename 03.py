import re

with open('03.txt') as f:
    program = f.read()

enabled = True
total = 0

for match in re.finditer(r"(mul|do(?:n't)?)\((?:(\d{1,3}),(\d{1,3}))?\)", program):
    func, x, y = match.groups()
    if func == 'do':
        enabled = True
    elif func == "don't":
        enabled = False
    elif func == 'mul' and enabled:
        total += int(x) * int(y)

print(total)
