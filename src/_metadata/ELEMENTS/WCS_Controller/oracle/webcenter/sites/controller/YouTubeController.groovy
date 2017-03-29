package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class YouTubeController extends BaseController {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		
		TemplateFragment<?> youTubeSummarySideBarFragment = newTemplateFragment()
															.useTemplate("Summary/SideBar")
															.useArguments("c", "cid")
															.useStyle(Fragment.Style.ELEMENT)
		models.put("youTubeSummarySideBar", youTubeSummarySideBarFragment)
	}
	
}
