map←↑⊃⎕NGET'08.txt'1
emit←(⊣+-),⍥⊂⊢+-⍨
freq idx←↓⍉1↓('.',,map),⍥⊂⌸0,,⍳⍴map
comb←⊂⌷⍨∘⊂¨∘⍸∘.<⍨⍤⍳⍤≢
⎕←≢(,⍳⍴map)∩⊃,/⊃,/((⊃emit/)¨comb)¨idx
