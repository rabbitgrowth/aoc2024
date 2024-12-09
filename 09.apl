⎕IO←0
⎕PP←34
map←⍎¨⊃⊃⎕NGET'09.txt'1
files←∊(⊢⍴¨¯1,⍨⍪⍤⍳⍤≢)(,∘0⍴⍨2,⍨∘⌈2÷⍨≢)map
⎕←(⍳⍤≢+.×⊢)(¯1+.≠files)↑((¯1+.=files)↑⌽files~¯1)@(¯1∘=)files
{
  idx←⍸⍵=files
  size←≢idx
  starts spans←↓⍉-⍨\(⊢⍴⍨2,⍨2÷⍨≢)(⍸2≠/0,,∘0)¯1=files↑⍨⊃idx
  fit←spans≥size
  ~∨/fit:0
  files[idx]←¯1
  files[starts[⊃⍸fit]+⍳size]←⍵
}¨⌽⍳1+⊃⌽files
⎕←(⍳⍤≢+.×⊢)0⌈files
