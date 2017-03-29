package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class UtilityController_Touch extends BaseController {

	public void assetReader(){
		
		Map assetMap = newAssetReader()
						.forAsset(getAssetId())
						.selectAll(true)
						.selectImmediateOnlyParents(true)
						.includeLinks(true)
						.includeLinksForBlobs(true)
						.read();

		models.put("asset", assetMap)
	}
	
	public void newNavigationFragment(){

		Fragment navigationFragment = newTemplateFragment()
										.useTemplate("NavBar_Touch")
										.useArguments("c", "cid","d")
										.useStyle(Fragment.Style.PAGELET)
		models.put("navBarTouch", navigationFragment)
	}
	
	public void headerFragment(){
		Fragment headerFragment = newTemplateFragment()
									.useTemplate("/Head")
									.useArguments("c", "cid", "d")
		models.put("header", headerFragment)
	}
	
	public void footerFragment(){
		Fragment footerFragment = newTemplateFragment().useTemplate("Footer_Touch").useArguments("c", "cid", "d")
		models.put("footerTouch",footerFragment)
	}
	
	public void bannerFragment() {
		Fragment bannerHomeTouchFragment = newTemplateFragment()
											.useTemplate("Banner/Home2")
											.useArguments("c", "cid","d")
		
		models.put("bannerHomeTouch", bannerHomeTouchFragment)
	}
	
	// Fragments for SectionLayoutController_Touch, SectionLayout3_Touch
	
	public void commonContentList1Fragments() {
		//
		int contentListSize = 0
		if(models.asset.Assoc_Named_contentList1 != null) {
			contentListSize = models.asset.Assoc_Named_contentList1.size()
		}
		EditableTemplateFragment<?> contentList1TouchProto = newEditableTemplateFragment().addLegalTypes("AVIArticle")
		List<Fragment> mainListTouchSlots = FragmentFactory.newFragmentList(contentListSize, contentList1TouchProto);
				
		// change the template for the first Main summary article
			
		def templateName
		if(variables.pagename.equals("avisports/Page/SectionLayout3_Touch")) {
			templateName = "Summary/Highlight"
		} else {
			templateName = "Summary/SideBar"
		}
		def j = 0
		for(EditableTemplateFragment<?> each : mainListTouchSlots) {
			if (j == 0){
	
				each.forAsset(models.asset.Assoc_Named_contentList1[j].type, models.asset.Assoc_Named_contentList1[j].id)
					.useTemplate("Summary/Feature")
					.setTitle("Main List - Top Story")
					.setEmptyText("Drop Article &#35;"+j)
					.editField("Association-named:contentList1",j+1)
					
					j++
					
			} else {
				each.forAsset(models.asset.Assoc_Named_contentList1[j].type, models.asset.Assoc_Named_contentList1[j].id)
					.useTemplate(templateName)
					.setTitle("Main List - Content &#35;"+ (j+1))
					.setEmptyText("Drop Article &#35;"+(j+1))
					.editField("Association-named:contentList1",(j+1))
					
				j++
			}
		}
			
		models.put("mainListTouchSlots",mainListTouchSlots)
	
		//Draw upto 4 empty slots.
		List<Fragment> emptyListTouchSlots = FragmentFactory.newFragmentList(4, contentList1TouchProto);
		
		for(EditableTemplateFragment<?> each : emptyListTouchSlots) {
			def associatedAsset = null
			if(models.asset.Assoc_Named_contentList1 != null) {
				associatedAsset = models.asset.Assoc_Named_contentList1[j]
			}
			
			//Check if slot is filled
			if (associatedAsset !=null){
	
				each.forAsset(models.asset.Assoc_Named_contentList1[j].type, models.asset.Assoc_Named_contentList1[j].id)
			}

			each.useTemplate("Summary/SideBar")
				.setTitle("Main List - Content &#35;"+ (j+1))
				.setEmptyText("Drop Article &#35;"+(j+1))
				.editField("Association-named:contentList1",(j+1))
					
				j++
		}

		models.put("emptyListTouchSlots",emptyListTouchSlots)

	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		// Keep adding utility methods here
		assetReader()
		
		newNavigationFragment()
		
		headerFragment()
		
		footerFragment()
		
		bannerFragment()
		
		def isTemplateNotAllowed = models.asset.template.matches("SectionLayoutTargeting|HomeLayout1|HomeLayout")
		
		if(isTemplateNotAllowed == false) {	
			commonContentList1Fragments()
		}
	}
}
