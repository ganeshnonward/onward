<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld" %>
<%@ taglib prefix="ics" uri="futuretense_cs/ics.tld" %>
<%@ taglib prefix="render" uri="futuretense_cs/render.tld" %>
<%//
// avisports/evaluateVisitorStatus
//
// INPUT
//
// OUTPUT
//%>
<%@ page import="COM.FutureTense.Interfaces.FTValList" %>
<%@ page import="COM.FutureTense.Interfaces.ICS" %>
<%@ page import="COM.FutureTense.Interfaces.IList" %>
<%@ page import="COM.FutureTense.Interfaces.Utilities" %>
<%@ page import="COM.FutureTense.Util.ftErrors" %>
<%@ page import="COM.FutureTense.Util.ftMessage"%>
<%@ page import="oracle.fatwire.integrations.svs.VisitorServiceHelper, com.oracle.sites.visitors.client.VisitorsClient, com.oracle.sites.visitors.client.auth.AuthType,      com.oracle.sites.visitors.client.auth.HttpAuthentication, com.oracle.sites.visitors.client.auth.NoAuthentication,com.oracle.sites.visitors.client.auth.VisitorsHttpAuthentication" %>
<%@ page import="java.util.LinkedHashMap,java.util.Map,com.fasterxml.jackson.databind.ObjectMapper,com.fasterxml.jackson.databind.type.MapType, com.fasterxml.jackson.databind.type.SimpleType, COM.FutureTense.Properties.KeyValueStoreProvider,COM.FutureTense.Util.SecureUtils,oracle.fatwire.security.common.SecureUtility,java.io.IOException" %>


<cs:ftcs>
<html>

<%
if("true".equals(ics.GetProperty("enableVSDemo"))) { //Only if demo has been enabled explicitly
  String visitorID = null;
  if(isAuthenticatedVisitor(ics))
{
   // authenticated visitor,
	// nothing to do, UI will use same session variable to decide if to show login-in link or not
}
else if(requestContainsAuthHints(ics))
{

 /* user is just coming after re-direction(302) by server after successful login. With EXTERNALID  cookie available, do below -
  call visitor services helper API getProfile(...), passing-in param updated=true which will take care of cookie linking. This API already  takes care of linking authenticated visitor ID with guest visitor ID in  cookie set by post registration page, if any.
 Above call gives visitor profile. set name from profile into session so that a) UI can show link 'Hi <username> in this request' and b) first IF succeeds during all next requests */
            try{ 
			Map<String, Object> profile = VisitorServiceHelper.getInstance().getProfile(ics, AGGREGATION_TEMPLATE_NAME, Boolean.TRUE);

            if (null != profile && null != profile.get("name")) 
			{
             String   visitorName = (String) profile.get("name");

                //Set visitor name into session for use on the UI.
                ics.SetSSVar("visitorname", visitorName);
            }
			}catch(Exception exp){
		 //URL is incorrect or VS is down. Just stop evaluation, Site shall not break due to VS absence.
		  //Log this

	}
}

}
  %>
<render:satellitepage pagename='<%=ics.GetVar("childpagename")%>' packedargs='<%=ics.GetVar("packedargs")%>'>
      <render:argument name='c' value='<%=ics.GetVar("c")%>'/>
      <render:argument name='cid' value='<%=ics.GetVar("cid")%>'/>
      <render:argument name='p' value='<%=ics.GetVar("p")%>' />
	  <render:argument name='ab' value='<%=ics.GetVar("ab")%>' />
      <render:argument name="locale" value='<%=ics.GetSSVar("preferred_locale")%>'/>
</render:satellitepage>
  
  <%!
    private static final String PROPERTY_SVS_SERVICE_AUTHTYPE = "visitors.rest.authtype";
    private static final String PROPERTY_SVS_AUTHTYPE_HTTP = "HttpAuthentication";
	private static final String PROPERTY_SVS_AUTHTYPE_VISITORS = "VisitorsHttpAuthentication";
	private static final String PROPERTY_SVS_AUTH_HEADER = "visitors.rest.authheader";
	private static final String PROPERTY_SVS_AUTH_ALIAS = "visitors.rest.authalias";
	private static final String VISITORID_COOKIE_NAME = "svsvisitorid";
	private static final String AGGREGATION_TEMPLATE_NAME = "VisitorNameAggregationTemplate";
	
	private boolean isAuthenticatedVisitor(ICS ics) {
	 return (ics.GetSSVar("visitorname") != null );
	}
	
	private boolean requestContainsAuthHints(ICS ics) {
	return (ics.getCookie("EXTERNALID") != null);
	}
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
  </html>
</cs:ftcs>