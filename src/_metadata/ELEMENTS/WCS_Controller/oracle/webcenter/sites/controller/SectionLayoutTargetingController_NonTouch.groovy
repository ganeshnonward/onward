package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController_NonTouch;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class SectionLayoutTargetingController_NonTouch extends UtilityController_NonTouch {
	//
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		
		Fragment recSlotNonTouchFragment = newEditableTemplateFragment()
											.useTemplate("Detail")
											.forAsset(models.asset.recommendation.type, models.asset.recommendation.id)
											.setSlotname("RecSlotNonTouch")
		
		models.put("recSlotNonTouch", recSlotNonTouchFragment)
		
		def bgcolor = elementCatalogParameters.getAt("bg-color")
		if(bgcolor != null) {
			models.put("bgcolorNonTouch", bgcolor)
		} else {
			bgcolor = ""
			models.put("bgcolorNonTouch", bgcolor)
		}
	}
}
