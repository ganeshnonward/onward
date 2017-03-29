package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class AVIArticleController_NonTouch extends AssetController {

	public void summaryFeatureNonTouch() {
		
		TemplateFragment<?> summaryFeatureNonTouchFragment = newTemplateFragment()
																.useTemplate("Summary")
																.useArguments("c", "cid", "d")
		models.put("summaryFeatureNonTouch", summaryFeatureNonTouchFragment)
	}
	
	public void summaryHighlightNonTouch() {
		
		TemplateFragment<?> summaryHighlightNonTouchFragment = newTemplateFragment()
																.useTemplate("Summary")
																.useArguments("c", "cid", "d")
		models.put("summaryHighlightNonTouch", summaryHighlightNonTouchFragment)
		
	}
	
	public void summarySideBarNonTouch() {
		
		TemplateFragment<?> summarySideBarNonTouchFragment = newTemplateFragment()
																.useTemplate("Summary")
																.useArguments("c", "cid", "d")
		models.put("summarySideBarNonTouch", summarySideBarNonTouchFragment)
		
	}
	
	public void summaryLargeNonTouch() {
		
		TemplateFragment<?> summaryLargeNonTouchFragment = newTemplateFragment()
																.useTemplate("Summary")
																.useArguments("c", "cid", "d")
		models.put("summaryLargeNonTouch", summaryLargeNonTouchFragment)
		
		def nblinks = elementCatalogParameters.getAt("nb-links")
		if(nblinks != null) {
			models.put("nblinks", nblinks)
		} else {
			nblinks = ""
			models.put("nblinks", nblinks)
		}
		
	}
	
	public void summaryLinkNonTouch() {
		
	}
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
	
		super.doWork(super.models)
		summaryFeatureNonTouch()
		summaryHighlightNonTouch()
		summarySideBarNonTouch()
		summaryLargeNonTouch()
		summaryLinkNonTouch()
	}
}
