package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController_NonTouch;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class HomeLayoutController_NonTouch extends UtilityController_NonTouch {
	//
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		
		Fragment bannerHomeLayoutNonTouchFragment = newTemplateFragment().useArguments("c","cid","d")
		
		if(variables.pagename.equals("avisports/Page/HomeLayout_NonTouch")) {
					bannerHomeLayoutNonTouchFragment.useTemplate("Banner/Home")
		} else {
					bannerHomeLayoutNonTouchFragment.useTemplate("Banner/Home2")
		}

		models.put("bannerHomeLayoutNonTouch", bannerHomeLayoutNonTouchFragment)
		

		Fragment detailHomeLayoutNonTouchFragment = newTemplateFragment().useArguments("c","cid","d")
		if(variables.pagename.equals("avisports/Page/HomeLayout_NonTouch")) {
					detailHomeLayoutNonTouchFragment.useTemplate("Detail/Home2")
		} else {
					detailHomeLayoutNonTouchFragment.useTemplate("Detail/Home")
		}							
								
		models.put("detailHomeLayoutNonTouch", detailHomeLayoutNonTouchFragment)
	}
}
