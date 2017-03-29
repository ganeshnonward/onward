<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"%>
<%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<cs:ftcs>
	<a href='${asset._link_}'>
		<div class="summary">
			<c:if test="${not empty asset.relatedImage}">
				<div class="thumbnail" class="${thumbnail}">
					<fragment:include name="summaryTouch"/>
				</div>
			</c:if>
			
			<div class="description">
				<span class="headline">
					<insite:edit field="headline" value="${asset.headline}" params="{width: '220px'}"/>
				</span>
				<br/>
				<span class="author">
					<insite:edit field="author" value="${asset.author}" params="{width: '220px'}"/>
				</span>
			</div>
				
			<fmt:formatDate value="${asset.postDate}" dateStyle="long" type="date" var="formattedDate" />
			<div class="date">${formattedDate}</div>
		</div>
	</a>
</cs:ftcs>