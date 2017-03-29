package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class AdvColsController_NonTouch extends BaseController {

	public void advColsListNonTouch() {
		
			List <Map> advColsList = newRecommendationReader()
										.forSite(variables.site)
										.useAssetReaderForType("AVIArticle",newAssetReader().selectAll(true))
										.useAssetReaderForType("AVIImage",newAssetReader().select("name,alternateText,mimetype,height"))
										.readRecommendations("Running Recommendation")
										
			models.put("advColsList", advColsList)
			
			int totalNonTouch = advColsList.size()
			int nbItemsNonTouch = (totalNonTouch % 2==0 ? totalNonTouch/2 : totalNonTouch/2+1)
			
			models.put("totalNonTouch", totalNonTouch)
			models.put("nbItemsNonTouch", nbItemsNonTouch)
			
			int i = 0
			
			//This should not be editable template fragment
			Fragment mainSummaryAdvColsProtoNonTouch = newEditableTemplateFragment().useTemplate("Summary/SideBar")
	
			//TO-DO fragmentList with Template Fragment
			List <Fragment> mainSummaryAdvColsListNonTouch = newFragmentList(totalNonTouch, mainSummaryAdvColsProtoNonTouch)
			
			for (Fragment each : mainSummaryAdvColsListNonTouch) {
					each.forAsset(advColsList[i].assetType, advColsList[i].assetId)
					i++
				
			}
			
			models.put("mainListNonTouch", mainSummaryAdvColsListNonTouch)
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		// Controller code
		super.doWork(super.models)
		advColsListNonTouch()
	}
}
