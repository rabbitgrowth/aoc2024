⎕IO←0
⎕PP←34
map←⍎¨⊃⊃⎕NGET'09.txt'1
files←∊(⊢⍴¨¯1,⍨⍪⍤⍳⍤≢)(,∘0⍴⍨2,⍨∘⌈2÷⍨≢)map
⎕←(⍳⍤≢+.×⊢)(¯1+.≠files)↑((¯1+.=files)↑⌽files~¯1)@(¯1∘=)files
