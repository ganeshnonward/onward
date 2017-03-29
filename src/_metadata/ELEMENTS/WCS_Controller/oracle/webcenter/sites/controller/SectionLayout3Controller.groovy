package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController;

import com.fatwire.assetapi.data.*
import com.openmarket.xcelerate.asset.*
import com.fatwire.assetapi.fragment.*

public class SectionLayout3Controller extends UtilityController
{
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		
		super.doWork(super.models)
		
		// create fragment list for Main List summary article(s)
    	def mainListSize = 5
		Fragment mainListEmptySlot = newEditableTemplateFragment()
								    	.useTemplate("Summary")
								    	.setSlotname("SectionLayout3-MainSlot")
										.addLegalTypes("AVIArticle,YouTube")
										.addArgument("p",String.valueOf(models.asset.get("id")))
										.useArguments("site")
								    	.editField("Association-named:contentList1");
		List<Fragment> mainListSlots = newFragmentList(mainListSize,mainListEmptySlot);

		// change the template for the first slot Top Story
    	mainListSlots.get(0).useTemplate("Summary/Large");
        
        def list1 = models.asset.get("Assoc_Named_contentList1");
        def listSize1 = list1.size();
        def size1 = (mainListSize <= listSize1) ? mainListSize : listSize1;

		// fill the fragment list with contentList1 articles
		for(int i = 0 ; i< size1 ;i++){
             def asset = list1.get(i);
             mainListSlots.get(i).forAsset(asset.getType(),asset.getId())
        }
		models.put("mainListSlots", mainListSlots);

		// create fragment list for SideBar List summary article(s)
    	def sidebarListSize = 3
		Fragment sideBarListEmptySlot = newEditableTemplateFragment()
									    	.setSlotname("SectionLayout3-Sidebar")
									    	.editField("Association-named:contentList2")
											.addLegalTypes("AVIArticle,YouTube")
									    	.useTemplate("Summary/SideBar")
											.useArguments("site")
											.addArgument("p",String.valueOf(models.asset.get("id")));
		List<Fragment> sideBarListSlots = newFragmentList(sidebarListSize,sideBarListEmptySlot);
		
		// change the template for the first SideBar article
    	sideBarListSlots.get(0).useTemplate("Summary/Highlight");

		// fill the fragment list with contentList2 articles
        def list2 = models.asset.get("Assoc_Named_contentList2");
		def listSize2 = list2.size();
        def size2 = (sidebarListSize <= listSize2) ? sidebarListSize : listSize2;
        for(int i = 0 ; i< size2 ;i++){
             def asset = list2.get(i);
             sideBarListSlots.get(i).forAsset(asset.getType(),asset.getId())
        }
		models.put("sideBarListSlots", sideBarListSlots);
		
	}
}
