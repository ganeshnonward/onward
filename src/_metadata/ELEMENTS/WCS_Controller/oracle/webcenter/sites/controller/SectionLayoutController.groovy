package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController;

import com.fatwire.assetapi.data.*
import com.openmarket.xcelerate.asset.*
import com.fatwire.assetapi.fragment.*

public class SectionLayoutController extends UtilityController {
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) 
	{
		super.doWork(super.models)
	
		//Prototype for Surfing and Tennis page
		Fragment articleEmptySlotFragmentProto = newEditableTemplateFragment()
													.addLegalTypes("AVIArticle,YouTube")
													.useTemplate("Summary")
													.setVariant("Summary.*")
													.useArguments("site");
									
		def contentList1Size = 5
		List<Fragment> mainListSlots = newFragmentList(contentList1Size,articleEmptySlotFragmentProto);
		
		def j = 1
		for(EditableTemplateFragment<?> each : mainListSlots) {
			if(j == 1) {
				each.useTemplate("Summary/Feature").addArgument("p",String.valueOf(models.asset.get("id")))
			}
			
			if (models.asset.Assoc_Named_contentList1 !=null){
				each.forAsset(models.asset.Assoc_Named_contentList1[j - 1])
			}
			each
				.editField("Association-named:contentList1", j)
				.setSlotname("SectionLayoutSlotLeft")
				.editField("Association-named:contentList1")
			j++
		}
		models.put("mainListSlots", mainListSlots);

		
		def contentList2Size = 5
		List<Fragment> secondaryListSlots = newFragmentList(contentList2Size,articleEmptySlotFragmentProto);
		
		def k = 1
		for(EditableTemplateFragment<?> each : secondaryListSlots) {
			
			if(k == 1 && variables.pagename.equals("avisports/Page/SectionLayoutOrange")){
				each.useTemplate("Summary/Feature").addArgument("p",String.valueOf(models.asset.get("id")))
			}
			
			if (models.asset.Assoc_Named_contentList2 !=null){
				each.forAsset(models.asset.Assoc_Named_contentList2[k - 1])
			}
			each
				.editField("Association-named:contentList2", k)
				.setSlotname("SectionLayoutSlotRight")
				.editField("Association-named:contentList2")
			k++
		}
		models.put("secondaryListSlots", secondaryListSlots);
		
		def bgcolor = variables.getAt("bg-color")
		
		if(bgcolor != null) {
			models.put("bgcolor", bgcolor)
		} else {
			bgcolor = ""
			models.put("bgcolor", bgcolor)
		}
	}
}

