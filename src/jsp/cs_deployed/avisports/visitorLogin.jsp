<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><cs:ftcs><%--
 avisports/visitorLogin
INPUT: 
OUTPUT: 
--%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%!
/*
User Profile:
username -> use lower case
password -> password for the given username
externalId -> should match the values configured in the Cookie based identity provider configuration.

*/
    private static final Map<String,Map<String,String>> userInfo = new HashMap<String,Map<String,String>>(){{
           put("michael",new HashMap<String,String>(){{
               put("password","welcome1");
               put("externalId","92846742157");
           }});

           put("john",new HashMap<String,String>(){{
               put("password","welcome1");
               put("externalId","76529057689");
           }});

           put("emily",new HashMap<String,String>(){{
               put("password","welcome1");
               put("externalId","38976554301");
           }});

           put("patrick",new HashMap<String,String>(){{
               put("password","welcome1");
               put("externalId","016493763598");
           }});

       }};

%>
<%

boolean result = Boolean.FALSE;

String username = ics.GetVar("username");
String password = ics.GetVar("password");

 if (null != username && userInfo.containsKey(username.toLowerCase())) {

            Map<String, String> user = userInfo.get(username.toLowerCase());
			
            if (null != user && null != password && password.equals(user.get("password"))) {
                result = Boolean.TRUE;
                String cookieValue = user.get("externalId");
                ics.SetCookie("EXTERNALID", cookieValue, 365 * 24 * 60 * 60 /*approximately 1 year of seconds*/, null, null, false);
            }
        }
		ics.SetVar("result",String.valueOf(result));
%>
{
	
	"result": "<%= ics.GetVar("result") %>"
}
</cs:ftcs>