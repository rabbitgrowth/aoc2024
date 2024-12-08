⎕IO←0
map←↑⊃⎕NGET'06.txt'1
blocked guard←'#^'=⊂map
pos←⊃⍸guard
dirs←4 2⍴¯1 0 0 1 1 0 0 ¯1
dir←0
turn←4|1∘+
route←↑4↑⊂guard
out←~(⍳⍴map)∊⍨⊂
move←{
  pos dir route←⍵
  turns←+/∧\(blocked⌷⍨pos+⌷∘dirs)¨(⊢,turn)dir
  dir←turn⍣turns⊢dir
  pos+←dir⌷dirs
  ((dir,pos)⌷route)+←1
  pos dir route
}
stop←{
  pos dir route←⍺
  out pos+dir⌷dirs
}
visited←×+⌿⊃⌽move⍣stop⊢pos dir route
⎕←+/,visited
