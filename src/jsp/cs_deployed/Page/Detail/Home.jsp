<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%>
<cs:ftcs>

<c:forEach var="index" begin="0" end="${homeDetail.size()-1 }">
		<div class="post">
				<fragment:include name="homeDetail" index="${index}"/>
			<div class="descr">
				<insite:edit value="${asset.teaserText[index]}" editor="ckeditor"
							 field="teaserText" index="${index+1}"
							 params="{noValueIndicator: '[ Enter Teaser Text #${index+1} ]', width: '205px', toolbar: 'Home', customConfig: '../avisports/ckeditor/config.js'}" />
			</div>
		</div>
	</c:forEach>	
</cs:ftcs>