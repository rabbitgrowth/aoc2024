import re
from math import prod

with open('03.txt') as f:
    program = f.read()

print(sum(
    prod(map(int, match.groups()))
    for match in re.finditer(r'mul\((\d{1,3}),(\d{1,3})\)', program)
))
