<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"%>
<%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"%>
<cs:ftcs>
	<fragment:include name="home2BannerTouch"/>
	<div class="teaser">
			<insite:edit field="bannerText"
						 value="${asset.bannerText}"
						 params="{noValueIndicator: '[ Enter Text ]', toolbarStartupExpanded: false, toolbar: 'Home', customConfig: '../avisports/ckeditor/config.js'}"
					 	 editor="ckeditor"/>
	</div>
</cs:ftcs>