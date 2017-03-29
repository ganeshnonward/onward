<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><cs:ftcs><!DOCTYPE html>
<c:set var="emptyText" value="Drop Article or Youtube Video" />
<html lang="en">
<head>
	<fragment:include name="header"/>
	<render:callelement elementname="Insights/AddAnalyticsTag" args="c,cid,site,d"/>
</head>
<body class="section">
	<div id="main">
			<render:satellitepage pagename="avisports/visitorUI" /> 
         <div id="header">
			<fragment:include name="navBar"/>
		</div>
		<div id="container">
			<div class="content">
				<fragment:include name="banner" styles="aviSectionBanner" emptytext="Drop Banner Image" title="Page Banner"/>
			</div>
			<div class='center-column ${bgcolor}'>
				<div class="post-wrapper">
					<h2 class="title">
						<insite:edit field="titleContent1" value="${asset.titleContent1}" params='{noValueIndicator: "[ Enter Headline ]"}'/>
					</h2>
					<div class="post">
						<fragment:include name="mainListSlots" index="0" title="Main List - Content #1" emptytext="${emptyText}"/>
					</div>
					<c:forEach begin="1" end="${mainListSlots.size()-1}" var="status">
						<div class="post">
							<fragment:include name="mainListSlots" index="${status}" title="Main List - Content &#35;${status+1}" emptytext="${emptyText}"/>
						</div>
					</c:forEach>
				</div>
				<div class="post-wrapper">
					<h2 class="title"><insite:edit field="titleContent2" value="${asset.titleContent2}" params='{noValueIndicator: "[ Enter Headline ]"}'/></h2>
					<c:forEach begin="0" end="${secondaryListSlots.size()-1}" var="status">
						<div class="post">
							<fragment:include name="secondaryListSlots" index="${status}" title="Secondary List - Content &#35;${status+1}" emptytext="${emptyText}"/>
						</div>
					</c:forEach>
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