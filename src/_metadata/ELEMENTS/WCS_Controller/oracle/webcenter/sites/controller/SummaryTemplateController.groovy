package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class SummaryTemplateController extends AssetController {

	public void summaryFeatureFragment(){
		
		if(models.asset.relatedImage!=null){

			TemplateFragment<?> summaryFeatureFragment = newTemplateFragment().forAsset("AVIImage",models.asset.relatedImage.id)
																.useTemplate("Summary/Large")
																.useStyle(Fragment.Style.ELEMENT)
			models.put("summaryFeature", summaryFeatureFragment)
		}
	}
	
	public void summaryAVIArticleFragment(){
		
		if(models.asset.relatedImage!=null){
			
			TemplateFragment<?> summaryAVIArticleFragment = newTemplateFragment().forAsset("AVIImage",models.asset.relatedImage.id)
																.useTemplate("Summary")
																.useStyle(Fragment.Style.ELEMENT)
																.useArguments("thumbnail")
			models.put("summaryAVIArticle", summaryAVIArticleFragment)
		}
	}
	
	public void summaryTouch(){
		
		TemplateFragment<?> summaryTouchFragment = newTemplateFragment()
													.useTemplate("Summary")
													.forAsset("AVIImage",models.asset.relatedImage.id)
													.useDevice(variables.d)
													.useStyle(Fragment.Style.PAGELET)
		models.put("summaryTouch", summaryTouchFragment)
		
		def thumbnail = variables.getAt("thumbnail")
		if(thumbnail != null) {
			models.put("thumbnail", thumbnail)
		} 
		else { 
			thumbnail = ""
			models.put("thumbnail", thumbnail)
		}
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		// Controller code
		super.doWork(super.models)
		
		summaryFeatureFragment()
		
		summaryAVIArticleFragment()
		
		summaryTouch()
	}
}
