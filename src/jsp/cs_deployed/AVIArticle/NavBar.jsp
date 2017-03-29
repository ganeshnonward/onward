<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><cs:ftcs>
	<div class="header-bar">
		<h1 class="logo"><a href="#">Avisports logo</a></h1>
	</div>
	<ul class="navigation">
		<li class="active">
			<a href="${suffixBasedNavigation[0]._link_}">
				<span>${suffixBasedNavigation[0].name}</span>
				<em class="arrow">&nbsp;</em>	
			</a>
			<c:forEach var="child" items="${suffixBasedNavigation[0].children}">
				<a href="${child._link_}">
					<span>${child.name}</span>
					<em class="arrow">&nbsp;</em>
				</a>
			</c:forEach>
		</li>
	</ul>
</cs:ftcs>
