program←⊃⎕NGET'03.txt'

Split←↑,⍥⊂↓
SplitNum←{⍵Split⍨+/∧\⎕D∊⍨3↑⍵}
Product←{
  x rest←SplitNum ⍵
  ''≡x:0
  sep rest←1 Split rest
  ','≠sep:0
  y rest←SplitNum rest
  ''≡y:0
  end rest←1 Split rest
  ')'≠end:0
  x×⍥⍎y
}

starts←'mul('(≢⍤⊣+⍸⍤⍷)program
products←(starts-1)Product⍤↓¨⊂program
do dont←'do()' 'don''t()'⍸⍤⍷¨⊂program
intervals←{⍵[⍋⍵]}do,dont
mask←(1,intervals∊do)[1+intervals⍸starts]

⎕←+/products
⎕←+/mask/products
