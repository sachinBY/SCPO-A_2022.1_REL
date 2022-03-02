%dw 2.0
output application/csv
var udcs = vars.outboundUDCs.vehicleloadline[0].vehicleloadline[0]
var lib = readUrl("classpath://config-repo/scpoadapter/resources/dwl/host-scpo-udc-mapping.dwl")
---
payload map {
	"plannedSupplyId.item.primaryId": $.ITEM,
	"plannedSupplyId.shipTo.primaryId": $.DEST,
	"plannedSupplyId.shipFrom.primaryId": $.SOURCE,
	"plannedSupplyId.transportLoadId": $.LOADID,
	"type": "VEHICLE_LOAD",
	"loadBuildSource": $.LBSOURCE,
	"isApproved": $.APPROVALSTATUS,
	"plannedSupplyDetail.requestedQuantity.value": $.QTY,
	"plannedSupplyDetail.movementInformation.deliveryDate": $.SCHEDARRIVDATE as DateTime as Date {
		format: "yyyy-MM-dd", class : "java.sql.Date"
	},
	(udcs map (udc , index) -> {
		((udc.hostColumnName): lib.eval($[udc.scpoColumnName] , upper(udc.dataType)))
	}),
}  	   
