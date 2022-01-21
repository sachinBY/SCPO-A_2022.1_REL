%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
(payload map (uomCategoryConvFactor, indexOfUomCategoryConvFactor) -> {
		MS_BULK_REF: uomCategoryConvFactor.MS_BULK_REF,
		MS_REF: uomCategoryConvFactor.MS_REF, 
 		INTEGRATION_STAMP: uomCategoryConvFactor.INTEGRATION_STAMP,
		ITEM: uomCategoryConvFactor.ITEM,
		SOURCECATEGORY: uomCategoryConvFactor.SOURCECATEGORY,
		TARGETCATEGORY: uomCategoryConvFactor.TARGETCATEGORY,
		(vars.deleteudc): 'Y'
  })