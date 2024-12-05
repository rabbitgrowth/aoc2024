rules updates←'|,'(⍎¨≠⊆⊢)¨¨(⊢⊆⍨∘×≢¨)⊃⎕NGET'05.txt'1
before after←↓⍉⊃,⍥⊂⌸/↓⍉↑rules
Correct←(⍳⍤≢↓¨⊂)∧.(∧/∊)(after,⊂⍬)⌷⍨∘⊂before∘⍳
⎕←+/(⊢⊃⍨∘⌈2÷⍨≢)¨(Correct¨⊢⍤/⊢)updates
