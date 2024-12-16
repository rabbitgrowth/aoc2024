class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    @property
    def gps(self):
        return self.x + 100 * self.y

    def expand(self):
        return (
            Point(self.x * 2,     self.y),
            Point(self.x * 2 + 1, self.y),
        )

    def __add__(self, other):
        return Point(self.x + other.x, self.y + other.y)

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __hash__(self):
        return hash((self.x, self.y))

with open('15.txt') as f:
    top, bot = f.read().split('\n\n')

orig_walls = set()
orig_boxes = set()

for y, line in enumerate(top.splitlines()):
    for x, char in enumerate(line):
        point = Point(x, y)
        if char == '#':
            orig_walls.add(point)
        elif char == 'O':
            orig_boxes.add(point)
        elif char == '@':
            orig_robot = point

walls = orig_walls.copy()
boxes = orig_boxes.copy()
robot = orig_robot

directions = {
    '<': Point(-1,  0),
    '>': Point( 1,  0),
    '^': Point( 0, -1),
    'v': Point( 0,  1),
}

moves = [directions[char] for char in bot if char != '\n']

for move in moves:
    pushed = robot + move
    burden = set()
    while True:
        if pushed in walls:
            break
        elif pushed in boxes:
            burden.add(pushed)
            pushed += move
        else:
            robot += move
            boxes -= burden
            boxes |= {box + move for box in burden}
            break

print(sum(box.gps for box in boxes))

walls = {point for wall in orig_walls for point in wall.expand()}
boxes = {box.expand() for box in orig_boxes}
robot = orig_robot.expand()[0]

for move in moves:
    pushed = {robot + move}
    burden = set()
    while True:
        if pushed & walls:
            break
        else:
            pushed_boxes = {
                box
                for box in boxes
                if any(point in pushed for point in box)
            }
            if pushed_boxes:
                burden |= pushed_boxes
                pushed = {
                    new_point
                    for box in pushed_boxes
                    for point in box
                    if (new_point := point + move) not in box
                }
            else:
                robot += move
                boxes -= burden
                for box in burden:
                    left, right = box
                    boxes.add((left + move, right + move))
                break

print(sum(box[0].gps for box in boxes))
