map←↑⊃⎕NGET'06.txt'1
empty block pos←⍸¨'.#^'=⊂map
pos←⊃pos
idx←⍳⍴map
Out←~idx∊⍨⊂
dir←¯1 0
Rot←⊃,∘-⍨/
Move←{
  ⍺←⍬
  extra←block,⊂⍺
  pos dir←⊃⌽⍵
  new←pos+dir
  extra∊⍨⊂new:⍵,⊂(pos∘+,⍥⊂⊢)Rot dir
  ⍵,⊂new dir
}
Stop←{
  last←⊃⌽⍺
  (Out⊃last)∨(⊂last)∊¯1↓⍺
}
⎕←≢∪¯1↓⊃¨Move⍣Stop⊂pos dir
⎕←+/{~Out⊃⊃⌽⍵∘Move⍣Stop⊂pos dir}¨empty
