<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><cs:ftcs>
<div class="post-large">
	<c:if test="${not empty asset.relatedImage}">
		<a href='${asset._link_}'>
			<fragment:include name="summaryFeature"/>
		</a>
	</c:if>
	<h3 class="title"><a href='${asset._link_}'><insite:edit field="headline" value="${asset.headline}" /></a></h3>
	<p class="descr"><insite:edit field="abstract" value='${asset["abstract"]}' /></p>
</div>
</cs:ftcs>