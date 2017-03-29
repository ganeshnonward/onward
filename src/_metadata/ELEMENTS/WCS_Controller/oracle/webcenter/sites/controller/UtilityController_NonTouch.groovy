package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class UtilityController_NonTouch extends BaseController {

	public void assetReader(){
		//
		Map assetMap = newAssetReader()
						.forAsset(getAssetId())
						.selectAll(true)
						.selectImmediateOnlyParents(true)
						.includeLinks(true)
						.includeLinksForBlobs(true)
						.read();

		models.put("asset", assetMap)
	}
	
	public void newNavigationFragment(){
		Fragment navigationFragment = newTemplateFragment()
										.useTemplate("NavBar_NonTouch")
										.useArguments("c", "cid","d")
										.useStyle(Fragment.Style.PAGELET)
		models.put("navBarNonTouch", navigationFragment)
	}
	
	public void headerFragment(){
		Fragment headerFragment = newTemplateFragment()
									.useTemplate("/Head")
									.useArguments("c", "cid", "d")
		models.put("headerNonTouch", headerFragment)
	}
	
	public void footerFragment(){
		Fragment footerFragment = newTemplateFragment().useTemplate("Footer_NonTouch").useArguments("c", "cid", "d")
		models.put("footerNonTouch",footerFragment)
	}
	
	public void bannerFragment() {
		Fragment bannerNonTouchFragment = newTemplateFragment()
											.useTemplate("Banner/Home2")
											.useArguments("c", "cid","d")
		
		models.put("bannerNonTouch", bannerNonTouchFragment)
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {

		// Keep adding utility methods here
		assetReader()
		
		newNavigationFragment()
		
		headerFragment()
		
		footerFragment()
		
		bannerFragment()
		
	}
}
