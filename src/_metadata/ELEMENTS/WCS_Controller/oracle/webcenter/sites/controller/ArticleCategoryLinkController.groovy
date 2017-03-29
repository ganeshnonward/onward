package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class ArticleCategoryLinkController extends AssetController {

	def pageMap = [:]

	public void suffixBasedNavigation(String suffix, AssetId aTypeId){
		for (c in pageMap.children){
			if(c.name == suffix) {
				for(pg in c.children) {
					for(ch in pg.children) {
						//We match the tag attribute with AssetId of ArticleCategory.
						//Match idicates that we found parent page of that ArticleCategory
						//There is no suffix based site plan for Unplaced pages. 
						//Hence, if there is no match the page is Unplaced and we have to look for the Unplaced pages and match the tag attribute. 
						if(ch.tag.equals(aTypeId)) {
							models.put("pageMap", ch)
						} else {
							for (upc in pageMap.children){
								if(upc.ncode.equalsIgnoreCase("Unplaced") && upc.tag.equals(aTypeId)) {
									models.put("pageMap", upc)
								}
							}
						
						}
					}
				}
			}
		}
	}

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		
		AssetId aTypeId = getAssetId()
		
		// read the site plan
		pageMap = newNavigationReader()
				.forSite("avisports")
				.getSitePlanAssetNode(true)
				.levelOfChildren(5)
				.allParents(true)
				.useAssetReader(newAssetReader().selectAll(true).includeLinks(true).includeLinksForBlobs(true))
				.read();
					
		def navSuffix = variables.d
		//Assign Default siteplan if suffix is blank string or a null
		suffixBasedNavigation(navSuffix == null || "".equals(navSuffix) ? "Default" : navSuffix, aTypeId)
		
	}
}
