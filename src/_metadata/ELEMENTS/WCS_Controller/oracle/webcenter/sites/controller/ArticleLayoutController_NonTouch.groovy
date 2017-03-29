package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController_NonTouch;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class ArticleLayoutController_NonTouch extends UtilityController_NonTouch {

	
	public void articleLayoutDetailNonTouch() {
		
		TemplateFragment<?> articleLayoutDetailNonTouchFragment = newTemplateFragment()
															.useTemplate("Detail")
															.useArguments("c", "cid", "d")
															.useStyle(Fragment.Style.PAGELET)
		models.put("articleLayoutDetailNonTouch", articleLayoutDetailNonTouchFragment)
		
	}
	
	public void articleLayoutDetail2NonTouch() {
		
		TemplateFragment<?> articleLayoutDetail2NonTouchFragment = newTemplateFragment()
															.useTemplate("Detail2")
															.useArguments("c", "cid", "d")
															.useStyle(Fragment.Style.PAGELET)
		models.put("articleLayoutDetail2NonTouch", articleLayoutDetail2NonTouchFragment)
		
	}
	
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		
		super.doWork(super.models)
		articleLayoutDetailNonTouch()
		articleLayoutDetail2NonTouch()
	}
}
