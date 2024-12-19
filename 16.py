import sys
from collections import defaultdict

wall = set()

with open('16.txt') as f:
    for y, line in enumerate(f):
        for x, char in enumerate(line.strip()):
            if char == '#':
                wall.add((x, y))
            elif char == 'S':
                start = x, y
            elif char == 'E':
                end = x, y

scores = defaultdict(lambda: defaultdict(list))
scores[0][(*start, 1, 0)]

done = {}

while True:
    score = min(scores)
    srcs = scores.pop(score)
    for src, prevs in srcs.items():
        x, y, dx, dy = src
        if (x, y) == end:
            print(score)
            paths = {end}
            while prevs:
                prev = prevs.pop()
                x, y, dx, dy = prev
                paths.add((x, y))
                prevs.extend(done[prev])
            print(len(paths))
            sys.exit()
        for penalty, new_dx, new_dy in [(1, dx, dy), (1001, -dy, dx), (1001, dy, -dx)]:
            new_x = x + new_dx
            new_y = y + new_dy
            if (new_x, new_y) not in wall and (new_x, new_y) not in done:
                scores[score + penalty][new_x, new_y, new_dx, new_dy].append(src)
        if src not in done:
            done[src] = prevs
