puzzle←↑⊃⎕NGET'04.txt'1
X←{⍺⍺⍉↑(' '⍴¨⍨⍵⍵¯1+⍳≢⍵),¨↓⍵} ⍝ diagonal
dirs←{⍵(⌽⍵)(⍉⍵)(⌽⍉⍵)(⊢X⊢⍵)(⊢X⌽⍵)(⌽X⊢⍵)(⌽X⌽⍵)}
⎕←+/∊'XMAS'∘⍷¨dirs puzzle
⎕←+/∊{∧/∨⌿'MAS'∘.≡∘(1 1∘⍉¨)⍥(⊢,⍥⊂⌽)⍵}⌺3 3⊢puzzle
