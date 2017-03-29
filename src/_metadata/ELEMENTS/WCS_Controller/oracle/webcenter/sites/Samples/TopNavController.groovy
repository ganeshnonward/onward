package oracle.webcenter.sites.Samples

import com.fatwire.assetapi.data.*
import com.openmarket.xcelerate.asset.*

public class TopNavController extends BaseController 
{
	@RequiredParams(query="c,cid")
	public void doWork(Map models) 
	{
		// read the site plan for Samples site starting with Home page
		Map assetMap = newNavigationReader()
				.forAssetName("Page", "Home","Samples")
				.getSitePlanAssetNode(false)
				.levelOfChildren(4)
				.allParents(true)
				.useAssetReader(newAssetReader().select("name,navtitle").includeLinks(true))
				.read();
		models.put("asset", assetMap);					
	}
}
