reports←⍎¨⊃⎕NGET'02.txt'1
Safe←((0(∧.<∨∧.>)×)∧3∧.≥|)2-/⊢
⎕←+/Safe¨reports
