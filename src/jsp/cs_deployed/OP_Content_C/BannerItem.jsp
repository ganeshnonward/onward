<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><cs:ftcs><%-- OP_Content_C/BannerItem	--%>
<%-- Record dependencies for the Template --%>
<ics:if condition='<%=ics.GetVar("tid")!=null%>'><ics:then><render:logdep cid='<%=ics.GetVar("tid")%>' c="Template"/></ics:then></ics:if>

<render:callelement elementname="OP/Common/GetAttributeValues" scoped="global">	
		<ics:argument name="attributes" value="Title,ShortTitle,ButtonText,BannerImage" />
		<ics:argument name="prefix" value="banneritem" />
		<ics:argument name="type" value="OP_Content_C" />
		<ics:argument name="id" value='<%=ics.GetVar("cid") %>' />
		<ics:argument name="site" value='<%=ics.GetVar("site")%>' />
	</render:callelement>

              
              <render:calltemplate tname="BannerImage"
	                 c= '${banneritem.BannerImage.type}'
	                 cid ='${banneritem.BannerImage.id}'
	                 site='<%=ics.GetVar("site")%>'
	                  tid='<%=ics.GetVar("tid")%>'  >
	               </render:calltemplate>
 <div class="carousel-caption"><h1>${banneritem.Title} </h1> <p class="lead">${banneritem.ShortTitle}</p>  <a class="btn btn-large btn-primary" href="http://onwardpath.com/need-know-webcenter-implementation">${banneritem.ButtonText} �</a></div>
          

</cs:ftcs>