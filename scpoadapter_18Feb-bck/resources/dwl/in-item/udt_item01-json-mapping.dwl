%dw 2.0
output application/java


---
(payload.item map (itm , index) -> {
	(MS_BULK_REF: vars.storeHeaderReference.bulkReference),
	(MS_REF: vars.storeMsgReference.messageReference),
  	(INTEGRATION_STAMP:((vars.creationDateAndTime as DateTime) + ("PT$((index))S" as Period)) as String{format:"yyyy-MM-dd HH:mm:ss"}),
	ITEM: itm.avpList[0].value,
	UDT_ATTRIBUTE_STR1: itm.avpList[1].value,
  	ACTIONCODE: itm.documentActionCode
	
	
	
})
