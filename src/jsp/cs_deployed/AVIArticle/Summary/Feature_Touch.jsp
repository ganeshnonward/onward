<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"%>
<%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<cs:ftcs>
	<a href='${asset._link_}'>
		<div class="summary-feature">
			<c:if test="${not empty asset.relatedImage}">
				<fragment:include name="summaryFeatureTouch"/>
		    </c:if>
	   		<h3 class="title">
				<insite:edit field="headline" value="${asset.headline}" />
			</h3>
			<p class="description">
				<insite:edit field="abstract" value='${asset["abstract"]}' />
			</p>
	    </div>
    </a>
</cs:ftcs>