<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="insite" uri="futuretense_cs/insite.tld"
%><%@ taglib prefix="fragment" uri="futuretense_cs/fragment.tld"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><cs:ftcs>

<fragment:include name="checkCommunity"/>

<fragment:list name="sideBarRelatedStoriesProto">
	<div class="box">
	<h2 class="title">Related Stories</h2>
		<c:forEach begin="0" end="${sideBarRelatedStories.size()-1}" var="story">
			<fragment:include name="sideBarRelatedStories" index="${story}"/>
		</c:forEach>
	</div>
</fragment:list>

<fragment:list name="sideBarRelatedLinksProto">
	<div class="box">
	<h2 class="title">Related Links</h2>
		<ul>
			<c:forEach begin="0" end="${sideBarRelatedLinks.size()-1}" var="link">
				<fragment:include name="sideBarRelatedLinks" index="${link}"/>
			</c:forEach>
		</ul>
	</div>
</fragment:list>

<c:choose>
	<c:when test="${communityExists}">
		<style>
		#poll .fw_poll {
		  font: 11px Arial, Helvetica, sans-serif;
		  color:
		}
		#poll .fw_poll .fw_polls_widgetBorder {
		   background-color: #eff0f0;
		}
		#poll .fw_poll .fw_polls_themeOne_Heading {
		   background-color: #D5D5D5;
		   margin-bottom: 15px;
		}
		#poll .fw_poll .fw_polls_themeOne_questionBox {
		   padding: 0 40px 10px 0;
		}
		#poll .fw_poll .fw_polls_themeOne_checkBoxText {
		  font-family: Arial;
		  font-weight: bold; 
		}
		#poll .fw_poll.fw_poll_open_design .fw_polls_themeOne_HeadingText {
		  color: black;
		}
		#poll .fw_poll .fw_poll_open_design .fw_polls_themeOne_checkBoxText {
		  color: black;
		}

		#poll .fw_poll .fw_poll_open_design .fw_polls_leftButton,
		#poll .fw_poll .fw_poll_open_design .fw_polls_leftButtonHover,
		#poll .fw_poll .fw_poll_open_design .fw_polls_leftButtonClick {
		  background:url("../../static/poll/1.0/images/buttons/button_left_blue.png") no-repeat;
		}

		#poll .fw_poll .fw_poll_open_design .fw_polls_middleButton,
		#poll .fw_poll .fw_poll_open_design .fw_polls_middleButtonHover,
		#poll .fw_poll .fw_poll_open_design .fw_polls_middleButtonClick {
		  background:url("../../static/poll/1.0/images/buttons/button_middle_blue.png") repeat-x;
		}
		#poll .fw_poll .fw_poll_open_design .fw_polls_rightButton,
		#poll .fw_poll .fw_poll_open_design .fw_polls_rightButtonHover,
		#poll .fw_poll .fw_poll_open_design .fw_polls_rightButtonClick {
		  background:url("../../static/poll/1.0/images/buttons/button_right_blue.png") no-repeat;
		}

		</style>
		<div id="poll">
			<fragment:include name="pollFragment" emptytext="[ Drop Poll ]" />
		</div>
	</c:when>
</c:choose>
</cs:ftcs>