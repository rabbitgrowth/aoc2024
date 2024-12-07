equations = []

with open('07.txt') as f:
    for line in f:
        left, right = line.split(':')
        expected = int(left)
        xs = list(map(int, right.split()))
        equations.append((xs, expected))

def add(x, y):
    return x + y

def mul(x, y):
    return x * y

def cat(x, y):
    return int(str(x) + str(y))

def fold(xs, fs):
    assert len(xs)
    if len(xs) == 1:
        yield xs[0]
        return
    x, y, *rest = xs
    for f in fs:
        yield from fold([f(x, y), *rest], fs)

for fs in [[add, mul], [add, mul, cat]]:
    total = 0
    for xs, expected in equations:
        for result in fold(xs, fs):
            if result == expected:
                total += expected
                break
    print(total)
