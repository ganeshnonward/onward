package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.openmarket.xcelerate.asset.*
import com.fatwire.assetapi.fragment.*
import com.fatwire.assetapi.common.AssetAccessException;

public class SegmentsController extends BaseController {

	@Override
	protected void doWork(Map models) {
		try {
			List<Map> segments = newRecommendationReader().readSegments();
			models.put("segments", segments);
		} catch (AssetAccessException e) {
			e.printStackTrace();
		}
	}
}