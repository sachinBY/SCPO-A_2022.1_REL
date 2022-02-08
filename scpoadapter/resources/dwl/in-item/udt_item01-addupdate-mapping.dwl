%dw 2.0
output application/java  
var default_value = "###JDA_DEFAULT_VALUE###"

---
(payload map (itm, indexOfItem) -> { 
		MS_BULK_REF: itm.MS_BULK_REF,
		MS_REF: item.MS_REF, 	  	
   		INTEGRATION_STAMP: itm.INTEGRATION_STAMP,
		ITEM: itm.ITEM,
		UDT_ATTRIBUTE_STR1: itm.UDT_ATTRIBUTE_STR1
  	
	
	
	
})
