%dw 2.0
output application/java
---
 (payload map (bom, indexOfBom) -> {
 	     MS_BULK_REF: bom.MS_BULK_REF,
		 MS_REF: bom.MS_REF,
 		 INTEGRATION_STAMP: bom.INTEGRATION_STAMP,
  		 BOMNUM: bom.BOMNUM,
		 EFF: bom.EFF,
		 ITEM: bom.ITEM,
		 LOC: bom.LOC,
		 OFFSET: bom.OFFSET,
		 SUBORD: bom.SUBORD,
		 (vars.deleteudc): 'Y'
 	 })