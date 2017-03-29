<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><cs:ftcs>
<div class="two-column">
	<c:if test="${articleName}!=null">
			<h2 class="title">${articleName} Articles</h2>
	</c:if>	
	<div class="post-wrapper" style="display:inline-block">
 			<div class="post">
				<fragment:include name="main1"/>
			</div>
	</div>
	<div class="post-wrapper" style="display:inline-block">
			<div class="post">
				<fragment:include name="main2"/>
			</div>
	</div>
	<div style="clear: both"></div>
</div>
<div class="post-wrapper">
		<c:forEach begin="0" end="${nbItems-1}" var="status">
			<div class="post">
				<fragment:include name="mainList" index="${status}"/>
			</div>
		</c:forEach>
</div>
<div class="post-wrapper">
		<c:forEach begin="${nbItems}" end="${mainListSize-1}" var="status">
			<div class="post">
				<fragment:include name="mainList" index="${status}"/>
			</div>
		</c:forEach>
</div>
</cs:ftcs>