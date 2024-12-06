with open('06.txt') as f:
    lines = list(map(str.strip, f))

width  = len(lines[0])
height = len(lines)

def inside(x, y):
    return 0 <= x < width and 0 <= y < height

spaces = []
obstacles = set()

for y, line in enumerate(lines):
    for x, char in enumerate(line):
        if char == '.':
            spaces.append((x, y))
        elif char == '#':
            obstacles.add((x, y))
        elif char == '^':
            start_x, start_y = x, y

def rotate(x, y):
    z = complex(x, y) * 1j
    return int(z.real), int(z.imag)

def patrol(obstacles):
    x, y = start_x, start_y
    dx, dy = 0, -1
    while True:
        yield x, y, dx, dy
        while (x + dx, y + dy) in obstacles:
            dx, dy = rotate(dx, dy)
        x += dx
        y += dy
        if not inside(x, y):
            return

print(len(set((x, y) for x, y, dx, dy in patrol(obstacles))))

def causes_loop(extra_obstacle):
    seen = set()
    for situation in patrol(obstacles | {extra_obstacle}):
        if situation in seen:
            return True
        seen.add(situation)
    return False

print(sum(map(causes_loop, spaces)))
