map←↑⊃⎕NGET'06.txt'1
empty block pos←⍸¨'.#^'=⊂map
pos←⊃pos
idx←⍳⍴map
out←~idx∊⍨⊂
dir←¯1 0
rot←⊃,∘-⍨/
move←{
  ⍺←⍬
  extra←block,⊂⍺
  pos dir←⊃⌽⍵
  new←pos+dir
  extra∊⍨⊂new:⍵,⊂(pos∘+,⍥⊂⊢)rot dir
  ⍵,⊂new dir
}
stop←{
  last←⊃⌽⍺
  (out⊃last)∨(⊂last)∊¯1↓⍺
}
⎕←≢∪¯1↓⊃¨move⍣stop⊂pos dir
⎕←+/{~out⊃⊃⌽⍵∘move⍣stop⊂pos dir}¨empty
