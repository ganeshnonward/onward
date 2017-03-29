package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class AdvColsController_Touch extends AssetController {

	public void advColsListTouch() {
		
			List <Map> advColsList = newRecommendationReader()
										.forSite(variables.site)
										.useAssetReaderForType("AVIArticle",newAssetReader().selectAll(true))
										.useAssetReaderForType("AVIImage",newAssetReader().select("name,alternateText,mimetype,height"))
										.readRecommendations("Running Recommendation")
										
			models.put("advColsList", advColsList)
						
			int totalTouch = advColsList.size()
			int nbItemsTouch = (totalTouch % 2==0 ? totalTouch/2 : totalTouch/2+1)
			
			models.put("totalTouch", totalTouch)
			models.put("nbItemsTouch", nbItemsTouch)
			
			int i = 0
			
			//This should not be editable template fragment
			Fragment mainSummaryAdvColsProtoTouch = newEditableTemplateFragment().useTemplate("Summary")
	
			//TO-DO fragmentList with Template Fragment
			List <Fragment> mainSummaryAdvColsListTouch = newFragmentList(totalTouch, mainSummaryAdvColsProtoTouch)
			
			for (Fragment each : mainSummaryAdvColsListTouch) {
					each.forAsset(advColsList[i].assetType, advColsList[i].assetId)
					i++
				
			}
			
			models.put("mainListTouch", mainSummaryAdvColsListTouch)
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		advColsListTouch()
	}
}
