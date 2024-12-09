⎕IO←0
⎕PP←34
map←⍎¨⊃⊃⎕NGET'09.txt'1
files←∊(⊢⍴¨¯1,⍨⍪⍤⍳⍤≢)(,∘0⍴⍨2,⍨∘⌈2÷⍨≢)map
cksum←⍳⍤≢+.×⊢
⎕←cksum{(0+.≤⍵)↑((¯1+.=⍵)↑⌽⍵~¯1)@(¯1∘=)⍵}files
⎕←cksum 0⌈⊃{
  idx←⍸⍺=⍵
  size←≢idx
  starts spans←↓⍉-⍨\(⊢⍴⍨2,⍨2÷⍨≢)(⍸2≠/0,,∘0)¯1=⍵↑⍨⊃idx
  fit←spans≥size
  ~∨/fit:⍵
  ⍺@(starts[⊃⍸fit]+⍳size)⊢¯1@idx⊢⍵
}/(⍳1+⊃⌽files),⊂files
