<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld" %>
<%@ taglib prefix="ics" uri="futuretense_cs/ics.tld" %>
<%@ taglib prefix="render" uri="futuretense_cs/render.tld" %>
<%@ taglib prefix="satellite" uri="futuretense_cs/satellite.tld" %>
<%//
// avisports/visitorUI
//
// INPUT
//
// OUTPUT
//%>
<%@ page import="COM.FutureTense.Interfaces.FTValList" %>
<%@ page import="COM.FutureTense.Interfaces.ICS" %>
<%@ page import="COM.FutureTense.Interfaces.IList" %>
<%@ page import="COM.FutureTense.Interfaces.Utilities" %>
<%@ page import="COM.FutureTense.Util.ftErrors" %>
<%@ page import="COM.FutureTense.Util.ftMessage"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<cs:ftcs>
	<ics:if condition='<%="true".equals(ics.GetProperty("enableVSDemo"))%>'> 
	
	<% /* set property value to true  for integrated demo with Visitor Services, assuming configuration is present as expected by demo. */ %>
         
		 <ics:then>
			<render:getpageurl 
					pagename="avisports/visitorLogin"       
					outstr="loginUrl"
					/>
			<render:getpageurl 
					pagename="avisports/visitorLogout"       
					outstr="logoutUrl"
					/>
			<render:getpageurl 
					pagename="avisports/visitorDownloadEBook"       
					outstr="downloadUrl"
					/>
			<script>

			function login() {
				
				var xmlhttp = new XMLHttpRequest();
					xmlhttp.onreadystatechange = function() {
						if (xmlhttp.readyState == 4 ) {
						if(xmlhttp.status == 200){
							var  responseObj= JSON.parse(xmlhttp.responseText);
							
							if(responseObj.result=="true"){
								location.reload();					
							}else{
								alert("Incorrect username/ password");
							}
						}else{
						console.log(xmlhttp.status);
						console.log(xmlhttp.responseText);
						}
						   
						}
					};
					xmlhttp.open("POST", "<%=ics.GetVar("loginUrl")%>"+"&username="+document.getElementById("username").value+"&password="+document.getElementById("password").value, true);
					xmlhttp.setRequestHeader("X-CSRF-Token", '<%=ics.GetSSVar("X-CSRF-Token")%>')
					xmlhttp.send();
				
				
			}

			function logout() {
				var xmlhttp = new XMLHttpRequest();
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4 ) {
						if(xmlhttp.status == 200){
							location.reload();								
						} else {
							console.log(xmlhttp.status);
							console.log(xmlhttp.responseText);
						}						   
					}
				};
				xmlhttp.open("POST", "<%=ics.GetVar("logoutUrl")%>", true);
				xmlhttp.setRequestHeader("X-CSRF-Token", '<%=ics.GetSSVar("X-CSRF-Token")%>')
				xmlhttp.send();
			}
				
			function onKeyPress(e) {
				if(e.keyCode === 13){
            		login();
        		}
				return false;
			}

			</script>


			<style>
				.visitorUI {
					height: 35px;
					margin: 8px 0;
				}
				.visitorName, .loginWrapper, .logout, .download {
					height: 30px;
					float: right;
					line-height: 30px;
					margin-left: 5px;
				}
				.visitorName {
					text-transform: capitalize;
					font-weight: bold;
				}
				.login, .download, .logout {
					background: #265584;
					color: white;
					padding: 0 10px;
					border-radius: 5px;
					cursor: pointer;
					-webkit-transition: background-color .3s;
					transition: background-color .3s;
				}
				.login:hover,
				.download:hover,
				.logout:hover {
					background: #3472b0;
					text-decoration: none;
				}
				.loginWrapper {
					position: relative;
				}
				.loginDialog {
					display: none;
					z-index: 999999;
					position: absolute;
					background: #fafafa;
					border: 1px solid #dadada;
					border-radius: 3px;
					padding: 10px;
					color: black;
					top: 32px;
				}
				.loginDialog label {
					display: block;
					font-size: 12px;
					margin-bottom: 5px;
				}
				.loginDialog input {
					border: 1px solid #dadada;
					padding: 5px;
					margin-bottom: 5px;
				}
				.loginDialog button {
					border: 0;
					border-radius: 5px;
					background: #265584;
					font-size: 11px;
					color: #fff;
					padding: 10px;
					cursor: pointer;
				}
				.close {
					text-align: center;
					width: 20px;					
					height: 20px;
					line-height: 20px;
					position: absolute;
					top: 3px;
					right: 5px;
					cursor: pointer;					
				}
			</style>

			<div class="visitorUI">
				<%

			String visitorName = ics.GetSSVar("visitorname");

			%>
				
				<a class="download" href="<%=ics.GetVar("downloadUrl")%>" target="_blank">DOWNLOAD E-BOOK</a>
				
				<%
				if(null == visitorName)
				{ 
				%>
				
				<div class="loginWrapper">
					<div class="login" onclick="document.getElementsByClassName('loginDialog')[0].style.display='block';document.getElementById('username').focus();">LOGIN</div>
					<div class="loginDialog" onclick="event.stopPropagation();false;">
						<div class="close" onclick="document.getElementsByClassName('loginDialog')[0].style.display='none';event.stopPropagation();false;">X</div>
						<table >
							<tr>
								<td>
									<label for="username">User Name</label>
									<input type="text" id="username" required="true"/>
								</td>
							</tr>
							<tr>
							   <td>
								   <label for="password">Password</label>
								   <input type="password" id="password" required="true" onkeypress="onKeyPress(event)"/>
								</td>
							</tr>
							<tr>
								<td><button onclick="login();">LOGIN</button></td>								
							</tr>
						</table>
					</div>
				</div>
				<div class="visitorName">Hi Guest</div>
				
				<%
				}
				else
				{
				%>
				<div class="logout" onclick="logout();">LOGOUT</div>
				<div class="visitorName">Hi <%=visitorName%></div>
				<%
				}
				%>
				
				
			</div>
		</ics:then>		   
	</ics:if>
</cs:ftcs>