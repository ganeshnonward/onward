package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController_Touch;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class ArticleLayoutController_Touch extends UtilityController_Touch {

	
	public void articleLayoutDetailTouch() {
		
		TemplateFragment<?> articleLayoutDetailTouchFragment = newTemplateFragment()
																	.useTemplate("Detail")
																	.useArguments("c", "cid", "d")
																	.useStyle(Fragment.Style.PAGELET)
		models.put("articleLayoutDetailTouch", articleLayoutDetailTouchFragment)
		
	}
	
	public void articleLayoutDetail2Touch() {
		
		TemplateFragment<?> articleLayoutDetail2TouchFragment = newTemplateFragment()
																	.useTemplate("Detail2")
																	.useArguments("c", "cid", "d")
																	.useStyle(Fragment.Style.PAGELET)
		models.put("articleLayoutDetail2Touch", articleLayoutDetail2TouchFragment)
		
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		
		super.doWork(super.models)
		
		articleLayoutDetailTouch()
		articleLayoutDetail2Touch()
	}
}
