<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld" %><cs:ftcs><%--
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
<%@ page import="java.util.LinkedHashMap,java.util.Map,java.util.HashMap,java.util.Enumeration,com.fasterxml.jackson.databind.ObjectMapper,com.fasterxml.jackson.databind.type.MapType, com.fasterxml.jackson.databind.type.SimpleType, COM.FutureTense.Properties.KeyValueStoreProvider,COM.FutureTense.Util.SecureUtils,oracle.fatwire.security.common.SecureUtility,java.io.IOException,javax.servlet.http.HttpServletResponse" %>

<render:getpageurl 
        pagename="avisports/visitorDownloadEBook"       
        outstr="downloadUrl" satellite="true"
        />
		
<%
String downLoadUrl = ics.GetVar("downloadUrl");
boolean result = Boolean.FALSE;
String visitorId = ics.getCookie(VISITORID_COOKIE_NAME);
try{
VisitorsClient client = new VisitorsClient(getAuthType(ics), VisitorServiceHelper.getInstance().getSvsUrl(ics));
		
		if(null == visitorId)
		{
			//GET NEW VISITOR ID
			visitorId = client.getVisitorId(request);
		}
		
		
			//CHECK IF VISITOR IS Anonymous Guest -> i.e. isExist returns false.
				
				boolean isExist = client.isExist(visitorId);
				
				if(!isExist)				
				{
					//REGISTER GUEST WITH THE visitorId					
					visitorId = client.registerGuest(visitorId);					
					
					//Add details collected in form as external attributes to the visitor
					  Map<String, String> formParams = new HashMap<String,String>();
					        formParams.put("fname",ics.GetVar("fname"));
							formParams.put("lname",ics.GetVar("lname"));
							formParams.put("gender",ics.GetVar("gender"));
							formParams.put("age",ics.GetVar("age"));
							formParams.put("email",ics.GetVar("email"));
							formParams.put("phone",ics.GetVar("phone"));
							formParams.put("company",ics.GetVar("company"));
							formParams.put("country",ics.GetVar("country"));
							formParams.put("zip",ics.GetVar("zip"));
					  
					
					client.saveExtendedAttributes(visitorId,formParams);
					
					//Set the visitor id in cookie
					ics.SetCookie(VISITORID_COOKIE_NAME, visitorId, 365*24*60*60 /*approximately 1 year of seconds*/, null, null, false);
		
				}
				result = Boolean.TRUE;
	}catch(Exception exp){
		 //URL is incorrect or VS is down. Just stop evaluation, Site shall not break due to VS absence.
		  //Log this

	}

	
		
%>
<render:satellitepage
        pagename="avisports/visitorDownloadEBook"/>
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