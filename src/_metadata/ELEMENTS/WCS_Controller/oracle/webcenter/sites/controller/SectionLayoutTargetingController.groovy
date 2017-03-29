package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class SectionLayoutTargetingController extends UtilityController {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		
		//Fragment for recommendation 
		def recommendationCid = models.asset.recommendation.id
			
		Fragment recommendationFragment = newEditableTemplateFragment()
											.forAsset("AdvCols", recommendationCid)
											.useTemplate("Detail")
											.setSlotname("RecSlot")
											.editField("recommendation")
		models.put("recommendation", recommendationFragment)

	}
}
