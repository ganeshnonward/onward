package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class AVIArticleDetailController_Touch extends AssetController {

	
	public void articleCategoryLinkTouch() {
		
		def assetParentId
		
		EditableTemplateFragment<?> articleCategoryLinkTouchFragment = newEditableTemplateFragment()
																		.useTemplate("Link")
																		.editField("Group_Category")
																		.setEmptyText("[ Drop Article Category ]")
																		.setTitle("Category")
																		.setStyles("aviArticleCategory")
		
		if(models.asset.parent != null) {
			assetParentId = models.asset.parent[0].id
			articleCategoryLinkTouchFragment.forAsset("ArticleCategory", assetParentId)														
			
		}

		models.put("articleCategoryLinkTouch", articleCategoryLinkTouchFragment)
	}
	
	public void articleRelatedImageSummaryTouch() {
		
		EditableTemplateFragment<?> articleRelatedImageSummaryTouchFragment = newEditableTemplateFragment()
																				.useTemplate("Summary")
																				.forAsset("AVIImage", models.asset.relatedImage.id)
																				.useDevice(variables.d)
																				.setEmptyText("[ Drop Image ]")
																				.editField("relatedImage")
																				.useStyle(Fragment.Style.PAGELET)
																				.useArguments("thumbnail")
		
		models.put("articleRelatedImageSummaryTouch", articleRelatedImageSummaryTouchFragment)
	}
	
	public void articleLinkTouch() {
		
		if(variables.p !=null ) {
			
			models.put("parentPageId", variables.p)
			
			EditableTemplateFragment<?> articleLinkTouchProto = newEditableTemplateFragment()
																	.useTemplate("Link")
																	.useDevice(variables.d)
																	.addArgument("p", variables.p)
			
			def contentList2Size = models.asset.Assoc_Named_contentList2.size()
			List<Fragment> articleLinkTouchList = newFragmentList(contentList2Size, articleLinkTouchProto)
			
			def k = 0
			for(Fragment each : articleLinkTouchList) {
				
				if (models.asset.Assoc_Named_contentList2[k] != null) {
					each.forAsset(models.asset.Assoc_Named_contentList2[k].type, models.asset.Assoc_Named_contentList2[k].id)
				}
				k++
			}
			
			models.put("articleLinkTouch", articleLinkTouchList)
		}
		
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		
		articleCategoryLinkTouch()
		articleRelatedImageSummaryTouch()
		articleLinkTouch()
	}
}
