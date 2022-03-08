%dw 2.0
output application/java

---
 (payload map (altbom, indexOfaltbom) -> {
 	     MS_BULK_REF: altbom.MS_BULK_REF,
	     MS_REF: altbom.MS_REF,
 		 INTEGRATION_STAMP: altbom.INTEGRATION_STAMP,
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