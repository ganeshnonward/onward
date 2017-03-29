package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class AVIArticleDetailController_NonTouch extends AssetController {

	
	public void articleCategoryLinkNonTouch() {
		
		def assetParentId
		
		EditableTemplateFragment<?> articleCategoryLinkNonTouchFragment = newEditableTemplateFragment()
																			.useTemplate("Link")
																			.editField("Group_Category")
																			.setEmptyText("[ Drop Article Category ]")
																			.setTitle("Category")
																			.setStyles("aviArticleCategory")
		
		if(models.asset.parent != null) {
			assetParentId = models.asset.parent[0].id
			articleCategoryLinkNonTouchFragment.forAsset("ArticleCategory", assetParentId)
		}
		
		models.put("articleCategoryLinkNonTouch", articleCategoryLinkNonTouchFragment)
	}
	
	public void	articleRelatedImageSummaryNonTouch() {
		
		EditableTemplateFragment<?> articleRelatedImageSummaryNonTouchFragment = newEditableTemplateFragment()
																				.useTemplate("Summary")
																				.forAsset("AVIImage", models.asset.relatedImage.id)
																				.useDevice(variables.d)
																				.setEmptyText("[ Drop Image ]")
																				.editField("relatedImage")
																				.useStyle(Fragment.Style.PAGELET)
																				.useArguments("thumbnail")

		models.put("articleRelatedImageSummaryNonTouch", articleRelatedImageSummaryNonTouchFragment)
		
	}

	public void articleLinkNonTouch() {
			
		if(variables.p !=null ) {
		
			models.put("parentPageId", variables.p)
			
			EditableTemplateFragment<?> articleLinkNonTouchProto = newEditableTemplateFragment()
																	.useTemplate("Link")
																	.useDevice(variables.d)
																	.addArgument("p", variables.p)
			
			def contentList2Size = models.asset.Assoc_Named_contentList2.size()
			List<Fragment> articleLinkNonTouchList = newFragmentList(contentList2Size, articleLinkNonTouchProto)
			
			def k = 0
			for(Fragment each : articleLinkNonTouchList) {
				
				if (models.asset.Assoc_Named_contentList2[k] != null) {
					each.forAsset(models.asset.Assoc_Named_contentList2[k].type, models.asset.Assoc_Named_contentList2[k].id)
				}
				k++
			}
			
			models.put("articleLinkNonTouch", articleLinkNonTouchList)
		}
		
		
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		
		super.doWork(super.models)
		
		articleCategoryLinkNonTouch()
		articleRelatedImageSummaryNonTouch()
		articleLinkNonTouch()
	}
}
