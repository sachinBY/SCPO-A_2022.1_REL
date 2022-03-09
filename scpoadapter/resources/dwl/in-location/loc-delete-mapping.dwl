%dw 2.0
output application/java
---
(payload map (loc, indexOfLoc) -> {
	MS_BULK_REF: loc.MS_BULK_REF,
	MS_REF: loc.MS_REF,
	INTEGRATION_STAMP: loc.INTEGRATION_STAMP,
	MESSAGE_TYPE: loc.MESSAGE_TYPE,
	INTEGRATION_JOBID: loc.INTEGRATION_JOBID,
	SENDER: loc.SENDER,
    (LOC: loc.LOC) if not loc.LOC == null,
    (vars.deleteudc): 'Y'
  })