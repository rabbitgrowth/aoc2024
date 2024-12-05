rules updates←'|,'(⍎¨≠⊆⊢)¨¨(⊢⊆⍨∘×≢¨)⊃⎕NGET'05.txt'1
before after←↓⍉⊃,⍥⊂⌸/↓⍉↑rules
sorted←{⍵[⍒(≢⍵∘∩)¨(after,⊂⍬)[before⍳⍵]]}¨updates
middles←(⊢⊃⍨∘⌈2÷⍨≢)¨sorted
⎕←(1 0,updates≡¨sorted)+/⍤⊢⌸0 0,middles
