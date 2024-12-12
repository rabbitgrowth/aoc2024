map←↑⊃⎕NGET'12.txt'1
regions←(⍴map)⍴⍤1∪(∨.∧⍨∨⊢)⍣≡(∘.=⍨,map)∧1≥+/¨|∘.-⍨,⍳⍴map
areas←+/+/regions
perimeters←(4×areas)-2×(2∧/[2]regions)+⍥(+/+/)2∧/regions
⎕←areas+.×perimeters
