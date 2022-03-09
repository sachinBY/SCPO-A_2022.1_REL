%dw 2.0
output application/json
---
using (
    sql = "SELECT COUNT(*) FROM (SELECT VLL.*,VL.APPROVALSTATUS as APPROVALSTATUS FROM VEHICLELOAD VL, VEHICLELOADLINE VLL where VL.LOADID = VLL.LOADID"
)
if (vars.filterCondition != null)
   sql ++ " AND " ++ vars.filterCondition ++ " ORDER BY VLL.LOADID,VLL.PRIMARYITEM,VLL.EXPDATE,VLL.ITEM,VLL.DEST )"
  else 
   sql ++ " ORDER BY VLL.LOADID,VLL.PRIMARYITEM,VLL.EXPDATE,VLL.ITEM,VLL.DEST)"