⎕PP←34
stones←,∘≢⌸⍎⊃⊃⎕NGET'11.txt'1
change←{
  0=⍵:1
  digits←⌊1+10⍟⍵
  1=2|digits:2024×⍵
  ⍵⊤⍨0,10*digits÷2
}
blink←{
  nums counts←↓⍉⍵
  nums←change¨nums
  counts+←0×nums
  nums,∘(+/)⌸⍥∊counts
}
stones←blink⍣25⊢stones
⎕←+/⊢/stones
stones←blink⍣50⊢stones
⎕←+/⊢/stones
