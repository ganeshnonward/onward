package oracle.webcenter.sites.controller

import java.util.Map;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.fatwire.assetapi.site.NavigationReader;
import com.openmarket.xcelerate.asset.*

public class NavBarController extends BaseController {
	@RequiredParams(query="c,cid")
	public void suffixBasedNavigation(String suffix){
		for (c in models.nav.children){
				if(c.name == suffix) {
					models.put("suffixBasedNavigation", c.children)
				}
			}
			 
	}

	public void  footerLink(String footerSuffix, LinkInfo<?> linkInfo) {
		
		String suffix = footerSuffix
		Map footerLinkMap = [:]
		
		NavigationReader footerLink = newNavigationReader()
										.forSite("avisports")
										.getSitePlanAssetNode(true)
										.levelOfChildren(5)
										.allParents(true)
						
		if ("Default".equals(suffix)) {

			linkInfo.forDevice("Touch")
			footerLinkMap = footerLink.useAssetReader("Page",null,newAssetReader().select("name, banner.(*) as BANNER_IMAGE").includeLinks(true).includeLinksForBlobs(true)
							.addAssetLinkInfo(linkInfo))
							.read()
		} else {
			footerLinkMap = footerLink.useAssetReader("Page",null,newAssetReader().select("name, banner.(*) as BANNER_IMAGE").includeLinks(true).includeLinksForBlobs(true))
							.read()
		}				
		
		for (c in footerLinkMap.children){
				if(c.name == suffix) {
					models.put("footerLink", c.children[0]._link_)
				}
		}
	}
	public void doWork(Map models)
	{
		
		LinkInfo<?> linkInfo = newAssetLinkInfo().forType(variables.c)
		
		if(variables.d!=null){ 
			linkInfo.forDevice(variables.d)
		}
		
		// read the site plan
		Map navMap = newNavigationReader()
				.forSite("avisports")
				.getSitePlanAssetNode(true)
				.levelOfChildren(5)
				.allParents(true)
				.useAssetReader("Page",null,newAssetReader().select("name, banner.(*) as BANNER_IMAGE").includeLinks(true).includeLinksForBlobs(true).addAssetLinkInfo(linkInfo))
				.read();
		models.put("nav", navMap);
		
		def navSuffix = variables.d
		//Assign Default siteplan if suffix is blank string or a null
		suffixBasedNavigation(navSuffix == null || "".equals(navSuffix) ? "Default" : navSuffix)
		footerLink(navSuffix == null || "".equals(navSuffix) ? "Default" : navSuffix, linkInfo)
	}

}
