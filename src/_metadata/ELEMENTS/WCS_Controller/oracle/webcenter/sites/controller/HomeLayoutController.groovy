package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class HomeLayoutController extends UtilityController {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		
		//Check the pagename and accordingly set the template in Fragment   
		
		Fragment bannerHomeLayoutFragment = models.getAt("bannerHomeLayoutPrototypeFragment")
		
		if(variables.pagename.equals("avisports/Page/HomeLayout")) {
					
			bannerHomeLayoutFragment.useTemplate("Banner/Home")
		
		} else {
		
			bannerHomeLayoutFragment.useTemplate("Banner/Home2")
		
		}
		
		models.put("bannerHomeLayout", bannerHomeLayoutFragment)
		
		Fragment detailFragment = newTemplateFragment()
									.useTemplate("Detail/Home")
									.useArguments("c","cid")
									.useStyle(Fragment.Style.ELEMENT)
		models.put("detail", detailFragment)
				
	}
}
