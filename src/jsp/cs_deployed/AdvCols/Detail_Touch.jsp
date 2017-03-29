<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><cs:ftcs>
	<div class="post-wrapper">
		<c:forEach begin="0" end="${totalTouch-1}" var="status">
		<div class="post">
			<fragment:include name="mainListTouch" index="${status}"/>
		</div>
		</c:forEach>
	</div>
</cs:ftcs>