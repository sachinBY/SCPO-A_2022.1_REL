%dw 2.0
output application/java
---
if(vars.filterCondition != null)
	"SELECT  SKU.*, SKUDEMANDPARAM.INDDMDUNITCOST,SKUDEMANDPARAM.PRICECAL ,SKUDEMANDPARAM.INDDMDUNITMARGIN,SKUDEMANDPARAM.UNITCARCOST,SKUDEMANDPARAM.UNITPRICE,SKUDEMANDPARAM.DMDTODATE, SKUDEPLOYMENTPARAM.INITSTKOUTCOST,SKUDEPLOYMENTPARAM.SURPLUSRESTOCKCOST, SKUEFFINVENTORYPARAM.MAXOHQTY, SKUEFFINVENTORYPARAM.MINSSQTY,SKUEFFINVENTORYPARAM.SSCOVDUR,SKUEFFINVENTORYPARAM.EFF AS EFFINV_EFF,SKUEFFINVENTORYPARAM.MAXCOVDUR,SKUPLANNINGPARAM.USEWIPSW,SKUPLANNINGPARAM.BUFFERLEADTIME,SKUPLANNINGPARAM.DRPFRZDUR,SKUPLANNINGPARAM.HOLDINGCOST AS PLANPARAM_HOLDINGCOST,SKUPLANNINGPARAM.INCDRPQTY,SKUPLANNINGPARAM.INCMPSQTY,SKUPLANNINGPARAM.INHANDLINGCOST,SKUPLANNINGPARAM.MAXOH AS PLANPARAM_MAXOH,SKUPLANNINGPARAM.MFGFRZDUR,SKUPLANNINGPARAM.MFGLEADTIME,SKUPLANNINGPARAM.MINDRPQTY,SKUPLANNINGPARAM.MINMPSQTY,SKUPLANNINGPARAM.OUTHANDLINGCOST,SKUPLANNINGPARAM.SHRINKAGEFACTOR,SKUPLANNINGPARAM.MPSCOVDUR,SKUPLANNINGPARAM.ORDERINGCOST,SKUPLANNINGPARAM.DRPCOVDUR, SKUSAFETYSTOCKPARAM.MAXSS AS SSPARAM_MAXSS,SKUSAFETYSTOCKPARAM.MINSS,SKUSAFETYSTOCKPARAM.SSCOV,SKUSAFETYSTOCKPARAM.STATSSCSL,SKUSAFETYSTOCKPARAM.ACCUMDUR,SKUSAFETYSTOCKPARAM.AVGLEADTIME,SKUSAFETYSTOCKPARAM.SSRULE,SKUPERISHABLEPARAM.MINSHELFLIFEDUR,SKUPERISHABLEPARAM.MINSHIPSHELFLIFEDUR,SKUPERISHABLEPARAM.SHELFLIFEDUR,SKUPERISHABLEPARAM.MAXSHELFLIFEDUR,SS.EFF AS SS_EFF,SS.QTY,SS.DMDGROUP,SKUIOPARAM.AVGRQSNSIZE,SKUIOPARAM.GROUPNAME,SKUIOPARAM.NUMRQSN,SKUIOPARAM.REVIEWGROUP,SKUIOPARAM.SENSITIVITYPROFILE,SKUEFFIOPARAM.UNITCOST,SKUEFFIOPARAM.STOCKOUTPENALTY,SKUEFFIOPARAM.REVIEWPERIOD,SKUEFFIOPARAM.REPLENPOLICY,SKUEFFIOPARAM.OVERSTOCKPENALTY,SKUEFFIOPARAM.ORDERCOST,SKUEFFIOPARAM.MINREORDERQTY,SKUEFFIOPARAM.MAXREORDERQTY,SKUEFFIOPARAM.IOSERVICEPROFILE,SKUEFFIOPARAM.HOLDINGCOST AS EFFIO_HOLDINGCOST,SKUEFFIOPARAM.HANDLINGCOST,SKUEFFIOPARAM.EVENTTYPE,SKUEFFIOPARAM.ENDOFLIFEDMD,SKUEFFIOPARAM.EFF AS EFFIO_EFF,SKUEFFIOPARAM.COEFFVAR,SKUEFFIOPARAM.BACKORDERPENALTY,STORAGEREQUIREMENT.RES,STORAGEREQUIREMENT.ENABLEOPT AS REQ_ENABLEOPT,SSPRESENTATION.EFF AS SSPR_EFF,SSPRESENTATION.DISC,SSPRESENTATION.PRESENTATIONQTY,SSPRESENTATION.DISPLAYQTY,SSPRESENTATION.MAXSS AS SSPR_MAXSS,SSPRESENTATION.MAXOH AS SSPR_MAXOH FROM SKU , SKUDEMANDPARAM, SKUDEPLOYMENTPARAM, SKUEFFINVENTORYPARAM, SKUPLANNINGPARAM, SKUSAFETYSTOCKPARAM, SKUPERISHABLEPARAM, SS, SKUIOPARAM, SKUEFFIOPARAM, STORAGEREQUIREMENT, SSPRESENTATION  WHERE SKU.ITEM =SKUDEMANDPARAM.ITEM AND SKU.LOC = SKUDEMANDPARAM.LOC AND SKU.ITEM = SKUDEPLOYMENTPARAM.ITEM AND SKU.LOC = SKUDEPLOYMENTPARAM.LOC AND SKU.ITEM = SKUEFFINVENTORYPARAM.ITEM AND SKU.LOC = SKUEFFINVENTORYPARAM.LOC AND SKU.ITEM = SKUPLANNINGPARAM.ITEM AND SKU.LOC = SKUPLANNINGPARAM.LOC AND SKU.ITEM = SKUSAFETYSTOCKPARAM.ITEM AND SKU.LOC = SKUSAFETYSTOCKPARAM.LOC AND SKU.ITEM = SKUPERISHABLEPARAM.ITEM AND SKU.LOC = SKUPERISHABLEPARAM.LOC AND SKU.ITEM = SS.ITEM AND SKU.LOC = SS.LOC AND SKU.ITEM = SKUIOPARAM.ITEM AND SKU.LOC = SKUIOPARAM.LOC AND SKU.ITEM = SKUEFFIOPARAM.ITEM AND SKU.LOC = SKUEFFIOPARAM.LOC AND SKU.ITEM = STORAGEREQUIREMENT.ITEM AND SKU.LOC = STORAGEREQUIREMENT.LOC AND SKU.ITEM = SSPRESENTATION.ITEM AND SKU.LOC = SSPRESENTATION.LOC" ++ " AND " ++ vars.filterCondition
