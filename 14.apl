⎕IO←0
robots←(⍎¨∊∘('-',⎕D)⊆⊢)¨⊃⎕NGET'14.txt'1
size←101 103
middle←⌊size÷2
pos←{x y dx dy←⍵ ⋄ size|x y+100×dx dy}¨robots
⎕←×/≢⍤⊢⌸(⊂middle)<pos/⍨~∨/¨pos=⊂middle
