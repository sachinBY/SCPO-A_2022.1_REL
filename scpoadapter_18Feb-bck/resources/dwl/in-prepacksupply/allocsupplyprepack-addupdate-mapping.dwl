%dw 2.0
output application/java  
var funCaller = readUrl("classpath://config-repo/scpoadapter/resources/dwl/date-util.dwl")
var default_value = "###JDA_DEFAULT_VALUE###"
---
 (payload map (prepack, index) -> {
 		MS_BULK_REF: prepack.MS_BULK_REF,
		MS_REF: prepack.MS_REF,
 	    INTEGRATION_STAMP: prepack.INTEGRATION_STAMP,
	  	AVAILDATE: prepack.AVAILDATE,
	  	LOC: prepack.LOC,
		NUMPACKS: prepack.NUMPACKS,
		SUPPLYID: prepack.SUPPLYID,
		SUPPLYTYPE: prepack.SUPPLYTYPE,
		(prepack.udcs map {
			(($.scpoColumnName): if ($.scpoColumnValue == null or $.scpoColumnValue == default_value) default_value
								else if ($.dataType != null and $.dataType == "DATETIME") $.scpoColumnValue as DateTime as String
								else if ($.dataType != null and $.dataType == "DATE") $.scpoColumnValue as Date {format: "yyyy-MM-dd", class : "java.sql.Date"}
								else if ($.dataType != null and ($.dataType == "NUMBER" or $.dataType == "FLOAT" or $.dataType == "INTEGER")) $.scpoColumnValue as Number
								else $.scpoColumnValue) if ($ != null and $.scpoColumnName != null)
			}),
		(prepack.AllocSupplyUDC default [] map {
	      		(($.UDCName): if ($.UDCValue == null or $.UDCValue == default_value) default_value
								else if ($.dataType != null and $.dataType == "DATETIME") $.UDCValue as DateTime as String
								else if ($.dataType != null and $.dataType == "DATE") $.UDCValue as Date {format: "yyyy-MM-dd", class : "java.sql.Date"}
								else if ($.dataType != null and ($.dataType == "NUMBER" or $.dataType == "FLOAT" or $.dataType == "INTEGER")) $.UDCValue as Number
								else $.UDCValue) if ($ != null and $.UDCName != null)
	    })
    
  })