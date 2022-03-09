%dw 2.0
output application/java

---
 (payload map (altbom, indexOfaltbom) -> {
 	     MS_BULK_REF: altbom.MS_BULK_REF,
	     MS_REF: altbom.MS_REF,
 		 INTEGRATION_STAMP: altbom.INTEGRATION_STAMP,
 		 MESSAGE_TYPE: altbom.MESSAGE_TYPE,
 		 INTEGRATION_JOBID: altbom.INTEGRATION_JOBID,
 		 SENDER: altbom.SENDER,
		 ALTSUBORD: altbom.ALTSUBORD,
		 ALTSUBORDEFF: altbom.ALTSUBORDEFF,
		 BOMNUM: altbom.BOMNUM,
		 EFF: altbom.EFF,
		 ITEM: altbom.ITEM,
		 LOC: altbom.LOC,
		 OFFSET: altbom.OFFSET,
		 SUBORD: altbom.SUBORD,
		 (vars.deleteudc): 'Y'
 	 })