map←↑⊃⎕NGET'08.txt'1
antennas←map⊂⍤⊢⌸⍥(('.'≠map)∘(/⍥,))⍳⍴map
pairs←⊂⌷⍨∘⊂¨∘⍸∘.<⍨⍤⍳⍤≢
emit←{f←⊂⍤⊣+⍺⍺×⊂⍤- ⋄ ⍺(f,f⍨)⍵}
solve←{≢(,⍳⍴map)∩⊃,/⊃,/(⊃⍵emit/)¨⍤pairs¨antennas}
⎕←solve ,1
⎕←solve 0,⍳⌈/⍴map
