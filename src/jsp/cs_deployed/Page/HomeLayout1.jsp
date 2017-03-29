<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><cs:ftcs><!DOCTYPE html>
<html lang="en">
<head>
	<fragment:include name="header"/>
	<render:callelement elementname="Insights/AddAnalyticsTag" args="c,cid,site,d"/>
</head>
<body class="home">
	<div id="main">
			<render:satellitepage pagename="avisports/visitorUI" /> 
        <div id="header">
			<fragment:include name="navBar"/>
		</div>
		<div id="container">
			<div class="content">
				<div class="banner">
					<fragment:include name="bannerHomeLayout"/>
				</div>
			</div>
			<div class="center-column">
				<div class="post-wrapper">
					<fragment:include name="detail"/>
				</div>
			</div>
		</div>
		<div id="footer">
			<fragment:include name="footer"/>
		</div>
		<render:callelement elementname="Insights/Track" args="c,cid,site,d"/>
	</div>
</body>
</html>
</cs:ftcs>