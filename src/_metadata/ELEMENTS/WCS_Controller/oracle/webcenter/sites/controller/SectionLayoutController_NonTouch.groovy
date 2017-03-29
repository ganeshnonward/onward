package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController_NonTouch;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class SectionLayoutController_NonTouch extends UtilityController_NonTouch {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {

		super.doWork(super.models)

		// change the template for the first Main summary article

		def templateName
		if(variables.pagename.equals("avisports/Page/SectionLayout3_NonTouch")) {
			templateName = "Summary"
		} else {
			templateName = "Summary/Link"
		}
		
		EditableTemplateFragment<?> contentList1NonTouchProto = newEditableTemplateFragment()
																.addLegalTypes("AVIArticle")
																.useTemplate(templateName)
																.setSlotname("SectionLayoutSlotRight")
		List <EditableTemplateFragment<?>> mainListNonTouchSlots = FragmentFactory.newFragmentList(models.asset.Assoc_Named_contentList1.size(), contentList1NonTouchProto)
		
		def j = 0
		for(EditableTemplateFragment<?> each : mainListNonTouchSlots) {
	
				each.forAsset(models.asset.Assoc_Named_contentList1[j].type, models.asset.Assoc_Named_contentList1[j].id)
					.setTitle("Secondary List - Article &#35;"+(j+1))
					.setEmptyText("Drop Article &#35;"+ (j+1))
					.editField("Association-named:contentList2", (j+1))
					
				j++												
		}
		
		models.put("mainListNonTouchSlots",mainListNonTouchSlots)
		
		//We will draw 4 empty slots
		def numberOfEmptySlots = 4
		List <EditableTemplateFragment<?>> emptyListNonTouchSlots = FragmentFactory.newFragmentList(numberOfEmptySlots, contentList1NonTouchProto)
		
		for(EditableTemplateFragment<?> each : emptyListNonTouchSlots) {
		
			def associatedAsset = models.asset.Assoc_Named_contentList1[j]
			//Check if slot is filled. This check is similar if we would have used <insite:ifedit>
			if (associatedAsset !=null){
	
				each.forAsset(models.asset.Assoc_Named_contentList1[j].type, models.asset.Assoc_Named_contentList1[j].id)
			}
				each.setTitle("Secondary List - Article &#35;"+(j+1))
					.setEmptyText("Drop Article &#35;"+ (j+1))
					.editField("Association-named:contentList2", (j+1))
					
				j++
		}
		
		models.put("emptyListNonTouchSlots",emptyListNonTouchSlots)
		
		
		//Fragment for section layout green, orange
		
		Fragment sectionLayoutNonTouch = newTemplateFragment()
										.useTemplate("SectionLayout")
										.useArguments("c","cid","d","bg-color")
										.useStyle(Fragment.Style.EMBEDDED)
		models.put("fragmentSectionLayoutNonTouch", sectionLayoutNonTouch)
		
		def bgcolor = variables.getAt("bg-color")

		if(bgcolor != null) {
			models.put("bgcolor", bgcolor)
		} else {
			bgcolor = ""
			models.put("bgcolor", bgcolor)
		}
	}
}
