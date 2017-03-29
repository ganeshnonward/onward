<%@taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@taglib prefix="ics" uri="futuretense_cs/ics.tld"%>
<%@taglib prefix="satellite" uri="futuretense_cs/satellite.tld"%>
<%@page import="java.util.*"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.fatwire.cs.ui.framework.UIException"%>
<%@ page import="COM.FutureTense.Interfaces.ICS" %>

<cs:ftcs>

<!--
Purpose:   In this tree action phase the following tasks
must be performed.

1) Determine if the logged in user has at the
minimum access to at least one root tree tab
then user can access the tree pane..
-->
<%

try{

    //get tabs accessible by current user
    List<String> userTabs = (List<String>)request.getAttribute("userTabs");

	// Get the panes content rendering data
	Map<String,Object> content = (Map<String,Object>)request.getAttribute("content");

	// We are OOBOX Tree Rendering ELEMENT get the content tree data Map
	Map<String,Object> treeData = (Map<String,Object>)content.get("tree");

	//Set the tree map data now that one or both canAccess and datastoreUrl has be set
	request.setAttribute( "tree", treeData );

    /// By Default user can not access any tabs
    Boolean  canAccess = false ;

	// Get the included root tabs for this tree
	List<String> includedTabs = (List<String>)treeData.get("includedTabs") ;

    //Get the set of excluded root tabs for this tree
    List<String> excludedTabs = (List<String>)treeData.get("excludedTabs") ;

    //list of tab uids which will be actually rendered
    List<String> filteredTabs = new ArrayList<String>();

    //Consider included tabs if given, else consider excluded tabs. But not both, which leads to inconsistency
    if ( includedTabs != null && !includedTabs.isEmpty()) {
        for( String tabUID: includedTabs) {
            if(userTabs.contains(tabUID)) {
                filteredTabs.add( tabUID );
            }
        }
    }
    else if ( excludedTabs != null && !excludedTabs.isEmpty()) {
        for( String tabUID: userTabs) {
            if( !excludedTabs.contains( tabUID ) ) {
                filteredTabs.add( tabUID );
            }
        }
    }

	// make the list of tabs available as a comma-separated string
    treeData.put("tabs", StringUtils.join(filteredTabs, ","));

    // make the list of tabs that will be excluded in essence
    // filtered out as a comma-separated string
    treeData.put("excludetabs", StringUtils.join(excludedTabs, ","));

    // user has access to the pane if it can access at least one tab in the list
    if( !filteredTabs.isEmpty() ) {
        canAccess = true;
    }

    // Place if user has permission at least one tab ...
    treeData.put("canAccess", canAccess);

    // Does the user have access to the tree
    // Via the UIController
    if ( canAccess ) {
	%>
		<!--   Create the Tree Data Store URL   -->
		<satellite:link pagename="fatwire/ui/controller/controller" outstring="datastoreUrl" assembler="query">
			<satellite:argument name="elementName" value="${tree.datastore}" />
            <satellite:argument name="includedTabs" value='<%= StringUtils.join(includedTabs, ",")%>' />
            <satellite:argument name="excludedTabs" value='<%= StringUtils.join(excludedTabs, ",")%>' />
			<satellite:argument name="responseType" value="json" />
			<satellite:argument name="treeid" value='${tree.id}' />
		</satellite:link>
	<%
	treeData.put("datastoreUrl",ics.GetVar( "datastoreUrl" )) ;
    }
}
catch(UIException e) {
	request.setAttribute(UIException._UI_EXCEPTION_, e);
	throw e;
} catch(Exception e) {
	UIException uie = new UIException(e);
	request.setAttribute(UIException._UI_EXCEPTION_, uie);
	throw uie;
}
%>
</cs:ftcs>
