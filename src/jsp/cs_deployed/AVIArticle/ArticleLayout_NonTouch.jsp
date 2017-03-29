<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"%>
<%@ taglib prefix="render" uri="futuretense_cs/render.tld"%>
<%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<cs:ftcs><!DOCTYPE html>
	<html lang="en">
	<head>
		<fragment:include name="headerNonTouch"/>
		<render:callelement elementname="Insights/AddAnalyticsTag" args="c,cid,site,d"/>
	</head>
	<body id="avisports">
		<div id="header">
			<%-- <render:satellitepage pagename="avisports/navbar" args="d" /> --%>
			<fragment:include name="navBarNonTouch"/>
		</div>
		<div id="section">
			<fragment:include name="articleLayoutDetailNonTouch"/>
		</div>
		<div id="footer">
			<fragment:include name="footerNonTouch"/>
		</div>
		<render:callelement elementname="Insights/Track" args="c,cid,site,d"/>
	</body>
	</html>
</cs:ftcs>