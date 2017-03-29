<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld" %>
<%@ taglib prefix="ics" uri="futuretense_cs/ics.tld" %>
<%@ taglib prefix="dir" uri="futuretense_cs/dir.tld" %>
<%@ taglib prefix="name" uri="futuretense_cs/name.tld" %>
<%@ taglib prefix="xlat" uri="futuretense_cs/xlat.tld" %>
<%@ taglib prefix="asset" uri="futuretense_cs/asset.tld" %>
<%@ taglib prefix="satellite" uri="futuretense_cs/satellite.tld" %>
<%@ taglib prefix="xlat" uri="futuretense_cs/xlat.tld" %>
<%@ taglib prefix="render" uri="futuretense_cs/render.tld" %>
<%@ taglib prefix="property" uri="futuretense_cs/property.tld" %>

<%@ page import="java.util.*"%>
<%@ page import="COM.FutureTense.Interfaces.*"%>
<%@ page import="COM.FutureTense.Util.ftMessage"%>
<%@ page import="COM.FutureTense.Util.ftErrors"%>
<%@ page import="com.openmarket.directory.*"%>

<%@ page import="COM.FutureTense.Interfaces.FTValList"%>
<%@ page import="COM.FutureTense.Interfaces.ICS" %>
<%@ page import="COM.FutureTense.Interfaces.IList" %>
<%@ page import="COM.FutureTense.Interfaces.Utilities" %>
<%@ page import="com.openmarket.gator.blobservice.*"%>

<%@ page import="com.fatwire.util.BlobUtil"%>
<%@ page import="com.fatwire.ui.util.InsiteUtil"%>

<cs:ftcs>

<!-- 
Modified: Feb 19, 2015 
Reason:   Bug 20189863 - Unable to add a blob file for Blob field in Flex asset 
          
          Contract New Uploadder - the icon thumb nail always gets uploaded to TempObjects. 
          The posted is not the binary but the uploaded to tempobjects id. 
          The tempobjectid for every theme in essence icon. 
          This has improved performance and efficiancy. 

1) Addition of Site navigation icon
-->
<ics:callelement element="OpenMarket/Xcelerate/UIFramework/BasicEnvironment"/>
<HTML>
<HEAD>
	<TITLE><xlat:stream key="dvin/UI/ModifySitePlan" /></TITLE>
</HEAD>
<BODY>
	<div class="width-outer-70"> 
		<asset:load name="newSiteplanAsset" type="SiteNavigation" field="id" value='<%=ics.GetVar("spid")%>' editable="true"/>
		<asset:set name="newSiteplanAsset" field="name" value='<%=ics.GetVar("name")%>' />
		<asset:set name="newSiteplanAsset" field="description" value='<%=ics.GetVar("description")%>' />				
		
		<%			
				FTValList args = new FTValList();
	     		args.setValString("mode", "binary");		    
		        args.setValString("tempobjectid", ics.GetVar("SiteNavigation:urliconimage"));
		        args.setValString("fieldname", "SiteNavigation:urliconimage");
		        System.out.println("\nSiteplanMgt.DoModify12.2-JAG <MODIFY> Call AssetMakerProcessValues ")  ;  		
		    	ics.CallElement("fatwire/ui/util/AssetMakerProcessValues", args);			
		%>
		
		<ics:if condition='<%= ics.GetBin("SiteNavigation:urliconimage") != null %>' >
		<ics:then>	
			<asset:gather name="newSiteplanAsset" fieldlist ="urliconimage,urliconimage_file" prefix="SiteNavigation"/>
		</ics:then>
		<ics:else>
			<ics:if condition='<%= "True".equalsIgnoreCase(ics.GetVar("UploadDeleteurliconimage"))  %>' >
			<ics:then>
				<ics:setvar name="SiteNavigation:urliconimage" value =""/>
				<ics:setvar name="SiteNavigation:urliconimage_file" value =""/>
				<asset:gather name="newSiteplanAsset" fieldlist ="urliconimage,urliconimage_file" prefix="SiteNavigation"/>
			</ics:then>
			</ics:if>
		</ics:else>
		</ics:if>
		<ics:callelement element="OpenMarket/Xcelerate/AssetType/SiteNavigation/PreUpdate" >
			<ics:argument name="name" value='<%=ics.GetVar("name")%>' />
			<ics:argument name="updatetype" value="edit" />
		</ics:callelement>
		<ics:if condition='<%="true"!=ics.GetVar("isDuplicate")%>'>
		<ics:then>
			<asset:addsite name="newSiteplanAsset" pubid='<%=ics.GetVar("pubid")%>' />
			<asset:set name="newSiteplanAsset" field="devicegroups" value='<%=ics.GetVar("DGList") %>' />
			<!-- force status to ED -->
			<asset:set name="newSiteplanAsset" field="status" value="ED"/>
			<asset:save name="newSiteplanAsset"/>
			<ics:if condition='<%=0!=ics.GetErrno()%>'>
			<ics:then>
				<ics:callelement element="OpenMarket/Xcelerate/Actions/Util/ShowError">
					<ics:argument name="error" value="EnterAssetFailed"/>
					<ics:argument name="AssetType" value="SiteNavigation"/>
				</ics:callelement>
			</ics:then>
			<ics:else>
				<xlat:lookup key="dvin/UI/MobilitySolution/Siteplan/SiteplanSaved" varname="_XLAT_" />
				<ics:callelement element="OpenMarket/Xcelerate/UIFramework/Util/ShowMessage">
					<ics:argument name="msgtext" value='<%=ics.GetVar("_XLAT_") %>' />
					<ics:argument name="severity" value="info"/>
				</ics:callelement>
			</ics:else>
			</ics:if>
		</ics:then>
		<ics:else>
			<ics:callelement element="OpenMarket/Xcelerate/Actions/Util/ShowError">
				<ics:argument name="errno" value="-12075" />
				<ics:argument name="error" value="EnterAssetFailed"/>
				<ics:argument name="AssetType" value="SiteNavigation"/>
			</ics:callelement>
		</ics:else>
		</ics:if>
		
		<render:callelement elementname='OpenMarket/Xcelerate/AssetType/SiteNavigation/AdminForm'>
			<render:argument name="tool" value="SiteplanMgt" />
			<render:argument name="form" value="Home" />
			<render:argument name="pubid" value='<%=ics.GetVar("pubid")%>' />
		</render:callelement>
	</div>
	<!-- Added to refresh the tree nodes after site plan gets modified -->
	<property:get param="xcelerate.treeType" inifile="futuretense_xcel.ini" varname="proptreetype"/>
	<ics:callelement element='<%="OpenMarket/Xcelerate/UIFramework/UpdateTree" + ics.GetVar("proptreetype") %>' >
		<ics:argument name="__TreeRefreshKeys__" value='<%="Self:MobilitySitePlan_" + ics.GetVar("pubid") + ";Self:SitePlanSiteName"%>' />
	</ics:callelement>
</BODY>
</HTML>
</cs:ftcs>

