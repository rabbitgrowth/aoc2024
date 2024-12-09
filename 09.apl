⎕IO←0
⎕PP←34
map←⍎¨⊃⊃⎕NGET'09.txt'1
files←∊(⊢⍴¨¯1,⍨⍪⍤⍳⍤≢)(,∘0⍴⍨2,⍨∘⌈2÷⍨≢)map
space←¯1=files
cksum←⍳⍤≢+.×⊢
⎕←cksum(+/~space)↑((+/space)↑⌽files/⍨~space)@(space⍨)files
⎕←cksum 0⌈⊃{
  idx←⍸⍺=⍵
  size←≢idx
  space←¯1=⍵↑⍨⊃idx
  starts spans←↓⍉-⍨\(⊢⍴⍨2,⍨2÷⍨≢)(⍸2≠/0,,∘0)space
  fit←spans≥size
  ~∨/fit:⍵
  ⍺@(starts[⊃⍸fit]+⍳size)⊢¯1@idx⊢⍵
}/(⍳1+⊃⌽files),⊂files
