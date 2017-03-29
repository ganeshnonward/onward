<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"
%><cs:ftcs>
<img src="${asset.imageFile_bloblink_}" alt="${asset.alternateText}" 
		width="${asset.width}" 
		height="${asset.height}" />
<div class="caption">
	<insite:edit field="caption" value="${asset.caption}" params="{noValueIndicator: 'Enter Image Caption'}"/>
</div>
</cs:ftcs>