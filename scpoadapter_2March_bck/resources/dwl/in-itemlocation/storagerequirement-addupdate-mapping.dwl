%dw 2.0
output application/java  
var default_value = "###JDA_DEFAULT_VALUE###"
var SkuSSPresentationUDC = vars.entityMap.sku[0].skusspresentation[0]
---
(payload map (value, indexOf) -> {
		MS_BULK_REF: value.MS_BULK_REF,
		MS_REF: value.MS_REF,	
		INTEGRATION_STAMP: value.INTEGRATION_STAMP,
	    ITEM: if (value.ITEM != null) value.ITEM else default_value,
	    LOC: if (value.LOC != null) value.LOC else default_value,
	    RES: if (value.RES != null) value.RES else default_value,
	    ENABLEOPT: default_value,
	    (value.udcs map {
			(($.scpoColumnName): if ($.scpoColumnValue == null or $.scpoColumnValue == default_value) default_value
								else if ($.dataType != null and $.dataType == "DATETIME") $.scpoColumnValue as DateTime as String
								else if ($.dataType != null and $.dataType == "DATE") $.scpoColumnValue as Date {format: "yyyy-MM-dd", class : "java.sql.Date"}
								else if ($.dataType != null and ($.dataType == "NUMBER" or $.dataType == "FLOAT" or $.dataType == "INTEGER")) $.scpoColumnValue as Number
								else $.scpoColumnValue) if ($ != null and $.scpoColumnName != null)
			}),
		(value.SkuSTORAGEREQUIREMENTUDC default [] map {
	      		(($.UDCName): if ($.UDCValue == null or $.UDCValue == default_value) default_value
								else if ($.dataType != null and $.dataType == "DATETIME") $.UDCValue as DateTime as String
								else if ($.dataType != null and $.dataType == "DATE") $.UDCValue as Date {format: "yyyy-MM-dd", class : "java.sql.Date"}
								else if ($.dataType != null and ($.dataType == "NUMBER" or $.dataType == "FLOAT" or $.dataType == "INTEGER")) $.UDCValue as Number
								else $.UDCValue) if ($ != null and $.UDCName != null)
	    })
  })