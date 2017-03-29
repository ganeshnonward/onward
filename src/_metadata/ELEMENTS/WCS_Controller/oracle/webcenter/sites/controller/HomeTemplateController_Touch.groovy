package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class HomeTemplateController_Touch extends AssetController {

	
	public void home2BannerTouch(){
		
		EditableTemplateFragment<?> home2BannerFragmentTouch = newEditableTemplateFragment()
															.forAsset(models.asset.banner.type, models.asset.banner.id)
															.useTemplate("Detail")
															.editField("banner")
															
		models.put("home2BannerTouch", home2BannerFragmentTouch)
	}
	
	public void homeTeaserImagesTouch() {
		int teaserImagesListSize = 0
		
		if(models.asset.teaserImages != null) {
			teaserImagesListSize = models.asset.teaserImages.size()
		}
		
		EditableTemplateFragment<?> teaserImageFragmentProto = newEditableTemplateFragment().useTemplate("Detail")
		List<Fragment> teaserImageFragmentList = newFragmentList(teaserImagesListSize, teaserImageFragmentProto)
		
		int i = 0
		for(Fragment each : teaserImageFragmentList) {
			def teaserImage = models.asset.teaserImages[i]
			if (teaserImage !=null){

				each.forAsset(models.asset.teaserImages[i].type, models.asset.teaserImages[i].id)
			} 
				each.editAsset("Page", variables.cid, "teaserImages", i)
					.setTitle("Teaser image #"+(i+1))
				i++			
		}
		models.put("homeTeaserImages",teaserImageFragmentList)

	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		// Controller code
		super.doWork(super.models)
		home2BannerTouch()
		homeTeaserImagesTouch()
		models.put("assetid", variables.cid)
		models.put("assettype", variables.c)
	}
}
