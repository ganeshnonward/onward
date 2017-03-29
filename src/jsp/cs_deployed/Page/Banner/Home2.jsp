<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%>
<%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%>
<%@ page import="COM.FutureTense.Interfaces.ICS" %>
<cs:ftcs>
<fragment:include name="homeBanner" styles="aviHome2Banner"/>
<div class="teaser">
	<c:choose>
    <c:when test="${not empty article}">
		<render:gettemplateurl c='${article['assetType']}' cid='${article['assetId']}' outstr='url' tname='${article['template']}'/>
	
		<h2 class="ckheadline">${article['headline']}</h2>
		<p class="ckhometeaser">${article['abstract']}</p>
		<p class="ckhometeaser"><a href="<%=ics.GetVar("url")%>" class="fwckembeddedlink" >Read More</a></p>
		
	</c:when>
    <c:otherwise>

		<insite:edit field="bannerText" value="${asset.bannerText}"
		 params="{noValueIndicator: '[ Enter Text ]', toolbarStartupExpanded: false, width: '410px', height: '90px', toolbar: 'Home', customConfig: '../avisports/ckeditor/config.js'}"
		 editor="ckeditor" />
		 
	 </c:otherwise>
</c:choose>
</div>
</cs:ftcs>