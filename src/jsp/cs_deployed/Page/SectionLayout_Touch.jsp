<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="render" uri="futuretense_cs/render.tld"%>
<cs:ftcs><!DOCTYPE html>
	<html lang="en">
	<head>
		<fragment:include name="header"/>
		<render:callelement elementname="Insights/AddAnalyticsTag" args="c,cid,site,d"/>
	</head>
	<body id="avisports">
		<div id="header">
			<fragment:include name="navBarTouch"/>
		</div>
		<div id="section">
			<div id="banner">
				<fragment:include name="bannerHomeTouch"/>
			</div>
			<div id="post-wrap" class="${bgcolor}">
				<div class="post">
					<c:forEach var="index" begin="0" end="${mainListTouchSlots.size() - 1}">
						<fragment:include name="mainListTouchSlots" index="${index}"/>
					</c:forEach>
				</div>
				<div class="post">
					<c:forEach var="index" begin="0" end="${emptyListTouchSlots.size() - 1}">
						<fragment:include name="emptyListTouchSlots" index="${index}"/>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="footer">
			<fragment:include name="footerTouch"/>
		</div>
		<render:callelement elementname="Insights/Track" args="c,cid,site,d"/>
	</body>
	</html>
</cs:ftcs>