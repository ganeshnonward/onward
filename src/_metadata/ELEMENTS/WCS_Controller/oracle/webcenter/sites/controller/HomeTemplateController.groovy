package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class HomeTemplateController extends AssetController {
	
	//Fragment code for Top article summary 
	public void homeSummaryList() {
		
		
		EditableTemplateFragment<?> homeSummaryProtoFragment = newEditableTemplateFragment()
														.useTemplate("Summary")
														.setStyles("aviHomeTopStories")
														

		def totalTopArticles = 2

		List <EditableTemplateFragment<?>> homeSummaryList = newFragmentList(totalTopArticles, homeSummaryProtoFragment)
		def fragmentIndex = 0
		def fieldIndex = 1	
				
		for(EditableTemplateFragment<?> each : homeSummaryList) {
			
			// This check ensures that at max only 2 top articles 
			if((models.asset.topArticles[fragmentIndex] != null) && fragmentIndex < 2 ) {
				
				each.forAsset(models.asset.topArticles[fragmentIndex].type,models.asset.topArticles[fragmentIndex].id)
						.editField("topArticles", fieldIndex)
						.setTitle("Top Article #" + fieldIndex)
						.addArgument("p", variables.cid)
			} else {
                //Empty slots
                each.editField("topArticles", fieldIndex)
                        .setTitle("Top Story - &#35;" + fieldIndex)
                        .addArgument("p", variables.cid)
                        .setEmptyText("[ Drop Article &#35;"+fieldIndex+" ]")
			}
			fragmentIndex++
            fieldIndex++
		}
		models.put("homeSummaryList", homeSummaryList)
	}
	
	//Home page banner fragment. Style is set in template code
	public void homeBanner(){
		
		EditableTemplateFragment<?> homeBannerFragment = newEditableTemplateFragment()
															.useTemplate("Detail")
															.editField("banner")
		
	if(models.asset.recommendation != null){

List <Map> advColsList = newRecommendationReader()
                                                                        .forSite(variables.site)
									.forProfile("VisitorNameAggregationTemplate")
									.useAssetReaderForType("AVIArticle",newAssetReader().selectAll(true).selectImmediateOnlyParents(true))
									.useAssetReaderForType("AVIImage",newAssetReader().select("name,alternateText,mimetype,height"))
									.readRecommendations("Home Recommendation")
									
										int i = 0

List<Map> parents = advColsList[i].parents;
Long articleCategory = parents[0].id;
 Map assetMap = newAssetReader()
              .forAsset("ArticleCategory",articleCategory)
              .selectAll(true)
              .selectImmediateOnlyParents(true)
              .includeLinks(true)
              .includeLinksForBlobs(true)
              .read();
		 	homeBannerFragment.forAsset("AVIImage", assetMap.Assoc_Named_BannerImage.id)
models.put("article",advColsList[i]);
}else	if(models.asset.banner !=null) {
			homeBannerFragment.forAsset("AVIImage", models.asset.banner.id)
		}
															
		models.put("homeBanner", homeBannerFragment)
	}
	
	//Fragment code for detail
	public void homeDetail(){
		
		EditableTemplateFragment<?> homeDetailProtoFragment = newEditableTemplateFragment()
																.useTemplate("Detail")
																.setStyles("aviHomeDetailImage")
		def numberOfTeasers = 4
	    List <EditableTemplateFragment<?>> homeDetailListFragment = newFragmentList(numberOfTeasers, homeDetailProtoFragment)
		
		def fragmentIndex = 0
		def fieldIndex = 1	

		for(EditableTemplateFragment<?> each : homeDetailListFragment) {
			if(models.asset.teaserImages[fragmentIndex]!=null){
				each.forAsset(models.asset.teaserImages[fragmentIndex].type, models.asset.teaserImages[fragmentIndex].id)
					.editField("teaserImages", fieldIndex)
					.setTitle("Teaser image #"+ fieldIndex)
			}else {
                //Empty slots
                each.editField("teaserImages", fieldIndex)
                        .setTitle("Teaser - &#35;" + fieldIndex)
                        .setEmptyText("[ Drop Image &#35;"+ fieldIndex+" ]")
			}
			fragmentIndex++
            fieldIndex++
		}
		models.put("homeDetail", homeDetailListFragment)
		
	}
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		//Call doWork of AssetController
		super.doWork(super.models)
		
		homeSummaryList()
		homeBanner()
		homeDetail()
		
	}
}
