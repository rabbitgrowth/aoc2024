rules updates←'|,'(⍎¨≠⊆⊢)¨¨(⊢⊆⍨∘×≢¨)⊃⎕NGET'05.txt'1
before after←↓⍉⊃,⍥⊂⌸/↓⍉↑rules
sorted←{⍵[⍒≢¨⍵∘∩¨(after,⊂⍬)[before⍳⍵]]}¨updates
⎕←(1 0,updates≡¨sorted)+/⍤⊢⌸0 0,(⊢⊃⍨∘⌈2÷⍨≢)¨sorted
