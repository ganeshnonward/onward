<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"%>
<cs:ftcs>
	<div class="summary">
		<div class="text">
			<a href='${asset._link_}'>
				<insite:edit field="headline" value="${asset.headline}" params="{}"/>
			</a>
		</div>
		<div class="icon"></div>
	</div>
</cs:ftcs>