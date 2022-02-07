%dw 2.0
output application/java
---
(flatten(payload.data) map(fcstHist, index) -> {
	MS_BULK_REF: fcstHist.MS_BULK_REF,
	MS_REF: fcstHist.MS_REF,  
	INTEGRATION_STAMP: fcstHist.INTEGRATION_STAMP,
	(ITEM: fcstHist.ITEM),
	(LOC: fcstHist.LOC),
	FCSTDATE: fcstHist.FCSTDATE,
	STARTDATE: fcstHist.STARTDATE,
	DUR: fcstHist.DUR,
	(vars.deleteudc): 'Y'
})