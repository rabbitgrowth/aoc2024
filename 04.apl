puzzle←↑⊃⎕NGET'04.txt'1
X←{⍺⍺⍉↑(' '⍴¨⍨⍵⍵¯1+⍳≢⍵),¨↓⍵} ⍝ diagonal
Directions←{⍵(⌽⍵)(⍉⍵)(⌽⍉⍵)(⊢X⊢⍵)(⊢X⌽⍵)(⌽X⊢⍵)(⌽X⌽⍵)}
⎕←+/∊'XMAS'∘⍷¨Directions puzzle
⎕←+/∊{∧/∨⌿'MAS'∘.≡∘(1 1∘⍉¨)⍥(⊢,⍥⊂⌽)⍵}⌺3 3⊢puzzle
