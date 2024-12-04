puzzle←↑⊃⎕NGET'04.txt'1
Diagonal←{(⍺⍺⍤⍉⍤↑↓,¨⍨0⍴¨⍨∘⍵⍵¯1+⍳⍤≢)⍵}
E←⊢
W←⌽
S←⍉
N←⌽⍉
SW←⊢Diagonal⊢
SE←⊢Diagonal⌽
NE←⌽Diagonal⊢
NW←⌽Diagonal⌽
Directions←(E⍪W),⍥⊂S⍪N⍪SW⍪SE⍪NE⍪NW
⎕←+/∊'XMAS'∘⍷¨Directions puzzle
⎕←+/∊{∧/∨⌿'MAS'∘.≡∘(1 1∘⍉¨)⍥(⊢,⍥⊂⌽)⍵}⌺3 3⊢puzzle
