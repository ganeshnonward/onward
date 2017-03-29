package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.data.search.Searcher;
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class UtilityController extends BaseController {
	
	public void assetReader(){
		
		Map assetMap = newAssetReader()
						.forAsset(getAssetId())
						.selectAll(true)
						.selectImmediateOnlyParents(true)
						.includeLinks(true)
						.includeLinksForBlobs(true)
						.read();

		models.put("asset", assetMap)
	}
		
	public void headerFragment(){
		Fragment headerFragment = newTemplateFragment()
									.useTemplate("/Head")
									.useArguments("c", "cid")
									.useStyle(Fragment.Style.ELEMENT)
		models.put("header", headerFragment)
	}
	
	public void footerFragment(){
		Fragment footerFragment = newTemplateFragment().useTemplate("Footer").useArguments("c", "cid", "d")
		models.put("footer",footerFragment)
	}
	
	public void bannerFragment(){
		
		def bannerId
		def bannerType
		
		Fragment bannerFragment = newEditableTemplateFragment()
									.useTemplate("Detail")
									.editField("banner")
		
		if(null != models.asset.get("banner")) {
			
			bannerId = models.asset.get("banner").getAt("id")
			bannerType = models.asset.get("banner").getAt("type")
			bannerFragment.forAsset(bannerType,bannerId).setStyles("aviSectionBanner");
		}

		models.put("banner", bannerFragment)
	}
	
	public void newNavigationFragment(){
		
		Fragment navigationFragment = newTemplateFragment()
										.useTemplate("NavBar")
										.useArguments("c", "cid")
										.useStyle(Fragment.Style.PAGELET)
		models.put("navBar", navigationFragment)		
	}
	
	//Prototype Fragment for Home page layouts 
	public void homeLayoutBanner(){
		
		Fragment bannerHomeLayoutPrototypeFragment = newTemplateFragment()
														.useArguments("c","cid")
														.useStyle(Fragment.Style.ELEMENT)
		models.put("bannerHomeLayoutPrototypeFragment", bannerHomeLayoutPrototypeFragment)
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		// Keep adding utility methods here 
				
		assetReader()
		
		headerFragment()
		
		newNavigationFragment()
		
		bannerFragment()
		
		homeLayoutBanner()
		
		footerFragment()
		
	}
}
