with open('06.txt') as f:
    lines = list(map(str.strip, f))

width  = len(lines[0])
height = len(lines)

def in_bounds(x, y):
    return 0 <= x < width and 0 <= y < height

obstacles = set()

for y, line in enumerate(lines):
    for x, char in enumerate(line):
        if char == '#':
            obstacles.add((x, y))
        elif char == '^':
            start_x, start_y = x, y

def rotate(x, y):
    return -y, x

def patrol(obstacles):
    x, y = start_x, start_y
    dx, dy = 0, -1
    while True:
        yield x, y, dx, dy
        while (x + dx, y + dy) in obstacles:
            dx, dy = rotate(dx, dy)
        x += dx
        y += dy
        if not in_bounds(x, y):
            break

visited = {(x, y) for x, y, dx, dy in patrol(obstacles)}

print(len(visited))

def causes_loop(extra_obstacle):
    seen = set()
    for state in patrol(obstacles | {extra_obstacle}):
        if state in seen:
            return True
        seen.add(state)
    return False

print(sum(map(causes_loop, visited)))
