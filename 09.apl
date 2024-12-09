⎕IO←0
⎕PP←34
map←⍎¨⊃⊃⎕NGET'09.txt'1
files←∊(⊢⍴¨¯1,⍨⍪⍤⍳⍤≢)(,∘0⍴⍨2,⍨∘⌈2÷⍨≢)map
space←¯1=files
cksum←⍳⍤≢+.×⊢
⎕←cksum(+/~space)↑((+/space)↑⌽files/⍨~space)@(space⍨)files
{
  idx←⍸⍵=files
  size←≢idx
  space←¯1=files↑⍨⊃idx
  starts spans←↓⍉-⍨\(⊢⍴⍨2,⍨2÷⍨≢)(⍸2≠/0,,∘0)space
  fit←spans≥size
  ~∨/fit:0
  files[idx]←¯1
  files[starts[⊃⍸fit]+⍳size]←⍵
}¨⌽⍳1+⊃⌽files
⎕←cksum 0⌈files
