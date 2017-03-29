<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"%>
<cs:ftcs>
	<c:forEach var="index" begin="0" end="${homeTeaserImagesNonTouch.size() - 1}">
			<div class="page-detail-home">
				<div class="teaser-image">
					<fragment:include name="homeTeaserImagesNonTouch" index="${index}"/>
				</div>
				<div class="description">
					<insite:edit field="teaserText" 
								 index="${index}" 
								 value="${asset.teaserText[index]}" 
								 editor="ckeditor"
					 			 params="{noValueIndicator: '[ Enter Teaser Text ]', toolbar: 'Home', customConfig: '../avisports/ckeditor/config.js'}" />
				</div>
			</div>
	</c:forEach>
</cs:ftcs>