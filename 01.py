from collections import Counter

with open('01.txt') as f:
    nums = [map(int, line.split()) for line in f]

left, right = list(zip(*nums))
print(sum(abs(l - r) for l, r in zip(sorted(left), sorted(right))))

count = Counter(right)
print(sum(l * count[l] for l in left))
