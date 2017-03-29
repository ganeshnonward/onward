package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

import groovy.json.JsonOutput

public class AdvColsController extends AssetController {

	
	public void summaryFeature(){
		if(models.asset.relatedImage!=null){
			
			println "AVIArticleController relatedImageId " + models.asset.relatedImage.id
			
			TemplateFragment<?> summaryFeatureFragment = newTemplateFragment()
														.forAsset("AVIImage",models.asset.relatedImage.id)
														.useTemplate("Summary/Large")
														.useStyle(Fragment.Style.ELEMENT)
			models.put("summaryFeature", summaryFeatureFragment)
		}
	}
	
	//Query for AdvCols table
	
	public void advColsList() {
	
		List <Map> advColsList = newRecommendationReader()
									.forSite(variables.site)
                                                                        .forProfile("VisitorNameAggregationTemplate")
									.useAssetReaderForType("AVIArticle",newAssetReader().selectAll(true))
									.useAssetReaderForType("AVIImage",newAssetReader().select("name,alternateText,mimetype,height"))
									.readRecommendations("Running Recommendation")
									
		models.put("advColsList", advColsList)
		
		int total = advColsList.size()
		//int nbItems = (total % 2==0 ? total/2 : total/2+1)
		
		models.put("total", total)
		//models.put("nbItems", nbItems)
		
		int i = 0
		
		Fragment main1AdvCols = newTemplateFragment().useTemplate("Summary/Feature").forAsset(advColsList[i].assetType, advColsList[i].assetId)
		models.put("main1", main1AdvCols)
		i++
		
		Fragment main2AdvCols = newTemplateFragment().useTemplate("Summary/Feature").forAsset(advColsList[i].assetType, advColsList[i].assetId)
		models.put("main2", main2AdvCols)
		i++
		
		//This should not be editable template fragment
		Fragment mainSummaryAdvColsProto = newEditableTemplateFragment().useTemplate("Summary")

		//TO-DO fragmentList with Template Fragment
		//List <Fragment> mainSummaryAdvColsList = new ArrayList<Fragment>(total)
		List <Fragment> mainSummaryAdvColsList = newFragmentList(total-2, mainSummaryAdvColsProto)
		
		for (Fragment each : mainSummaryAdvColsList) {		
				each.forAsset(advColsList[i].assetType, advColsList[i].assetId)
				i++
			
		}
		
		int mainListSize = mainSummaryAdvColsList.size()
		int nbItems =  (mainListSize % 2==0 ? mainListSize/2 : mainListSize/2+1)
		
		models.put("mainList", mainSummaryAdvColsList)
		models.put("mainListSize", mainListSize)
		models.put("nbItems", nbItems)
		
		
		if(variables.ArticleName != null) {
			models.put("articleName", variables.ArticleName)
		}
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		// Controller code
		super.doWork(super.models)
		//summaryFeature()
		advColsList()
	}
}
