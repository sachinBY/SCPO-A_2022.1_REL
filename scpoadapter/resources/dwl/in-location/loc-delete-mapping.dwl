%dw 2.0
output application/java
---
(payload map (loc, indexOfLoc) -> {
	MS_BULK_REF: loc.MS_BULK_REF,
	MS_REF: loc.MS_REF,
	INTEGRATION_STAMP: loc.INTEGRATION_STAMP,
    (LOC: loc.LOC) if not loc.LOC == null,
    (vars.deleteudc): 'Y'
  })