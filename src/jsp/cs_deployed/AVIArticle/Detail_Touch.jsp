<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"%>
<%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"%>
<%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<cs:ftcs>
	<fmt:formatDate value="${asset.postDate}" dateStyle="long" type="date" var="formattedDate" />
	<div class="article-detail">
		<h4 class="section-title">
			<fragment:include name="articleCategoryLinkTouch"/>
		</h4>
		
		<div class="article">
			<fragment:include name="articleRelatedImageSummaryTouch"/>
			<h2 class="headline">
				<insite:edit field="headline" value='${asset.headline}' params="{constraints: {formatLength: 'long'}, noValueIndicator: '[ enter headline ]'}"/>
			</h2>
			
			<h3 class="subheadline">
				<insite:edit field="subheadline" value="${asset.subheadline}" params="{noValueIndicator: '[ enter subheadline ]'}" />
			</h3>
			<div class="author">			  
		  		BY <insite:edit field="author" value='${asset.author}' params="{constraints: {formatLength: 'long'}, noValueIndicator: '[ enter author name ]'}"/>
			</div>
			<br/>
			<div class="body">
				<insite:edit field="body" value="${asset.body}" editor="ckeditor" 
					 params="{noValueIndicator: 'Enter body ', toolbar: 'Article', customConfig: '../avisports/ckeditor/config.js'}"/>			
			</div>		
			<c:choose>
				<c:when test="${not empty parentPageId}">
					<div>
						<div class="innerHeader"><h2 class="post-Innertitle">Related Articles</h2></div>
					</div>
					<c:forEach begin="0" end="${articleLinkTouch.size()-1}" var="status">
						<div class="innerArticleDiv">
							<div class="text">
								<fragment:include name="articleLinkTouch" index="${status}"/>
							</div>
							<div class="icon"></div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</div>
</cs:ftcs>