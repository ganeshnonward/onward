package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class ArticleLayoutController extends UtilityController {

	
	public void articleLayoutDetail() {
		
		TemplateFragment<?> articleLayoutDetailFragment = newTemplateFragment()
															.useTemplate("Detail")
															.useArguments("c", "cid")
															.useStyle(Fragment.Style.ELEMENT)
		models.put("articleLayoutDetail", articleLayoutDetailFragment)
		
	}
	
	
	public void articleLayoutSideBar() {
	
		TemplateFragment<?> articleLayoutSideBarFragment = newTemplateFragment()
															.useTemplate("SideBar")
															.useArguments("c", "cid", "site")
															.useStyle(Fragment.Style.ELEMENT)
		models.put("articleLayoutSideBar", articleLayoutSideBarFragment)
		
	}
	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		
		articleLayoutDetail()
		articleLayoutSideBar()
	}
}
