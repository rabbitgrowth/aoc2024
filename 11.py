from collections import Counter

with open('11.txt') as f:
    xs = Counter(map(int, f.read().split()))

for times in [25, 50]:
    for _ in range(times):
        ys = Counter()
        for x, n in xs.items():
            if x == 0:
                ys[1] += n
            else:
                digits = str(x)
                length = len(digits)
                if length % 2 == 0:
                    half = length // 2
                    ys[int(digits[:half])] += n
                    ys[int(digits[half:])] += n
                else:
                    ys[x * 2024] += n
        xs = ys
    print(sum(xs.values()))
