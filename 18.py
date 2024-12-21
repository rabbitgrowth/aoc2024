from math import inf

with open('18.txt') as f:
    blocks = [tuple(map(int, line.split(','))) for line in f]

blocked = set(blocks[:1024])
start = 0, 0
end = 70, 70
moves = [(0, -1), (0, 1), (-1, 0), (1, 0)]

unvisited = {
    (x, y): 0 if (x, y) == start else inf
    for x in range(end[0] + 1)
    for y in range(end[1] + 1)
    if (x, y) not in blocked
}

while unvisited:
    x, y = min(unvisited, key=unvisited.get)
    if (x, y) == end:
        print(dist)
        break
    dist = unvisited.pop((x, y))
    for dx, dy in moves:
        new_dist = dist + 1
        new_x = x + dx
        new_y = y + dy
        if (new_x, new_y) in unvisited:
            if new_dist < unvisited[new_x, new_y]:
                unvisited[new_x, new_y] = new_dist
