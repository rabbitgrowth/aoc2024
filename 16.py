from collections import defaultdict
from heapq import heappush, heappop
from math import inf

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

queue = [(0, *start, 1, 0, [start])]
done = set()
scores = defaultdict(lambda: inf)

while True:
    score, x, y, dx, dy, path = heappop(queue)
    if (x, y) == end:
        print(score)
        paths = set(path)
        while True:
            _, x, y, _, _, path = heappop(queue)
            if (x, y) != end:
                break
            paths.update(path)
        print(len(paths))
        break
    for penalty, ndx, ndy in [(1, dx, dy), (1001, -dy, dx), (1001, dy, -dx)]:
        nx = x + ndx
        ny = y + ndy
        if (nx, ny) not in wall and (nx, ny, ndx, ndy) not in done:
            total = score + penalty
            if total > scores[nx, ny, ndx, ndy]:
                continue
            scores[nx, ny, ndx, ndy] = total
            heappush(queue, (total, nx, ny, ndx, ndy, path + [(nx, ny)]))
    done.add((x, y, dx, dy))
