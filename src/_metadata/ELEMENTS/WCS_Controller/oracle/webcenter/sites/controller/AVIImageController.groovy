package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class AVIImageController extends BaseController {

	public void aviImageSummaryLarge() {
		TemplateFragment<?> aviImageSummaryLarge = newTemplateFragment()
													.useTemplate("Summary")
													.useArguments("c","cid","thumbnail-field")
													.useStyle(Fragment.Style.ELEMENT)

		models.put("aviImageSummaryLarge", aviImageSummaryLarge)
	}
	
	public void aviImageSummaryMedium() {
		TemplateFragment<?> aviImageSummaryMedium = newTemplateFragment()
													.useTemplate("Summary")
													.useArguments("c","cid","thumbnail-field")
													.useStyle(Fragment.Style.ELEMENT)

		models.put("aviImageSummaryMedium", aviImageSummaryMedium)
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		// Controller code
		aviImageSummaryLarge()
		aviImageSummaryMedium()
		
		
	}
}
