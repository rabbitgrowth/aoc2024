rules updates←'|,'(⍎¨≠⊆⊢)¨¨(⊢⊆⍨∘×≢¨)⊃⎕NGET'05.txt'1
before after←↓⍉⊃,⍥⊂⌸/↓⍉↑rules
Right←(⍳⍤≢↓¨⊂)∧.(∧/∊)(after,⊂⍬)⌷⍨∘⊂before∘⍳
wrong right←(0 1,Right¨updates)(⊂1↓⊢)⌸⍬⍬,updates
Middle←⊢⊃⍨∘⌈2÷⍨≢
⎕←+/Middle¨right
⎕←+/Middle¨{⍵[⍒≢¨⍵∘∩¨(after,⊂⍬)[before⍳⍵]]}¨wrong