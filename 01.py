with open('01.txt') as f:
    nums = [map(int, line.split()) for line in f]

left, right = map(sorted, zip(*nums))
print(sum(abs(l - r) for l, r in zip(left, right)))
