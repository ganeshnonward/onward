package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class AVIArticleDetailController extends AssetController {

	public void articleCategoryLink() {
		
		def assetParentId = ""
		
		if(models.asset.parents[0] != null){
			assetParentId = models.asset.parents[0].id
		}
		
		EditableTemplateFragment<?> articleCategoryLinkFragment = newEditableTemplateFragment()
																	.useTemplate("Link")
																	.forAsset("ArticleCategory", assetParentId)
																	.setEmptyText("[ Drop Article Category ]")
																	.setTitle("Category")
																	.setStyles("aviArticleCategory")
																	.editField("Group_Category")
		
		models.put("articleCategoryLink", articleCategoryLinkFragment)
		
	}
	
	public void articleRelatedImageDetail() {
		
		EditableTemplateFragment<?> articleRelatedImageDetailFragment = newEditableTemplateFragment()
																		.useTemplate("Detail")
																		.setEmptyText("[ Drop Image ]")
																		.forAsset(models.asset.relatedImage)
																		.editField("relatedImage")
		models.put("articleRelatedImageDetail", articleRelatedImageDetailFragment)
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
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		
		super.doWork(super.models)
		articleCategoryLink()
		articleRelatedImageDetail()
		checkCommunity()
		
	}
}
