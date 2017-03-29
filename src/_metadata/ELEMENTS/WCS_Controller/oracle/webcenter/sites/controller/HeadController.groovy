package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class HeadController extends AssetController {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		
		def title = ""
		def description = ""
		
		if(variables.c.equals("Page")) {
			if(models.asset.metaTitle != null && models.asset.metaDescription!= null) {
				title = models.asset.metaTitle
				description = models.asset.metaDescription
			}
		}
		
		if(variables.c.equals("AVIArticle")) {
			if(models.asset.headline !=null && models.asset.subheadline !=null) {
				title = models.asset.headline
				description = models.asset.subheadline
			}
		}

		models.put("title", title)
		models.put("description", description)
		
	}
}
