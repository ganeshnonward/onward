<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><cs:ftcs><%--
avisports/visitorLogout
INPUT: 
OUTPUT: 
--%>
<%
ics.RemoveSSVar("visitorname");

//There is no API to remove cookie, so setting null and accordingly application is treating it as cleared.
ics.SetCookie("EXTERNALID",null, 0 , null, null, false);
ics.SetCookie("svsvisitorid",null, 0 , null, null, false);
%>
</cs:ftcs>