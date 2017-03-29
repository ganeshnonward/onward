<%@ taglib prefix="cs" uri="futuretense_cs/ftcs1_0.tld"
%><%@ taglib prefix="ics" uri="futuretense_cs/ics.tld"
%><%@ taglib prefix="satellite" uri="futuretense_cs/satellite.tld"
%><%@ taglib prefix="render" uri="futuretense_cs/render.tld" %>
<cs:ftcs><%--
INPUT: 
OUTPUT: 
--%>
<render:getpageurl 
        pagename="avisports/visitorRegister"       
        outstr="registrationUrl"
        />
<!doctype html>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/avisports/css/all.css"/>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/avisports/css/form.css"/>
<style>
form {
	width: 480px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #dadada;
}
h3 {
	font-size: 16px;
	color: #265584;
	margin: 0 0 20px;
	padding-bottom: 10px;
	border-bottom: 1px solid #bababa;
}
.form-field {
	margin-bottom: 10px;
}
input {    
	width: 240px;
    margin: 5px;
	padding: 5px;
    border-radius: 3px;
    border: 1px solid #dadada;    	
}
label {
	width: 120px;
	text-align: right;
	display: inline-block;
	margin-right: 8px;
	color: #333;
}
.personal, .contact {
	font-size: 14px;
	font-weight: bold;
	color: #265584;
	margin: 15px 0;
}
.required {    
    color: red;
    font-size: 20px;
	vertical-align: middle;
}
button.submit {
	border: 0;
	border-radius: 5px;
	background: #265584;
	color: #fff;
	padding: 10px;
	margin-left: 140px;
	cursor: pointer;
}
</style>
</head>
<body>
<satellite:form action='<%=ics.GetVar("registrationUrl")%>' method="post">

<h3>Complete the registration form to download the e-book</h3>
	
<div class="personal">Personal Information</div>
	
<div class="form-field">
	<label for="fname">FIRST NAME</label>
	<input id="fname" name="fname" required="true" autofocus="autofocus"/> <span class="required">*</span>
</div>
<div class="form-field">
	<label for="lname">LAST NAME</label>
	<input id="lname" name="lname"/>
</div>
<div class="form-field">
	<label for="gender">GENDER</label>
	<input id="gender" name="gender" list="genders"/>
	<datalist id="genders">
  		<option value="Male">
  		<option value="Female">
	</datalist>
</div>
<div class="form-field">
	<label for="age">AGE</label>
	<input id="age" name="age" type="number"/>
</div>

<div class="contact">Contact Information</div>

<div class="form-field">
	<label for="email">EMAIL</label>
	<input type="email" id="email" name="email" required="true"/> <span class="required">*</span>
</div>
<div class="form-field">
	<label for="phone">PHONE</label>
	<input type="tel" id="phone" name="phone"/>
</div>
<div class="form-field">
	<label for="company">COMPANY</label>
	<input id="company" name="company"/>
</div>
<div class="form-field">
	<label for="country">COUNTRY</label>
	<input id="country" name="country"/>
</div>
<div class="form-field">
	<label for="zip"> ZIPCODE</label>
	<input id="zip" name="zip"/>
</div>
<div class="form-field">
	Fields marked with <span class="required">*</span> are mandatory.<br/><br/>
	<button class="submit" type="submit">REGISTER</button>
</div>
</satellite:form>
</body>
</html>
</cs:ftcs>