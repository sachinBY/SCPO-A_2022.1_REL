%dw 2.0
output application/java  
var default_value = "###JDA_DEFAULT_VALUE###"
---
(payload map (cal, indexOfCalAttribute) -> {  	  	
    		MS_BULK_REF: cal.MS_BULK_REF,
			MS_REF: cal.MS_REF,	
    		CAL: cal.CAL,
    		ATTRIBUTE: cal.ATTRIBUTE,
    		(vars.deleteudc): 'Y'		    
    })