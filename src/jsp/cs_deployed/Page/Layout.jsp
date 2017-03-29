<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><cs:ftcs><%-- Page/Layout	--%>
<%-- Record dependencies for the Template --%>
<ics:if condition='<%=ics.GetVar("tid")!=null%>'><ics:then><render:logdep cid='<%=ics.GetVar("tid")%>' c="Template"/></ics:then></ics:if>
<html>
<head>
<render:satellitepage pagename ="OP/Common/js" />
<render:satellitepage pagename ="OP/Common/css" />
</head>
<body>
<render:callelement elementname="OP/Common/GetAttributeValues" scoped="global">	
		<ics:argument name="attributes" value="Banner" />
		<ics:argument name="prefix" value="layout" />
		<ics:argument name="type" value="Page" />
		<ics:argument name="id" value='<%=ics.GetVar("cid") %>' />
		<ics:argument name="site" value='<%=ics.GetVar("site")%>' />
	</render:callelement>
	
 <div id="customizr-slider" class=" carousel slide">
    <div class="carousel-inner">
  <%String divclass="item active";%>	            
<c:forEach var="i" items="${layout.Banner}" varStatus="counter">

<c:if test="${counter.count > 1}"><%
        divclass="item";
    %></c:if>
	<div class="<%=divclass%>">
<render:calltemplate tname="BannerItem"
	                 c= '${i.type}'
	                 cid ='${i.id}'
	                 site='<%=ics.GetVar("site")%>'
	                  tid='<%=ics.GetVar("tid")%>'  >
	               </render:calltemplate>
	               </div>
</c:forEach>
</div>
</div>
</body>
</html>

</cs:ftcs>