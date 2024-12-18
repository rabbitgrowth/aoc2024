from heapq import heappush, heappop

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

queue = [(0, *start, 1, 0)]
done = set()

while True:
    score, x, y, dx, dy = heappop(queue)
    if (x, y) == end:
        print(score)
        break
    done.add((x, y, dx, dy))
    for penalty, x, y, dx, dy in [
        (1,    x + dx, y + dy,  dx,  dy),
        (1001, x - dy, y + dx, -dy,  dx),
        (1001, x + dy, y - dx,  dy, -dx),
    ]:
        if (x, y) not in wall and (x, y, dx, dy) not in done:
            heappush(queue, (score + penalty, x, y, dx, dy))
