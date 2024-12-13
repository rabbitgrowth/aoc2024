⎕IO←0
machines←(⍎¨∊∘⎕D⊆⊢)¨¨(⊢⊆⍨∘×≢¨)⊃⎕NGET'13.txt'1
times←⍳101
⎕←+/{
  a b prize←⍵
  costs←+/¨(⊂3 1)×⍸(⊂prize)≡¨a∘.+⍥(times×⊂)b
  ⍬≡costs:0
  ⌊/costs
}¨machines
