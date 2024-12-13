map←↑⊃⎕NGET'12.txt'1
regions←⊃,/{⍸⍣¯1⍤(/∘⍵)¨↓∪(∨.∧⍨∨⊢)⍣≡1≥+/¨|∘.-⍨⍵}¨map⊂⍤⊢⌸⍥,⍳⍴map
areas   ←(+/,                            )¨regions
overlaps←((2∧/⊢)       +⍥(+/,)2∧⌿⊢       )¨regions
joins   ←((2∧/2≠⌿0⍪⍪∘0)+⍥(+/,)2∧⌿2≠/0,,∘0)¨regions
crosses ←{+/,(≠/∧.∧≠⌿)⍤⊢⌺2 2⊢0,⍨⍵⍪0      }¨regions
perimeters←(4×areas)-2×overlaps
⎕←areas+.×perimeters
⎕←areas+.×perimeters-joins-2×crosses
