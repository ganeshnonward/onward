<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld" %>
<%@ taglib prefix="asset" uri="futuretense_cs/asset.tld" %>
<%@ taglib prefix="ics" uri="futuretense_cs/ics.tld" %>
<%@ taglib prefix="render" uri="futuretense_cs/render.tld" %>
<%@ taglib prefix="string" uri="futuretense_cs/string.tld" %>
<!-- 
	Build the default template url for a given article.
	INPUT: articleId - if not provided fall back to cid
	OUTPUT: articleUrl
-->
<cs:ftcs>
	<ics:removevar name="articleUrl" />
	<ics:ifempty variable="articleId">
	<ics:then>
		<ics:setvar name="articleId" value='<%=ics.GetVar("cid") %>' />
	</ics:then>
	</ics:ifempty>
	
	<asset:load name="article"  type="AVIArticle" objectid='<%=ics.GetVar("articleId")%>' />
	<asset:get listname="article" fieldname="template" output="template" />
	
	<ics:ifnotempty variable="template">
	<ics:then>
		<render:gettemplateurl	tname='<%= ics.GetVar("template")%>' 
								c="AVIArticle" 
								cid='<%=ics.GetVar("articleId") %>'
								ttype="CSElement"
								outstr="_articleUrl" >
			<render:argument name="p" value='<%=ics.GetVar("p") %>' />			
		</render:gettemplateurl>	
		<string:encode varname="articleUrl" variable="_articleUrl" />
	</ics:then>
	</ics:ifnotempty>
</cs:ftcs>