map←⍎¨↑⊃⎕NGET'10.txt'1
adjacent← 1=+/¨|∘.-⍨,⍳⍴map
uphill  ←¯1=    ∘.-⍨,  map
reachable←(∨.∧⍨∨⊢)⍣≡adjacent∧uphill
⎕←+/,(9=,map)/(0=,map)⌿reachable
