with open('11.txt') as f:
    xs = list(map(int, f.read().split()))

for _ in range(25):
    new_xs = []
    for x in xs:
        if x == 0:
            new_xs.append(1)
        else:
            digits = str(x)
            length = len(digits)
            if length % 2 == 0:
                half = length // 2
                new_xs.extend([
                    int(digits[:half]),
                    int(digits[half:]),
                ])
            else:
                new_xs.append(x * 2024)
    xs = new_xs

print(len(xs))
