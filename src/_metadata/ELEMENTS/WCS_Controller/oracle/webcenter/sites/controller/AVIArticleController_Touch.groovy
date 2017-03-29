package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class AVIArticleController_Touch extends AssetController {

	public void summaryFeatureTouch() {
	
		if(models.asset.relatedImage != null) {
			
			TemplateFragment<?> summaryFeatureTouchFragment = newTemplateFragment()
																.forAsset("AVIImage",models.asset.relatedImage.id)
																.useTemplate("Summary")
																.useStyle(Fragment.Style.PAGELET)
																.useDevice(variables.d)
																.useArguments("thumbnail")
																.resolveDevice(true)
			models.put("summaryFeatureTouch", summaryFeatureTouchFragment)
		}
		
	}
	
	public void summarySideBarTouch() {
	
		if(models.asset.relatedImage != null) {
			
			TemplateFragment<?> summarySideBarTouchFragment = newTemplateFragment()
																.forAsset("AVIImage",models.asset.relatedImage.id)
																.useTemplate("Summary")
																.useStyle(Fragment.Style.EMBEDDED)
																.useDevice(variables.d)
																.addArgument("field","sidebarThumbnail")
																
			models.put("summarySideBarTouch", summarySideBarTouchFragment)
			
			def thumbnail = variables.getAt("thumbnail")
			if(thumbnail != null) {
				models.put("thumbnail", thumbnail)
			} else {
				thumbnail = ""
				models.put("thumbnail", thumbnail)
			}
		}
	
	}
	
	public void summaryLargeTouch() {
	
		TemplateFragment<?> summaryLargeTouchFragment = newTemplateFragment()
														.useTemplate("Summary/Highlight")
														.useArguments("c", "cid", "d")
		models.put("summaryLargeTouch", summaryLargeTouchFragment)
		
		def nblinks = elementCatalogParameters.getAt("nb-links")
		if(nblinks != null) {
			models.put("nblinks", nblinks)
		} else {
			nblinks = ""
			models.put("nblinks", nblinks)
		}
	}
	
	public void summaryLinkTouch() {
	
		TemplateFragment<?> summaryLinkTouchFragment = newTemplateFragment()
														.useTemplate("Summary/Feature")
														.useArguments("c", "cid", "d")
		models.put("summaryLinkTouch", summaryLinkTouchFragment)
	}
	
	public void summaryHighlightTouch() {
		
		//Using AssetController
	}
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		
		summaryFeatureTouch()
		summaryHighlightTouch()
		summarySideBarTouch()
		summaryLargeTouch()
		summaryLinkTouch()
	}
}
