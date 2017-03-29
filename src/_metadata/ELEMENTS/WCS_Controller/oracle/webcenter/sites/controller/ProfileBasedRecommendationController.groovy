package oracle.webcenter.sites.controller

import com.fatwire.assetapi.data.*
import com.openmarket.xcelerate.asset.*
import com.fatwire.assetapi.fragment.*
import com.fatwire.assetapi.common.AssetAccessException;

@InjectVisitor(name="profile", profile = "aggregateRule")
public class ProfileBasedRecommendationController extends BaseController {

	@Override
	@RequiredParams(query = "recommendation,sitename")
	protected void doWork(Map models) {
		String recommendation = variables.recommendation;
		String sitename = variables.sitename;
		try {
			String profile = String.valueOf(models.get("profile"));
			List<Map> recommendations = newRecommendationReader()
					.forSite(sitename)
					.forVisitor(profile)
					.readRecommendations(recommendation);
			models.put("profile", profile);
			models.put("recommendation", recommendation);
			models.put("sitename", sitename);
			models.put("recommendations", recommendations);
		} catch (AssetAccessException e) {
			e.printStackTrace();
		}
	}
}