<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><cs:ftcs><%-- OP_Digital_C/BannerImage	--%>
<%-- Record dependencies for the Template --%>
<ics:if condition='<%=ics.GetVar("tid")!=null%>'><ics:then><render:logdep cid='<%=ics.GetVar("tid")%>' c="Template"/></ics:then></ics:if>
<render:callelement elementname="OP/Common/GetAttributeValues" scoped="global">	
		<ics:argument name="attributes" value="Image,AltText" />
		<ics:argument name="prefix" value="banner" />
		<ics:argument name="type" value="OP_Digital_C" />
		<ics:argument name="id" value='<%=ics.GetVar("cid") %>' />
		<ics:argument name="site" value='<%=ics.GetVar("site")%>' />
	</render:callelement>
	
	
	
	<render:callelement elementname="OP/Common/GetBloburl" scoped="global">
		    <render:argument name="assettype" value='${banner.Image.type}'/>
		    <render:argument name="assetid" value='${banner.Image.id}'/>
		    <render:argument name="field" value='Blob'/>
	  </render:callelement>
	 
	 <div class="carousel-image slider-full">
              <img width="1170" height="500" src='<%=ics.GetVar("blobUrl")%>'  title="${banner.AltText}" class="attachment-slider-full size-slider-full" alt="">
              </div>

</cs:ftcs>