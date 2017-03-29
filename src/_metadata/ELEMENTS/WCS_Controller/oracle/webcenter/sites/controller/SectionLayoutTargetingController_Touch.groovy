package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController_Touch;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class SectionLayoutTargetingController_Touch extends UtilityController_Touch {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		
				Fragment recSlotTouchFragment = newEditableTemplateFragment()
												.useTemplate("Detail")
												.forAsset(models.asset.recommendation.type, models.asset.recommendation.id)
												.setSlotname("RecSlotTouch")
				models.put("recSlotTouch", recSlotTouchFragment)
				
				def bgcolor = elementCatalogParameters.getAt("bg-color")
				if(bgcolor != null) {
					models.put("bgcolorTouch", bgcolor)
				} else {
					bgcolor = ""
					models.put("bgcolorTouch", bgcolor)
				}
	}
}
