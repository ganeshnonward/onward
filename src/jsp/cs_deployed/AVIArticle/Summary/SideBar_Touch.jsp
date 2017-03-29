<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"%>
<%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<cs:ftcs>
	<a href='${asset._link_}'>
		<div class="summary-sidebar">
			<c:if test="${not empty asset.relatedImage}">
				<div class="thumbnail" class="${thumbnail}">
					<fragment:include name="summarySideBarTouch"/>
				</div>
			</c:if>
			<div class="description-wrap">
				<h3 class="title">
					<insite:edit field="headline" value="${asset.headline}" />
				</h3>
				<p class="abstract">
					<insite:edit field="abstract" value='${asset["abstract"]}' />
				</p>
			</div>
		</div>
	</a>
</cs:ftcs>