package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController_Touch;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class HomeLayoutController_Touch extends UtilityController_Touch {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)

		Fragment bannerHomeLayoutTouchFragment = newTemplateFragment().useArguments("c","cid","d")
		
		if(variables.pagename.equals("avisports/Page/HomeLayout_Touch")) {
					bannerHomeLayoutTouchFragment.useTemplate("Banner/Home")
		} else {
					bannerHomeLayoutTouchFragment.useTemplate("Banner/Home2")
		}
		models.put("bannerHomeLayoutTouch", bannerHomeLayoutTouchFragment)
		

		Fragment detailHomeLayoutTouchFragment = newTemplateFragment().useArguments("c","cid","d")
		if(variables.pagename.equals("avisports/Page/HomeLayout_Touch")) {
					detailHomeLayoutTouchFragment.useTemplate("Detail/Home2")
		} else {
					detailHomeLayoutTouchFragment.useTemplate("Detail/Home")
		}							
								
		models.put("detailHomeLayoutTouch", detailHomeLayoutTouchFragment)
		
	}
}
