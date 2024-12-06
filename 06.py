with open('06.txt') as f:
    lines = list(map(str.strip, f))

width  = len(lines[0])
height = len(lines)

def inside(x, y):
    return 0 <= x < width and 0 <= y < height

empty     = []
obstacles = []

for y, line in enumerate(lines):
    for x, char in enumerate(line):
        if char == '.':
            empty.append((x, y))
        elif char == '#':
            obstacles.append((x, y))
        elif char == '^':
            guard = x, y

x, y = guard
dx, dy = 0, -1

def rotate(x, y):
    z = complex(x, y) * 1j
    return int(z.real), int(z.imag)

route = [(x, y)]

while True:
    new_x = x + dx
    new_y = y + dy
    if not inside(new_x, new_y):
        break
    if (new_x, new_y) in obstacles:
        dx, dy = rotate(dx, dy)
        x += dx
        y += dy
    else:
        x, y = new_x, new_y
    route.append((x, y))

print(len(set(route)))
