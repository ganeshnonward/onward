<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><cs:ftcs>
	<div id="top-bar">
		<div id="logo">
			<a href="${suffixBasedNavigation[0]._link_}"><div></div></a>
		</div>
		<div id="nav-icon-wrap" onClick='toggleNavigationBar();'>
			<a><div id="nav-icon" class="close"></div></a>
		</div>
	</div>
	<div id="nav-container">
		<c:forEach var="child" items="${suffixBasedNavigation[0].children}">
	<%-- 		${child._link_} --%>				
			<a href="${child._link_}">
				<img alt="${child.name}" src="${child.BANNER_IMAGE.imageFile_bloblink_}">
			</a>
		</c:forEach>
	</div>

</cs:ftcs>
