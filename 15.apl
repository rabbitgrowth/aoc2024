top bot←(⊢⊆⍨∘×≢¨)⊃⎕NGET'15.txt'1
map←↑top
idx←,⍳⍴map
times←⍳⌈/⍴map
wall boxes robots←⍸¨'#O@'=⊂map
robot←⊃robots
dirs←(0 ¯1)(0 1)(¯1 0)(1 0)['<>^v'⍳∊bot]
⎕←+/∊(⊂100 1)×¯1+⊃⊃{
  boxes robot←⍵
  ahead←idx∩⍨(⊂robot)+times×⊂⍺
  nboxes←+/∧\ahead∊boxes
  burden ahead←nboxes(↑,⍥⊂↓)ahead
  wall∊⍨⊂⊃ahead:boxes robot
  ((boxes~burden)∪burden+⊂⍺)(robot+⍺)
}/(⌽dirs),⊂boxes robot
