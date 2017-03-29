package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class AVIArticleSideBarController extends AssetController {

	public void sideBarRelatedStories() {
		
		EditableTemplateFragment<?> sideBarRelatedStoriesProto = newEditableTemplateFragment()
																	.editField("relatedStories")
																	.useTemplate("Summary/Highlight")
																	.setEmptyText("[ Drop Article Here ]")
																	.setStyles("highlight")
																	
		List<Fragment> sideBarRelatedStoriesList = newFragmentList(4, sideBarRelatedStoriesProto)
		
		def relatedStories = models.asset.relatedStories
		
		int i = 0
		for(Fragment each : sideBarRelatedStoriesList) {
			if(relatedStories != null && i < 2) {
				each.forAsset(relatedStories[i])
			} 
			i++
		}
		models.putAt("sideBarRelatedStoriesProto", sideBarRelatedStoriesProto)
		models.putAt("sideBarRelatedStories", sideBarRelatedStoriesList)
		
	}
	
	public void sideBarRelatedLinks() {
			
		EditableTemplateFragment<?> sideBarRelatedLinksProto = newEditableTemplateFragment()
																	.editField("relatedLinks")
																	.useTemplate("Summary/Link")
																	.setEmptyText("[ Drop Article Here ]")
		
		List<Fragment> sideBarRelatedLinksList = newFragmentList(5, sideBarRelatedLinksProto)
		
		def relatedLinks = models.asset.relatedLinks
		
		int i = 0
		for(Fragment each : sideBarRelatedLinksList) {
			if(relatedLinks != null) {
				each.forAsset(relatedLinks[i])
			}
			i++
		}
		models.putAt("sideBarRelatedLinksProto", sideBarRelatedLinksProto)
		models.putAt("sideBarRelatedLinks", sideBarRelatedLinksList)
	}
	
	public void checkCommunity() {
		
		ElementFragment<?> checkCommunityFragment = newElementFragment().useElement("avisports/checkcommunity")
		models.put("checkCommunity", checkCommunityFragment)
		
		def communityExists = false
		if (variables.community) {
			communityExists = true
		}
		
		models.put("communityExists", communityExists)
	}
	
	public void pollSlot(){
		
		EditableTemplateFragment<?> pollFragment = newEditableTemplateFragment()
													.setSlotname("poll")
													.editField("poll")
													.useTemplate("/CGTemplate")
		
		def pollAsset = models.asset.poll
		
		if(pollAsset != null) {
			pollFragment.forAsset("CGPoll", pollAsset.id)
		} 
		
		models.put("pollFragment", pollFragment)
		
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		checkCommunity()
		sideBarRelatedStories()
		sideBarRelatedLinks()
		pollSlot()
	}
}
