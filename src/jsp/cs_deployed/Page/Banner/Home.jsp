<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><cs:ftcs>
<fragment:include name="homeBanner" styles="aviHomeBanner"/>
<div class="top-stories">
	<h2>
		<insite:edit field="bannerTitle"  value="${asset.bannerTitle}" 
					 params="{noValueIndicator: '[ Enter Headline ]'}"/>
	</h2>
	<ul>
		<li>
			<c:forEach var="index" begin="0" end="${homeSummaryList.size() - 1}">
					<fragment:include name="homeSummaryList" index="${index}"/>
			</c:forEach>
		</li>		
	</ul>
</div>
</cs:ftcs>
