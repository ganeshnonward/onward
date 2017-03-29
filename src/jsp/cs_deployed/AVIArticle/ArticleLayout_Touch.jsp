<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"%>
<%@ taglib prefix="render" uri="futuretense_cs/render.tld"%>
<cs:ftcs><!DOCTYPE html>
	<html lang="en">
	<head>
		<fragment:include name="header"/>
		<render:callelement elementname="Insights/AddAnalyticsTag" args="c,cid,site,d"/>
	</head>
	<body id="avisports">
		<div id="header">
			<%-- <render:satellitepage pagename="avisports/navbar" args="d" /> --%>
			<fragment:include name="navBarTouch"/>
		</div>
		<div id="section">
			<fragment:include name="articleLayoutDetailTouch"/>
		</div>
		<div id="footer">
			<fragment:include name="footerTouch"/>
		</div>
		<render:callelement elementname="Insights/Track" args="c,cid,site,d"/>
	</body>
	</html>
</cs:ftcs>