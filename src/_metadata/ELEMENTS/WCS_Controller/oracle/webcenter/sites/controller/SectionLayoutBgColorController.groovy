package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class SectionLayoutBgColorController extends BaseController {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		
		//Fragments for SectionLayoutGreen and SectionLayoutOrange


		Fragment fragmentSectionLayoutFragment = newTemplateFragment()
											.useTemplate("SectionLayout")
											.useArguments("c","cid","bg-color")
											.useStyle(Fragment.Style.ELEMENT)
		models.put("fragmentSectionLayout", fragmentSectionLayoutFragment)
		
		//Background color for template
		def bgcolor = elementCatalogParameters.getAt("bg-color")
		models.put("bgcolor", bgcolor)
		
	}
}
