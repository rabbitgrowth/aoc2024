⎕IO←0
map←↑⊃⎕NGET'06.txt'1
blocked guard←'#^'=⊂map
pos←⊃⍸guard
dirs←4 2⍴¯1 0 0 1 1 0 0 ¯1
dir←0
turn←4|1∘+
route←↑4↑⊂guard
state←pos dir route
out←~(⍳⍴map)∊⍨⊂
move←{
  pos dir route←⍵
  turns←+/∧\(⍺⌷⍨pos+⌷∘dirs)¨(⊢,turn)dir
  dir←turn⍣turns⊢dir
  pos+←dir⌷dirs
  ((dir,pos)⌷route)+←1
  pos dir route
}
stop←{
  pos dir route←⍺
  (2∊route)∨out pos+dir⌷dirs
}
visited←×+⌿⊃⌽blocked∘move⍣stop⊢state
⎕←+/,visited
⎕←+/{2∊⊃⌽(1@(⊂⍵)⊢blocked)∘move⍣stop⊢state}¨⍸visited
