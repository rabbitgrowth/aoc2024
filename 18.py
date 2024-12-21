from math import inf

with open('18.txt') as f:
    blocks = [tuple(map(int, line.split(','))) for line in f]

start = 0, 0
end = 70, 70
moves = [(0, -1), (0, 1), (-1, 0), (1, 0)]

def search(blocks):
    unvisited = {
        (x, y): 0 if (x, y) == start else inf
        for x in range(end[0] + 1)
        for y in range(end[1] + 1)
        if (x, y) not in set(blocks)
    }
    while unvisited:
        x, y = min(unvisited, key=unvisited.get)
        if (x, y) == end:
            return dist
        dist = unvisited.pop((x, y))
        for dx, dy in moves:
            new_dist = dist + 1
            new_x = x + dx
            new_y = y + dy
            if (new_x, new_y) in unvisited:
                if new_dist < unvisited[new_x, new_y]:
                    unvisited[new_x, new_y] = new_dist
    return inf

print(search(blocks[:1024]))

idxs = list(range(len(blocks)))

while True:
    mid = len(idxs) // 2
    idx = idxs[mid]
    prev = search(blocks[:idx])
    curr = search(blocks[:idx+1])
    if prev < inf and curr < inf:
        idxs = idxs[mid+1:]
    elif prev == inf and curr == inf:
        idxs = idxs[:mid]
    elif prev < inf and curr == inf:
        print(','.join(map(str, blocks[idx])))
        break
    else:
        assert False
