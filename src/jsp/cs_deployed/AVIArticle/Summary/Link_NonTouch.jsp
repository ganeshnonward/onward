<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"%>
<cs:ftcs>
	<div class="summary-link">
		<div class="text">
			<a href='${asset._link_}'>
				<div>
					<insite:edit field="headline" value="${asset.headline}" params="{}"/>
				</div>
				<div class="author">
					BY <insite:edit field="author" value="${asset.author}" params="{}"/>
				</div>
			</a>
		</div>
		<div class="icon"></div>
	</div>
</cs:ftcs>