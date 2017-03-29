<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><cs:ftcs>
<h3 class='title'>
	<a href='${asset._link_}'>
		<insite:edit field="headline" value="${asset.headline}" />
	</a>
</h3>
<c:if test="${not empty asset.relatedImage}">
	<a href='${asset._link_}'>
		<fragment:include name="summaryLarge"/>
	</a>
</c:if>
<div>
	<p class="descr"><insite:edit field="abstract" value='${asset["abstract"]}' params='{width: "165px"}'/></p>
	<ul>
		<c:forEach var="status" begin="0" end='${nblinks - 1}'>
			<li class="article-link">
				<fragment:include name="summaryLargeLink" index="${status}"/>
			</li>
		</c:forEach>

	</ul>
</div>
</cs:ftcs>