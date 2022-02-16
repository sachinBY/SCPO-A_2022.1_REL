%dw 2.0
output application/csv
var udcs = vars.outboundUDCs.recship[0].recship[0]
var funCaller = readUrl("classpath://config-repo/scpoadapter/resources/dwl/date-util.dwl")
var lib = readUrl("classpath://config-repo/scpoadapter/resources/dwl/host-scpo-udc-mapping.dwl")
---
(payload map {
	"supplyPlan.creationDateTime": now() >> "UTC",
	"supplyPlan.documentStatusCode": "ORIGINAL",
	"plannedSupplydocumentActionCode": "ADD",
	
	"plannedSupply.supplyPlanId.item.primaryId": $.DMDUNIT,
	"plannedSupply.plannedSupplyId.item.additionalTradeItemId.typeCode": "GTIN-14",
	"plannedSupply.plannedSupplyId.item.additionalTradeItemId.value": "00000000000000",
	
	"plannedSupply.plannedSupplyId.loc.primaryId": $.LOC,
	"plannedSupply.plannedSupplyId.loc.additionalPartyId.typeCode": "GLN",
	"plannedSupply.plannedSupplyId.loc.additionalPartyId.value": "0000000000000",
	
	
	
	"plannedSupply.type": "DFU",
	
	"plannedSupply.plannedSupplyDetail.dmdgroup": $.DMDUNIT,
	"plannedSupply.plannedSupplyDetail.histstart": funCaller.formatSCPOToGS1($.HISTSTART),
	"plannedSupply.plannedSupplyDetail.eff": funCaller.formatSCPOToGS1($.EFF),
	"plannedSupply.plannedSupplyDetail.disc": funCaller.formatSCPOToGS1($.DISC),
	"plannedSupply.plannedSupplyDetail.dmdpostdate": funCaller.formatSCPOToGS1($.DMDPOSTDATE),
	"plannedSupply.plannedSupplyDetail.fcsthor.value": $.FCSTHOR,
	,
    (udcs map (udc , index) -> {
		((udc.hostColumnName): lib.eval($[udc.scpoColumnName] , upper(udc.dataType)))
	}),
})
