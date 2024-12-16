from collections import defaultdict

class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    @property
    def gps(self):
        return self.x + 100 * self.y

    def __add__(self, other):
        return Point(self.x + other.x, self.y + other.y)

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __hash__(self):
        return hash((self.x, self.y))

    def __repr__(self):
        return f'Point({self.x}, {self.y})'

with open('15.txt') as f:
    top, bot = f.read().split('\n\n')

points = defaultdict(set)

for y, line in enumerate(top.splitlines()):
    for x, char in enumerate(line):
        points[char].add(Point(x, y))

wall, boxes, robots = map(points.get, '#O@')

[robot] = robots

directions = {
    '<': Point(-1,  0),
    '>': Point( 1,  0),
    '^': Point( 0, -1),
    'v': Point( 0,  1),
}

moves = [directions[char] for char in bot if char != '\n']

for move in moves:
    pushed = robot
    burden = set()
    while True:
        pushed += move
        if pushed in boxes:
            burden.add(pushed)
        elif pushed in wall:
            break
        else:
            robot += move
            boxes -= burden
            boxes |= {box + move for box in burden}
            break

print(sum(box.gps for box in boxes))
