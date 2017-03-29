<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"%>
<cs:ftcs>
	<a href='${asset._link_}'>
		<div class="summary-highlight">
			<h3 class="title">
				<insite:edit field="headline" value="${asset.headline}" />
			</h3>
			<p class="description">
				<insite:edit field="abstract" value='${asset["abstract"]}' />
			</p>
	   </div>
    </a>		   
</cs:ftcs>