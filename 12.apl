map←↑⊃⎕NGET'12.txt'1
regions←⊃,/{⍸⍣¯1⍤(/∘⍵)¨↓∪(∨.∧⍨∨⊢)⍣≡1≥+/¨|∘.-⍨⍵}¨map⊂⍤⊢⌸⍥,⍳⍴map
price←{
  area←+/,⍵
  perimeter←(4×area)-2×(2∧⌿⍵)+⍥(+/,)2∧/⍵
  area×perimeter
}
⎕←+/price¨regions
