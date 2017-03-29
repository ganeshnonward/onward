<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><cs:ftcs><!DOCTYPE html>
<html lang="en">
<head>
	<fragment:include name="header"/>
	<render:callelement elementname="Insights/AddAnalyticsTag" args="c,cid,site,d"/>
</head>
<body class="article-layout left-col">
	<div id="main">
			<render:satellitepage pagename="avisports/visitorUI" /> 
        <div id="header">
			<fragment:include name="navBar"/>
		</div>
		<div id="container">
			<div class="content">
				<fragment:include name="articleLayoutDetail"/>
			</div>
			<div class="sidebar">
				<fragment:include name="articleLayoutSideBar"/>
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