import re

with open('17.txt') as f:
    A, B, C, *prog = map(int, re.findall(r'\d+', f.read()))

def combo(operand):
    if 0 <= operand <= 3:
        return operand
    elif operand == 4:
        return A
    elif operand == 5:
        return B
    elif operand == 6:
        return C
    assert False

ptr = 0
out = []

while True:
    if ptr >= len(prog):
        break
    assert ptr < len(prog) - 1
    opcode  = prog[ptr]
    operand = prog[ptr + 1]
    if opcode == 0:
        A //= 2 ** combo(operand)
    elif opcode == 1:
        B ^= operand
    elif opcode == 2:
        B = combo(operand) % 8
    elif opcode == 3:
        if A:
            ptr = operand
            continue
    elif opcode == 4:
        B ^= C
    elif opcode == 5:
        out.append(combo(operand) % 8)
    elif opcode == 6:
        B = A // 2 ** combo(operand)
    elif opcode == 7:
        C = A // 2 ** combo(operand)
    ptr += 2

print(','.join(map(str, out)))
