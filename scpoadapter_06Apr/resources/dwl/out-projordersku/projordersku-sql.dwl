%dw 2.0
output application/java
---
if(vars.filterCondition != null)
	"SELECT PROJORDERSKU.*,ITEM.UOM FROM PROJORDERSKU,ITEM WHERE PROJORDERSKU.ITEM = ITEM.ITEM" ++ " AND " ++ vars.filterCondition ++ " ORDER BY PROJORDERSKU.ORDERID,PROJORDERSKU.ITEM,PROJORDERSKU.DEST OFFSET " ++ vars.offset ++ " ROWS FETCH NEXT " ++ vars.next ++ " ROWS ONLY"
else	
	"SELECT PROJORDERSKU.*,ITEM.UOM FROM PROJORDERSKU,ITEM WHERE PROJORDERSKU.ITEM = ITEM.ITEM" ++ " ORDER BY PROJORDERSKU.ORDERID,PROJORDERSKU.ITEM,PROJORDERSKU.DEST OFFSET " ++ vars.offset ++ " ROWS FETCH NEXT " ++ vars.next ++ " ROWS ONLY"