%dw 2.0
import * from dw::core::Strings
output application/json encoding="UTF-8"
var funCaller = readUrl("classpath://config-repo/scpoadapter/resources/dwl/date-util.dwl")
var udcs = vars.outboundUDCs.fcst[0].dfutoskufcst[0]
---
{header:{
    sender: p('scpo.outbound.sender'),
		receiver: (splitBy(p("scpo.outbound.dfutoskufcst.receivers"), ",") map {
			(receiver: $) if (!isEmpty($))
		}).receiver,
		messageVersion: p('scpo.outbound.dfutoskufcst.identifier'),
		messageId: uuid(),
		"type": p("scpo.outbound.dfutoskufcst.messagetype"),
		creationDateAndTime: now()
},
    forecast2:(payload map {
        itemId:$.ITEM,
        locationId:$.SKULOC,
        demandChannel:$.DMDGROUP,
    		 (avpList: 
					(filter(udcs, (element, index) -> $[upper(element.scpoColumnName)] != null) map (udc , value) -> {
						name: udc.hostColumnName,
						value: $[upper(udc.scpoColumnName)]
					})
				) if (!isEmpty(udcs)),
    		forecastTypeCode:if($.TYPE != null) $.TYPE as String else "",
        measure:[{
            forecastStartDate:substringBefore($.STARTDATE,"T"),
            durationInMinutes:$.DUR,
            quantity:{
                value:$.TOTFCST
            }
        }]
    })}