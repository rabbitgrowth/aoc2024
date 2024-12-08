map←↑⊃⎕NGET'08.txt'1
emit←(⊣+-),⍥⊂⊢+-⍨
mask←'.'≠,map
idx←map⊂⍤⊢⌸⍥(mask/,)⍳⍴map
comb←⊂⌷⍨∘⊂¨∘⍸∘.<⍨⍤⍳⍤≢
⎕←≢(,⍳⍴map)∩⊃,/⊃,/((⊃emit/)¨comb)¨idx
