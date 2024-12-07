from operator import add, mul

equations = []

with open('07.txt') as f:
    for line in f:
        left, right = line.split(':')
        expected = int(left)
        xs = list(map(int, right.split()))
        equations.append((xs, expected))

def cat(x, y):
    return int(str(x) + str(y))

def fold(xs, fs):
    match xs:
        case [x, y, *xs]:
            for f in fs:
                yield from fold([f(x, y), *xs], fs)
        case [x]:
            yield x
            return

for fs in [[add, mul], [add, mul, cat]]:
    total = 0
    for xs, expected in equations:
        for result in fold(xs, fs):
            if result == expected:
                total += expected
                break
    print(total)
