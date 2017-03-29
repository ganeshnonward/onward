<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><%@ taglib prefix="asset" uri="futuretense_cs/asset.tld"
%><cs:ftcs><%--
INPUT: 
OUTPUT: 
--%>
<%@ page import="COM.FutureTense.Interfaces.FTValList" %>
<%@ page import="COM.FutureTense.Interfaces.ICS" %>
<%@ page import="COM.FutureTense.Interfaces.IList" %>
<%@ page import="COM.FutureTense.Interfaces.Utilities" %>
<%@ page import="COM.FutureTense.Util.ftErrors" %>
<%@ page import="COM.FutureTense.Util.ftMessage"%>
<%@ page import="oracle.fatwire.integrations.svs.VisitorServiceHelper, com.oracle.sites.visitors.client.VisitorsClient, com.oracle.sites.visitors.client.auth.AuthType,      com.oracle.sites.visitors.client.auth.HttpAuthentication, com.oracle.sites.visitors.client.auth.NoAuthentication,com.oracle.sites.visitors.client.auth.VisitorsHttpAuthentication" %>
<%@ page import="java.util.LinkedHashMap,java.util.Map,com.fasterxml.jackson.databind.ObjectMapper,com.fasterxml.jackson.databind.type.MapType, com.fasterxml.jackson.databind.type.SimpleType, COM.FutureTense.Properties.KeyValueStoreProvider,COM.FutureTense.Util.SecureUtils,oracle.fatwire.security.common.SecureUtility,java.io.IOException" %>

<%
String visitorName = ics.GetSSVar("visitorname");
String visitorId = ics.getCookie(VISITORID_COOKIE_NAME);

	if(null == visitorId)
	{
		// NEW VISITOR , SHOW REGISTRATION FORM
		%>
		<ics:callelement element="avisports/visitorRegisterForm">
			 
		</ics:callelement>
		<%
	}
	else
	{
		//CHECK IF VISITOR IS GUEST
		VisitorsClient client = new VisitorsClient(getAuthType(ics), VisitorServiceHelper.getInstance().getSvsUrl(ics));
		boolean isExist = client.isExist(visitorId);
		
		if(isExist)
		{
			//Registered / authenticated visitor, download e-book.
			%>

<asset:load 
      name="DownloadEBook" 
      type="FileResource" field="name" value="VisitorEBook"/>
 
<render:getbloburl   
        field="urlbundle"
        blobheader='application/pdf'
        asset='DownloadEBook'
        outstr="theURL"/>



<!doctype html>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/avisports/css/all.css"/>
<style>
body {
	margin: 0 auto;
	text-align: center;
}
.download {
	font-size: 20px;
	margin-top: 100px;
	color: #265584;
}
</style>
</head>
<body onload="document.location.assign('<%=ics.GetVar("theURL")%>');">
	<div class="download">E-Book will be downloaded shortly.</div>
</body></html>
			<%
			
		}
		else
		{
			//GUEST VISITOR, SHOW REGISTRATION FORM
			%>
				<ics:callelement element="avisports/visitorRegisterForm">
			 
				</ics:callelement>
			<%
		}
	}
%>

<%!
    private static final String PROPERTY_SVS_SERVICE_AUTHTYPE = "visitors.rest.authtype";
    private static final String PROPERTY_SVS_AUTHTYPE_HTTP = "HttpAuthentication";
	private static final String PROPERTY_SVS_AUTHTYPE_VISITORS = "VisitorsHttpAuthentication";
	private static final String PROPERTY_SVS_AUTH_HEADER = "visitors.rest.authheader";
	private static final String PROPERTY_SVS_AUTH_ALIAS = "visitors.rest.authalias";
	private static final String VISITORID_COOKIE_NAME = "svsvisitorid";
	private static final String AGGREGATION_TEMPLATE_NAME = "VisitorAggTemplate";
	
	
  private AuthType getAuthType(ICS ics) {
		String authTypeName = ics.GetProperty(PROPERTY_SVS_SERVICE_AUTHTYPE);

		AuthType authType = null;
		if(PROPERTY_SVS_AUTHTYPE_HTTP.equals(authTypeName)) {
			String username = getUsername();
			String password = getPassword();
			authType = new HttpAuthentication(username, password);
		} else if(PROPERTY_SVS_AUTHTYPE_VISITORS.equals(authTypeName)) {
			String username = getUsername();
			String password = getPassword();
			VisitorsHttpAuthentication visitorsHttpAuthentication = new VisitorsHttpAuthentication(username, password);
			String authHeader = ics.GetProperty(PROPERTY_SVS_AUTH_HEADER);
			if( Utilities.goodString(authHeader) ) {
				visitorsHttpAuthentication.setHeaderName(authHeader);
			}
			String authAlias = ics.GetProperty(PROPERTY_SVS_AUTH_ALIAS);
			if( Utilities.goodString(authAlias) ) {
				visitorsHttpAuthentication.setAuthAlias(authAlias);
			}
			authType = visitorsHttpAuthentication;
		} else {
			authType = new NoAuthentication();
		}

		return authType;
	}

	String getUsername() {
        return KeyValueStoreProvider.getStore().getValue(SecureUtils.WCSITES_VISITORS_AUTH_USER).toString();
	}

	String getPassword() {
		return String.valueOf(SecureUtility.INSTANCE.getPasswordOfUserKey(SecureUtils.WCSITES_VISITORS_AUTH_USER));
	}
  
  private Map<String, Object> parse(String aggregateProfileString) {
		try {
			return new ObjectMapper().readValue(aggregateProfileString,
					MapType.construct(LinkedHashMap.class,
							SimpleType.construct(String.class),
							SimpleType.construct(Object.class)
			));
		} catch (IOException cause) {
			return null;
		}
	}
  %>
</cs:ftcs>