%dw 2.0
output application/java  
var default_value = "###JDA_DEFAULT_VALUE###"
---
 (payload map (itemlocdmdgroup, indexOfItemlocdmdgroup) -> {
 		MS_BULK_REF: itemlocdmdgroup.MS_BULK_REF,
        MS_REF: itemlocdmdgroup.MS_REF,
		INTEGRATION_STAMP: itemlocdmdgroup.INTEGRATION_STAMP,
	  	DMDGROUP: itemlocdmdgroup.DMDGROUP,
	    ITEM : itemlocdmdgroup.ITEM,
	    LOC : itemlocdmdgroup.LOC,
	    (vars.deleteudc): 'Y'
	   
    
 })