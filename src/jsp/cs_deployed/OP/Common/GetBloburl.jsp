<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><%@ taglib prefix="blobservice" uri="futuretense_cs/blobservice.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><%@ taglib prefix="string" uri="futuretense_cs/string.tld"
%><%@page import="org.apache.commons.lang.StringUtils"%>
<cs:ftcs><%--
INPUT: 
OUTPUT: 
--%>
<%
String blobType = ics.GetVar("assettype");
String blobId = ics.GetVar("assetid");
%><ics:if condition='<%=StringUtils.isNotBlank(blobType) && StringUtils.isNotBlank(blobId) && StringUtils.isNotBlank(ics.GetVar("field")) %>'>
	<ics:then>
		<render:getbloburl
			outstr="docurl" field='<%=ics.GetVar("field") %>' c='<%=blobType %>' cid='<%=blobId %>' >
		</render:getbloburl>
	</ics:then>
</ics:if>
<string:encode varname="blobUrl" variable="docurl"/>

</cs:ftcs>