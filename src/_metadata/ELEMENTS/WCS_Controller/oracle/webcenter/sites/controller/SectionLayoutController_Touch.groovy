package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.UtilityController_Touch;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class SectionLayoutController_Touch extends UtilityController_Touch {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
      
		super.doWork(super.models)
		
		//Fragment for section layout green, orange   
		
		Fragment sectionLayoutTouch = newTemplateFragment()
										.useTemplate("SectionLayout")
										.useArguments("c","cid","d","bg-color")
										.useStyle(Fragment.Style.EMBEDDED)
		models.put("fragmentSectionLayoutTouch", sectionLayoutTouch)
		
		def bgcolor = variables.getAt("bg-color")
		if(bgcolor != null) {
			models.put("bgcolor", bgcolor)
		} else {
			bgcolor = ""
			models.put("bgcolor", bgcolor)
		}
		
	}
}

	