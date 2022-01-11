%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
 (payload map (netcap, indexOfNetcap) -> {
 		MS_BULK_REF: netcap.MS_BULK_REF,
		MS_REF: netcap.MS_REF,
		INTEGRATION_STAMP: netcap.INTEGRATION_STAMP,
  		UOM: netcap.UOM,
		MINCAP: netcap.MINCAP,
		SOURCE: netcap.SOURCE,
		TRANSMODE: netcap.TRANSMODE,
		DEST: netcap.DEST,
		(vars.deleteudc): 'Y'
 	 })