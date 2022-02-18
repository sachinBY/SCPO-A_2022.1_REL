%dw 2.0
output application/java  
---
(payload map (item, indexOfItem) -> {
	MS_BULK_REF: item.MS_BULK_REF,
	MS_REF: item.MS_REF, 
	INTEGRATION_STAMP: item.INTEGRATION_STAMP,
	ITEM: itm.ITEM,
	(vars.deleteudc): 'Y'		
	
	
	
})
