package oracle.webcenter.sites.controller

import oracle.webcenter.sites.controller.AssetController;

import com.fatwire.assetapi.data.*
import com.fatwire.assetapi.common.*
import com.fatwire.assetapi.fragment.*
import com.openmarket.xcelerate.asset.*

public class AVIImageSummaryController extends AssetController {

	@Override
	@RequiredParams(query="c,cid")
	public void doWork(Map models) {
		super.doWork(super.models)
		
		def thumbnailFieldLinkKey = variables.getAt("thumbnail-field")
		
		if(thumbnailFieldLinkKey != null) {
			models.put("thumbnailFieldLink", models.asset.getAt(thumbnailFieldLinkKey+"_bloblink_"))
		}
				
		def thumbnail = variables.getAt("thumbnail")
		thumbnail = (thumbnail == null ? "" : thumbnail)
		models.put("thumbnail", thumbnail)
				
		def fieldLinkKey = variables.getAt("field")	
		fieldLinkKey = (fieldLinkKey == null || fieldLinkKey.equals("") ? "sidebarThumbnail_bloblink_" : fieldLinkKey+"_bloblink_")
		
		models.put("fieldLink", models.asset.getAt(fieldLinkKey))
	}
}
