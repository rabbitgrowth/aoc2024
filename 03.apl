prog←⊃⎕NGET'03.txt'
split←↑,⍥⊂↓
splitnum←{⍵split⍨+/∧\⎕D∊⍨3↑⍵}
mul←{
  x rest←splitnum ⍵
  ''≡x:0
  c rest←1 split rest
  ','≠c:0
  y rest←splitnum rest
  ''≡y:0
  c rest←1 split rest
  ')'≠c:0
  x×⍥⍎y
}
starts←'mul('(≢⍤⊣+⍸⍤⍷)prog
prods←(starts-1)mul⍤↓¨⊂prog
do dont←'do()' 'don''t()'⍸⍤⍷¨⊂prog
switches←(⊂⍤⍋⌷⊢)do,dont
mask←(1,switches∊do)[1+switches⍸starts]
⎕←+/prods
⎕←+/mask/prods
