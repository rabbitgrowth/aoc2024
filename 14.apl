⎕IO←0
pos vel←2(↑⍤1,⍥⊂↓⍤1)↑(⍎¨∊∘(⎕D,'-')⊆⊢)¨⊃⎕NGET'14.txt'1
size←101 103
mid←⌊size÷2
pos←size(|⍤1)pos+100×vel
⎕←×/≢⍤⊢⌸mid(<⍤1)pos⌿⍨mid(∧.≠⍤1)pos
secs←0
show←{⍸⍣¯1↓{⍵[⍋⍵;]}∪⍵}
block←3 3⍴1
pos←{size(|⍤1)⍵+vel⊣secs+←1}⍣{1∊block⍷show⍺}pos
⎕←100+secs
⎕←' ⎕'[⍉show pos]