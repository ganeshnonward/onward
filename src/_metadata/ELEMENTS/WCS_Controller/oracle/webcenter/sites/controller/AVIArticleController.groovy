package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class AVIArticleController extends AssetController {

	
	public void summaryFeature(){
		if(models.asset.relatedImage!=null){
			
			TemplateFragment<?> summaryFeatureFragment = newTemplateFragment()
														.forAsset("AVIImage",models.asset.relatedImage.id)
														.useTemplate("Summary/Large")
														.useStyle(Fragment.Style.ELEMENT)
			models.put("summaryFeature", summaryFeatureFragment)
		}
	}
	
	public void summaryHighlight(){
		if(models.asset.relatedImage!=null){
		
			TemplateFragment<?> summaryHighlightFragment = newTemplateFragment()
															.forAsset(models.asset.relatedImage.type, models.asset.relatedImage.id)
															.useTemplate("Summary/Medium")
															.useStyle(Fragment.Style.ELEMENT)
			models.put("summaryHighlight", summaryHighlightFragment)
		}
	}
	
	public void summaryLarge() {
		
		if(models.asset.relatedImage!=null){
			
			TemplateFragment<?> summaryLargeFragment = newTemplateFragment()
														.forAsset("AVIImage",models.asset.relatedImage.id)
														.useTemplate("Summary/Large")
														.useStyle(Fragment.Style.ELEMENT)
			models.put("summaryLarge", summaryLargeFragment)
		}
		
		int nblinks = 0
		nblinks = Integer.parseInt(elementCatalogParameters.getAt("nb-links"))
		
		int relatedStoriesSize = 0
		if(models.asset.relatedStories != null) {
			relatedStoriesSize = models.asset.relatedStories.size()
		}
		// This ensures we dont overflow
		if(nblinks > relatedStoriesSize) {
			nblinks = relatedStoriesSize
		}
		
		models.put("nblinks", nblinks)
		
		EditableTemplateFragment<?> summaryLargeLinkFragmentProto = newEditableTemplateFragment()
																	.useTemplate("Link")
																	.useStyle(Fragment.Style.ELEMENT)
		
		List <Fragment>  summaryLargeLinkFragmentList  = newFragmentList(relatedStoriesSize, summaryLargeLinkFragmentProto)
		int i = 0
		for(Fragment each : summaryLargeLinkFragmentList) {
			if(models.asset.relatedStories[i] != null) {
				each.forAsset("AVIArticle", models.asset.relatedStories[i].id)
				i++	
			} 
			else {
			
				i++
			}
		}
		models.put("summaryLargeLink", summaryLargeLinkFragmentList)											
	}
	
	public void summaryLink(){
		
	}
	
	public void summarySideBar(){
		
		TemplateFragment<?> summaryAVIImageFragment = newTemplateFragment()
														.forAsset("AVIImage", models.asset.relatedImage.id)
														.useTemplate("Summary")
														.useStyle(Fragment.Style.ELEMENT)
		
		models.put("summaryAVIImage", summaryAVIImageFragment)
		
		int relatedStoriesSize = 0
		
		if(models.asset.relatedStories != null) {
			relatedStoriesSize = models.asset.relatedStories.size()
		}
		
		models.put("relatedStoriesCount", relatedStoriesSize)
		// Change to TemplateFragment as we really do not need anything editable here
		EditableTemplateFragment<?> summaryAVIArticleLinkFragmentProto = newEditableTemplateFragment().useTemplate("Link").useStyle(Fragment.Style.ELEMENT)
		
		List <Fragment> summaryAVIArticleLinkFragmentList = newFragmentList(relatedStoriesSize, summaryAVIArticleLinkFragmentProto)
		
		int i = 0
		for(Fragment each : summaryAVIArticleLinkFragmentList) {
			each.forAsset("AVIArticle", models.asset.relatedStories[i].id)
			i++
		}
		models.put("summaryAVIArticleLink", summaryAVIArticleLinkFragmentList)
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		if(variables.pagename.equals("avisports/AVIArticle/Summary/Feature")){
			summaryFeature()
		}
		
		if(variables.pagename.equals("avisports/AVIArticle/Summary/Highlight")) {
			summaryHighlight()
		}
		
		if(variables.pagename.equals("avisports/AVIArticle/Summary/Large")) {
			summaryLarge()
		}
		if(variables.pagename.equals("avisports/AVIArticle/Summary/Link")){
			summaryLink()
		}
		
		if(variables.pagename.equals("avisports/AVIArticle/Summary/SideBar")) {
			summarySideBar()
		}

	}
}
