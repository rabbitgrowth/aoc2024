map←↑⊃⎕NGET'06.txt'1
pos←⊃⍸'^'=map
obs← ⍸'#'=map
dir←¯1 0
Rot←⌽×¯1*|⍤⊃
idx←⍳⍴map
Out←~idx∊⍨⊂
route←⊂pos
{
  try←⍵+dir
  obs∊⍨⊂try:new⊣route,←⊂new←⍵+dir⊢←Rot dir
  try⊣route,←⊂try
}⍣{Out⍺}pos
⎕←≢∪¯1↓route
