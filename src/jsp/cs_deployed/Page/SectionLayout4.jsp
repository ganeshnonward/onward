<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%>
<cs:ftcs><!DOCTYPE html>
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
					<fragment:include name="banner" emptytext="Drop Banner Image"/>
			</div>
			<div class="center-column blue">
				<div class="post-wrapper">
					<h2 class="title"><insite:edit field="titleContent1" value="${asset.titleContent1}" params='{noValueIndicator: "[ Enter Headline ]"}'/></h2>
					<c:forEach var="index" begin="0" end="${contentList1Fragment.size() - 1}">
						<fragment:include name="contentList1Fragment" index="${index}"/>
					</c:forEach>			
				</div>
				<div class="post-wrapper">
					<h2 class="title"><insite:edit field="titleContent2" value="${asset.titleContent2}" params='{noValueIndicator: "[ Enter Headline ]"}'/></h2>
					<c:forEach var="index" begin="0" end="${contentList2Fragment.size() - 1}">
							<fragment:include name="contentList2Fragment" index="${index}"/>
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