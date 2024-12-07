map←↑⊃⎕NGET'06.txt'1
pos←⊃⍸'^'=map
dir←¯1 0
rot←⊃,∘-⍨/
move←{
  pos dir←⊃⌽⍵
  rots←+/∧\'#'=⌷∘map¨(⊂pos)+(⊢,⍥⊂rot)dir
  dir←rot⍣rots⊢dir
  pos+←dir
  ⍵,⊂pos dir
}
out←~(⍳⍴map)∊⍨⊂
stop←{out⊃+/⊃⌽⍺}
⎕←≢∪⊃¨move⍣stop⊂pos dir
