⎕IO←0
pos vel←↓⍉↑{2(↑,⍥⊂↓)⍎¨⍵⊆⍨⍵∊⎕D,'-'}¨⊃⎕NGET'14.txt'1
size←101 103
mid←⌊size÷2
pos←(⊂size)|pos+100×vel
⎕←×/≢⍤⊢⌸(⊂mid)<pos/⍨~∨/¨pos=⊂mid
