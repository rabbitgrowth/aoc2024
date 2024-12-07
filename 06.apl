map←↑⊃⎕NGET'06.txt'1
obs←'#'=⌷∘map
pos←⊃⍸'^'=map
dir←¯1 0
rot←⊃,∘-⍨/
move←{
  pos dir←⊃⌽⍵
  rots←+/∧\⍺⍺¨(⊂pos)+(⊢,⍥⊂rot)dir
  dir←rot⍣rots⊢dir
  pos+←dir
  ⍵,⊂pos dir
}
atexit←{~(+/⊃⌽⍵)∊⍳⍴map}
loop←⊢/∊¯1∘↓
stop←(loop∨atexit)⊣
⎕←≢route←∪⊃¨obs move⍣stop⊂pos dir
⎕←+/{~atexit(⍵∘≡∨obs)move⍣stop⊂pos dir}¨route
