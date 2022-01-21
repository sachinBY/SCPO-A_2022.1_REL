%dw 2.0
output application/json encoding = "UTF-8"
var funCaller = readUrl("classpath://config-repo/scpoadapter/resources/dwl/date-util.dwl")
var udcs = vars.outboundUDCs.projordertotal[0].projordertotal[0]
---
{
	header: {
			sender: p('scpo.outbound.sender'),
		receiver: (splitBy(p("scpo.outbound.projordertotal.receivers"), ",") map {
			(receiver: $) if (!isEmpty($))
		}).receiver,
		messageVersion: p('scpo.outbound.projordertotal.identifier'),
		messageId: uuid(),
		"type": p("scpo.outbound.projordertotal.messagetype"),
		creationDateAndTime: now()
	},
	recommendedPurchaseOrder: (payload map{
		creationDateTime: now(),
		documentStatusCode: "ORIGINAL",
		documentActionCode: "ADD",

    (avpList: 
					(filter(udcs, (element, index) -> $[upper(element.scpoColumnName)] != null) map (udc , value) -> {
						name: udc.hostColumnName,
						value: $[upper(udc.scpoColumnName)]
					})
				) if (!isEmpty(udcs)),
		recommendedPurchaseOrderId: $.ORDERID as String default "",
		"type":"RECOMMENDED_ORDER_PROJECTION",
		orderDetail: {
			orderTotal: [{
				unitOfMeasure: $.UOM as String default "",
				totalOrderQuantityOrAmount: $.QTY
				}]}})}
		
		
   	   