else	
	"SELECT  SKU.*, SKUDEMANDPARAM.INDDMDUNITCOST,SKUDEMANDPARAM.PRICECAL ,SKUDEMANDPARAM.INDDMDUNITMARGIN,SKUDEMANDPARAM.UNITCARCOST,SKUDEMANDPARAM.UNITPRICE,SKUDEMANDPARAM.DMDTODATE, SKUDEPLOYMENTPARAM.INITSTKOUTCOST,SKUDEPLOYMENTPARAM.SURPLUSRESTOCKCOST, SKUEFFINVENTORYPARAM.MAXOHQTY, SKUEFFINVENTORYPARAM.MINSSQTY,SKUEFFINVENTORYPARAM.SSCOVDUR,SKUEFFINVENTORYPARAM.EFF AS EFFINV_EFF,SKUEFFINVENTORYPARAM.MAXCOVDUR,SKUPLANNINGPARAM.USEWIPSW,SKUPLANNINGPARAM.BUFFERLEADTIME,SKUPLANNINGPARAM.DRPFRZDUR,SKUPLANNINGPARAM.HOLDINGCOST AS PLANPARAM_HOLDINGCOST,SKUPLANNINGPARAM.INCDRPQTY,SKUPLANNINGPARAM.INCMPSQTY,SKUPLANNINGPARAM.INHANDLINGCOST,SKUPLANNINGPARAM.MAXOH AS PLANPARAM_MAXOH,SKUPLANNINGPARAM.MFGFRZDUR,SKUPLANNINGPARAM.MFGLEADTIME,SKUPLANNINGPARAM.MINDRPQTY,SKUPLANNINGPARAM.MINMPSQTY,SKUPLANNINGPARAM.OUTHANDLINGCOST,SKUPLANNINGPARAM.SHRINKAGEFACTOR,SKUPLANNINGPARAM.MPSCOVDUR,SKUPLANNINGPARAM.ORDERINGCOST,SKUPLANNINGPARAM.DRPCOVDUR, SKUSAFETYSTOCKPARAM.MAXSS AS SSPARAM_MAXSS,SKUSAFETYSTOCKPARAM.MINSS,SKUSAFETYSTOCKPARAM.SSCOV,SKUSAFETYSTOCKPARAM.STATSSCSL,SKUSAFETYSTOCKPARAM.ACCUMDUR,SKUSAFETYSTOCKPARAM.AVGLEADTIME,SKUSAFETYSTOCKPARAM.SSRULE,SKUPERISHABLEPARAM.MINSHELFLIFEDUR,SKUPERISHABLEPARAM.MINSHIPSHELFLIFEDUR,SKUPERISHABLEPARAM.SHELFLIFEDUR,SKUPERISHABLEPARAM.MAXSHELFLIFEDUR,SS.EFF AS SS_EFF,SS.QTY,SS.DMDGROUP,SKUIOPARAM.AVGRQSNSIZE,SKUIOPARAM.GROUPNAME,SKUIOPARAM.NUMRQSN,SKUIOPARAM.REVIEWGROUP,SKUIOPARAM.SENSITIVITYPROFILE,SKUEFFIOPARAM.UNITCOST,SKUEFFIOPARAM.STOCKOUTPENALTY,SKUEFFIOPARAM.REVIEWPERIOD,SKUEFFIOPARAM.REPLENPOLICY,SKUEFFIOPARAM.OVERSTOCKPENALTY,SKUEFFIOPARAM.ORDERCOST,SKUEFFIOPARAM.MINREORDERQTY,SKUEFFIOPARAM.MAXREORDERQTY,SKUEFFIOPARAM.IOSERVICEPROFILE,SKUEFFIOPARAM.HOLDINGCOST AS EFFIO_HOLDINGCOST,SKUEFFIOPARAM.HANDLINGCOST,SKUEFFIOPARAM.EVENTTYPE,SKUEFFIOPARAM.ENDOFLIFEDMD,SKUEFFIOPARAM.EFF AS EFFIO_EFF,SKUEFFIOPARAM.COEFFVAR,SKUEFFIOPARAM.BACKORDERPENALTY,STORAGEREQUIREMENT.RES,STORAGEREQUIREMENT.ENABLEOPT AS REQ_ENABLEOPT,SSPRESENTATION.EFF AS SSPR_EFF,SSPRESENTATION.DISC,SSPRESENTATION.PRESENTATIONQTY,SSPRESENTATION.DISPLAYQTY,SSPRESENTATION.MAXSS AS SSPR_MAXSS,SSPRESENTATION.MAXOH AS SSPR_MAXOH FROM SKU , SKUDEMANDPARAM, SKUDEPLOYMENTPARAM, SKUEFFINVENTORYPARAM, SKUPLANNINGPARAM, SKUSAFETYSTOCKPARAM, SKUPERISHABLEPARAM, SS, SKUIOPARAM, SKUEFFIOPARAM, STORAGEREQUIREMENT, SSPRESENTATION  WHERE SKU.ITEM =SKUDEMANDPARAM.ITEM AND SKU.LOC = SKUDEMANDPARAM.LOC AND SKU.ITEM = SKUDEPLOYMENTPARAM.ITEM AND SKU.LOC = SKUDEPLOYMENTPARAM.LOC AND SKU.ITEM = SKUEFFINVENTORYPARAM.ITEM AND SKU.LOC = SKUEFFINVENTORYPARAM.LOC AND SKU.ITEM = SKUPLANNINGPARAM.ITEM AND SKU.LOC = SKUPLANNINGPARAM.LOC AND SKU.ITEM = SKUSAFETYSTOCKPARAM.ITEM AND SKU.LOC = SKUSAFETYSTOCKPARAM.LOC AND SKU.ITEM = SKUPERISHABLEPARAM.ITEM AND SKU.LOC = SKUPERISHABLEPARAM.LOC AND SKU.ITEM = SS.ITEM AND SKU.LOC = SS.LOC AND SKU.ITEM = SKUIOPARAM.ITEM AND SKU.LOC = SKUIOPARAM.LOC AND SKU.ITEM = SKUEFFIOPARAM.ITEM AND SKU.LOC = SKUEFFIOPARAM.LOC AND SKU.ITEM = STORAGEREQUIREMENT.ITEM AND SKU.LOC = STORAGEREQUIREMENT.LOC AND SKU.ITEM = SSPRESENTATION.ITEM AND SKU.LOC = SSPRESENTATION.LOC"
