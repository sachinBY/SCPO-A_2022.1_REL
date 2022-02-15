%dw 2.0
output application/java
---
payload map (planArriv, indexOfplanArriv) -> {
		MS_BULK_REF: planArriv.MS_BULK_REF,
		MS_REF: planArriv.MS_REF,
	    INTEGRATION_STAMP: planArriv.INTEGRATION_STAMP,
		ITEM: planArriv.ITEM,
		DEST: planArriv.DEST,
		SEQNUM: planArriv.SEQNUM,
		(vars.deleteudc): 'Y'   
}