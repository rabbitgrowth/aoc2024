import sys
from heapq import heappush, heappop

wall = set()

with open('16.txt') as f:
    for y, line in enumerate(f):
        for x, char in enumerate(line.strip()):
            if char == '#':
                wall.add((x, y))
            elif char == 'S':
                start = (x, y)
            elif char == 'E':
                end = (x, y)

queue = [(0, *start, 1, 0, None, None, None, None)]
done = {}

while True:
    score, x, y, dx, dy, prev_x, prev_y, prev_dx, prev_dy = heappop(queue)
    prevs = [(prev_x, prev_y, prev_dx, prev_dy)]
    while queue and queue[0][:5] == (score, x, y, dx, dy):
        prevs.append(heappop(queue)[5:])
    if (x, y) == end:
        print(score)
        paths = set()
        while prevs:
            prev = prevs.pop()
            x, y, dx, dy = prev
            paths.add((x, y))
            if prev in done:
                prevs.extend(done[prev])
        print(len(paths))
        break
    for penalty, new_dx, new_dy in [(1, dx, dy), (1001, -dy, dx), (1001, dy, -dx)]:
        new_x = x + new_dx
        new_y = y + new_dy
        if (new_x, new_y) not in wall and (new_x, new_y) not in done:
            heappush(queue, (score + penalty, new_x, new_y, new_dx, new_dy, x, y, dx, dy))
    if (x, y, dx, dy) not in done:
        done[(x, y, dx, dy)] = prevs
