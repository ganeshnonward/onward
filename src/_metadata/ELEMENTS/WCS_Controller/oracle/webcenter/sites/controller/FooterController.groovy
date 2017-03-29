package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.NavBarController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class FooterController extends NavBarController {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
	}
}
