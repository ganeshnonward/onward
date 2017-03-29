package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class SectionLayout4Controller extends UtilityController {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		//skiContentListProto is a prototype to which we keep adding to get the fragment we need.
		//skiContentListProto is defined in UtilityController
		
		//Prototype for Skiing page content
		Fragment skiContentListProto = newEditableTemplateFragment()
										.useTemplate("Summary/Feature")
										.addLegalTypes("AVIArticle","YouTube")
										.setEmptyText("Drop Article or YouTube video")
		
		// We are adding 2 Empty slots that will be shown in edit mode
		//In this case we read from content list 1
		def contentList1size = 0;
		
		if(models.asset.Assoc_Named_contentList1 != null){
			contentList1size = models.asset.Assoc_Named_contentList1.size()
		}
										
		def contentList1Size = contentList1size	+ 2										
		List <EditableTemplateFragment<?>> contentList1Fragment = newFragmentList(contentList1Size,skiContentListProto)
		
		def j = 1
		for(EditableTemplateFragment<?> each : contentList1Fragment) {
			if (models.asset.Assoc_Named_contentList1 !=null){
				each.forAsset(models.asset.Assoc_Named_contentList1[j - 1])
			}
			each
				.editField("Association-named:contentList1", j)
				.setTitle("Main List - Content &#35;" + j)
				.addArgument("site", variables.site)
				.addArgument("p", variables.cid)
			j++
		}
		models.put("contentList1Fragment",contentList1Fragment)
	
		//skiContentListProto is a prototype to which we keep adding to get the fragment we need.
		//skiContentListProto is defined in UtilityController
		// We are adding 2 Empty slots that will be shown in edit mode
		//In this case we read from content list 2

		def contentList2size = 0;
		
		if(models.asset.Assoc_Named_contentList2 != null){
			contentList2size = models.asset.Assoc_Named_contentList1.size()
		}
		
		def contentList2Size = contentList2size	+ 2
		List <Fragment> contentList2Fragment = newFragmentList(contentList2Size,skiContentListProto)
		
		def k = 1
		for(Fragment each : contentList2Fragment) { 
			if (models.asset.Assoc_Named_contentList2 != null) {
				each.forAsset(models.asset.Assoc_Named_contentList2[k - 1])
			}
			//In edit mode show these slots.
			each.editField("Association-named:contentList2", k)
				.setTitle("Secondary List - Content &#35;" + k)
				.addArgument("site", variables.site)
				.addArgument("p", variables.cid)
			k++
		}
		models.put("contentList2Fragment",contentList2Fragment)

		
	}
}
