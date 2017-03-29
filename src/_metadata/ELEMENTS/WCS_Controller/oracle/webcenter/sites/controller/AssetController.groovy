package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.openmarket.xcelerate.asset.*
import com.fatwire.assetapi.fragment.Fragment

public class AssetController extends BaseController 
{
	@RequiredParams(query="c,cid")
	public void doWork(Map models) 
	{
		// read asset data and asset links (vanity URLs)
      Map assetMap = newAssetReader()
              .forAsset(getAssetId())
              .selectAll(true)
              .selectImmediateOnlyParents(true)
              .includeLinks(true)
              .includeLinksForBlobs(true)
              .read();
      models.put("asset", assetMap);
	  watch("__assetMap__")
	}
}