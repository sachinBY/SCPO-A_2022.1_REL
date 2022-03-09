%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
var lib = readUrl("classpath://config-repo/scpoadapter/resources/dwl/host-scpo-udc-mapping.dwl")
var skuDemandParamEntity = vars.entityMap.sku[0].skudemandparam[0]
---
(payload map {
	udcs:((skuDemandParamEntity map (value, index) -> {
			scpoColumnName: value.scpoColumnName,
			scpoColumnValue: if (lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0) != null and trim(lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0)) != '') (lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0)) else default_value,
			(dataType: value.dataType) if ((lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0)) != null),
	}) filter sizeOf($) > 0),
	MS_BULK_REF: vars.storeHeaderReference.bulkReference,
	MS_REF: vars.storeMsgReference.messageReference,	
	(INTEGRATION_STAMP:((vars.creationDateAndTime as DateTime) + ("PT$(($$))S" as Period)) as String{format:"yyyy-MM-dd HH:mm:ss"}),
	ITEM: $."itemLocationId.item.primaryId",
	LOC: $."itemLocationId.location.primaryId",
	INDDMDUNITCOST: $."demandParameters.unitCost.value",
	INDDMDUNITMARGIN: $."demandParameters.unitMargin.value",
	UNITCARCOST: $."demandParameters.unitInventoryCarryingCost.value",
	UNITPRICE: $."demandParameters.unitPrice.value",
	DMDTODATE: $."demandParameters.cumulativeDemandQuantity.value",
	ACTIONCODE: if ($.documentActionCode != null and !isEmpty($.documentActionCode)) $.documentActionCode else vars.bulknotificationHeaders.documentActionCode
})