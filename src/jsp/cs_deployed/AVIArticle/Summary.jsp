<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><cs:ftcs>
<c:if test="${not empty asset.relatedImage}">
	<a href='${asset._link_}'>
		<fragment:include name="summaryAVIArticle"/>
	</a>
</c:if>

<div class="descr ${thumbnail}">
	<h3><a href='${asset._link_}'><insite:edit field="headline" value="${asset.headline}" params="{width: '220px'}"/></a></h3>
	<insite:edit field="abstract" value='${asset["abstract"]}' params="{width: '220px'}" />
</div>
</cs:ftcs>