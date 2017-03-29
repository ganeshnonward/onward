<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><cs:ftcs><%--
INPUT: 
OUTPUT: 
--%>
<render:callelement elementname="OP/Common/GetAttributeValues" scoped="global">	
		<ics:argument name="attributes" value="Image,AltText" />
		<ics:argument name="prefix" value="banner" />
		<ics:argument name="type" value="OP_Digital_C" />
		<ics:argument name="id" value='<%=ics.GetVar("cid") %>' />
		<ics:argument name="site" value='<%=ics.GetVar("site")%>' />
	</render:callelement>
	
	
</cs:ftcs>