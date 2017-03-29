<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"%>
<%@ taglib prefix="render" uri="futuretense_cs/render.tld"%>
<cs:ftcs><!DOCTYPE html>
<html lang="en">
<head>
		<fragment:include name="headerNonTouch"/>
		<render:callelement elementname="Insights/AddAnalyticsTag" args="c,cid,site,d"/>
</head>
<body id="avisports">
		<div id="header">
			<fragment:include name="navBarNonTouch"/>
		</div>
		<div id="section">
			<div id="banner">
				<fragment:include name="bannerHomeLayoutNonTouch"/>
			</div>
			<div id="post-wrap">
				<fragment:include name="detailHomeLayoutNonTouch"/>
			</div>
		</div>
		<div id="footer">
			<fragment:include name="footerNonTouch"/>
		</div>
		<render:callelement elementname="Insights/Track" args="c,cid,site,d"/>
</body>
</html>
</cs:ftcs>