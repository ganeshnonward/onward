<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld"
%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"
%><cs:ftcs>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<render:callelement elementname="fatwire/includeABTesting" args="c,cid,pagename"/>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/avisports/css/all.css"/>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/avisports/css/form.css"/>
	<insite:ifedit>
		<style>
		.fw .aviHome2TopArticle .emptyIndicator {height: 40px !important;}
		.fw .aviHome2Banner .emptyIndicator, .fw .aviHomeBanner .emptyIndicator {height: 300px !important;}
		.fw .aviHomeDetailImage .emptyIndicator {height: 170px !important;}
		.fw .aviArticleCategory {float:left; width: 130px !important; margin: 0}
		.fw .aviArticleCategory .emptyIndicator {height: 15px !important; width: 130px !important; float: left}
		.fw .aviSectionBanner .emptyIndicator {height: 216px !important;}
		.fw .aviHomeTopStories {width: 390px; height: 90px !important;}
		</style>
	</insite:ifedit>
	<title>${title}</title>
	<meta name="description" content="${description}" />
</cs:ftcs>