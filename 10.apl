map←⍎¨↑⊃⎕NGET'10.txt'1
adjacent← 1=+/¨|∘.-⍨,⍳⍴map
uphill  ←¯1=    ∘.-⍨,  map
good←adjacent∧uphill
score←{+/,(9=,⍺)/(0=,⍺)⌿⍺⍺⍣≡⍨⍵}
⎕←map(∨.∧∨⊣)score good
⎕←map(+.×+⊣)score good
