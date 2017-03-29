package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.openmarket.xcelerate.asset.*
import com.fatwire.assetapi.fragment.*
import com.fatwire.assetapi.common.AssetAccessException;

public class SegmentBasedRecommendationController extends BaseController {

	@Override
	@RequiredParams(query = "segments,recommendation,sitename")
	protected void doWork(Map models) {
		String segments = variables.segments;
		String recommendation = variables.recommendation;
		String sitename = variables.sitename;
		try {
			List<Map> recommendations = newRecommendationReader()
					.forSite(sitename)
					.forSegments(segments)
					.readRecommendations(recommendation);
			models.put("segments", segments);
			models.put("recommendation", recommendation);
			models.put("sitename", sitename);
			models.put("recommendations", recommendations);
		} catch (AssetAccessException e) {
			e.printStackTrace();
		}
	}
}