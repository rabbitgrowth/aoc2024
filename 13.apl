⎕IO←0
⎕PP←34
machines←(⍎¨∊∘⎕D⊆⊢)¨¨(⊢⊆⍨∘×≢¨)⊃⎕NGET'13.txt'1
tokens←{
  a b prize←⍵
  pushes←(⍺+prize)⌹⍉↑a b
  (⌊∨.≠⊢)pushes:0
  3 1+.×pushes
}
⎕←+/0    tokens¨machines
⎕←+/1e13 tokens¨machines
