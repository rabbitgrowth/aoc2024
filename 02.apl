reports←⍎¨⊃⎕NGET'02.txt'1
safe←((∧.>∨∧.<)∘0∨.∧|∧.≤3⍨)2-/⊢
⎕←+/safe¨reports
dampen←∘.≠⍨⍤⍳⍤≢(/⍤1)⊢
⎕←+/(safe∨safe⍤dampen)¨reports
