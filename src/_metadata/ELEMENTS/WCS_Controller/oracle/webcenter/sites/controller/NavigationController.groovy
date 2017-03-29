package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.openmarket.xcelerate.asset.*

public class NavigationController extends BaseController 
{
	@RequiredParams(query="c,cid")
	public void doWork(Map models) 
	{
		// read the site plan 
		Map assetMap = newNavigationReader()
				.forNode(getVariables().get("c"), Long.valueOf(getVariables().get("cid")))
				.getSitePlanAssetNode(true)
				.levelOfChildren(2)
				.allParents(true)
				.useAssetReader(newAssetReader().includeLinks(true))
				.read();
		models.put("asset", assetMap);
	}
}
