<%@page import="COM.FutureTense.Interfaces.Utilities"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="asset" uri="futuretense_cs/asset.tld"
%><%@ taglib prefix="assetset" uri="futuretense_cs/assetset.tld"
%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><%@ page import="	com.fatwire.assetapi.data.*,
                   com.fatwire.assetapi.*,
                   com.fatwire.system.*,
                   com.openmarket.xcelerate.asset.*,
                   java.util.*,
                   org.apache.commons.lang.*"
%><cs:ftcs><%--
INPUT: 
OUTPUT: 
--%>

	<% 
	// A Utility element which scatters asset data in the request scope
		// for consumption by EL
	Session ses = SessionFactory.getSession(ics);
	AssetDataManager mgr = (AssetDataManager)ses.getManager(AssetDataManager.class.getName());
	String type = ics.GetVar("type");
	String id = ics.GetVar("id");
	id = (StringUtils.isEmpty(id) ? ics.GetVar("cid") : id);
	type = (StringUtils.isEmpty(type) ? ics.GetVar("c") : type);
	String prefix = ics.GetVar("prefix");
	String attributes = ics.GetVar("attributes");
	String parentPrefix = "Group_";
	String assocPrefix = "Association-named:";
	ArrayList<AssetId> allModules = new ArrayList<AssetId>();
	
	String groupAttributes = "";
	if(Utilities.goodString(ics.GetVar("groupattributes"))){
		groupAttributes = ics.GetVar("groupattributes");
	}
	//ArrayList<String> moduleAttributes = new ArrayList<String>();
List<String>  moduleAttributes = new ArrayList<String>();
	 moduleAttributes = Arrays.asList(groupAttributes.split(","));
	//moduleAttributes.add("NMI_l_modules");
	//moduleAttributes.add("NMI_b_modules");
	//moduleAttributes.add("NMI_r_modules");
	if(StringUtils.isEmpty(attributes)){
		attributes = "subtype,template,name";
	}else{
		attributes+=",subtype,template,name";
	}
	if (StringUtils.isNotEmpty(type) && StringUtils.isNotEmpty(id) && StringUtils.isNotEmpty(attributes)) {
		AssetId assetId =null;
		try{
			try{
				assetId = new AssetIdImpl( type, Long.valueOf(id));
			}catch(Exception e){
				ics.LogMsg("Exception while getting asset in getAttributeValues for " + type + ":"+id);
			}
			String[] attributeNames = StringUtils.split(attributes, ",");
			prefix = StringUtils.isNotEmpty(prefix) ? prefix : "asset";
			List<String> attributeList = new ArrayList<String>(); //Arrays.asList(attributeNames);
			for (String name: attributeNames) {
				if (!name.startsWith(parentPrefix) && !name.startsWith(assocPrefix)) attributeList.add(name);
			}
			AssetData data = null;
			try{
				data = mgr.readAttributes(assetId, attributeList);
			}catch(Exception e){
				//ics.LogMsg("not able to get value for attributes in getAttributeValues for " + type + ":"+id + " for attributes :" + attributes);
			}
			if(data!=null){
				Map map = new HashMap();
				for (String name: attributeNames) {
					if (name.startsWith(parentPrefix)) {
						List<AssetId> parents = data.getImmediateParents(name.substring(parentPrefix.length()));
						if (parents == null || parents.size() == 0) {
							map.put(name, Collections.emptyList());
						}
						else {
							map.put(name, parents.size() == 1 ? parents.get(0) : parents);
						}
					}
					else if (name.startsWith(assocPrefix)) {
						String assocName = name.substring(assocPrefix.length());
						List<AssetId> relatedAssets = data.getAssociatedAssets(assocName);
						if (relatedAssets != null) {
							
							map.put(assocName, relatedAssets);
						}
					}
					else {
						AttributeData attributeData = data.getAttributeData(name);
						if (attributeData != null) {
							map.put(name, attributeData.getData());
							if (moduleAttributes.contains(name)){
								allModules.addAll(attributeData.getDataAsList());
								
								
							}
						}
					}
				}
				map.put("allmodules", allModules);
				
				map.put("allmodulessize", allModules.size());
				request.setAttribute(prefix, map);
			}else{
				request.removeAttribute(prefix);
			}
		}catch(Exception e){
			ics.LogMsg("Exception in getAttributeValues");
		}
	}
	else {
		request.removeAttribute(prefix);
	}

%>

</cs:ftcs>