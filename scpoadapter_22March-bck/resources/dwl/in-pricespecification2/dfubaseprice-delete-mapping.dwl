%dw 2.0
output application/java
---
(payload map ($ - "ACTIONCODE" - "BASEPRICE" - "DUR" ++ (vars.deleteudc): 'Y'))