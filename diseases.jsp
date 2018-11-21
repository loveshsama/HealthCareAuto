<!DOCTYPE html>
<html>
<head>
	<title>Diseases</title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width,intial-scale=1">
  	<link rel="stylesheet" type="text/css" href="doctors.css">
</head>
<%
  	response.setHeader("Cache-Control","no-cache");
  	response.setHeader("Cache-Control","no-store");
  	response.setHeader("Pragma","no-cache");
  	response.setDateHeader ("Expires", 0);
   	String disable_back = "" + session.getAttribute("name");
   	if(disable_back.equals("null")){
   		response.sendRedirect("index.html");
   		}
%>
<body>
<div class="topnav">
		<a href="welcome.jsp">HCA</a>		
	    <a href="newuser.jsp" style="float:right;">AddUser</a>
		<a href="logout.jsp" style="float: right;">Logout</a>
		<a href="#" style="float: right;">Hello <%=disable_back%></a>
</div>
<div class="row">
<div class="leftcolumn">
		<a href="dash.jsp"><h4>Dashboard</h4></a><br><br><br>
		<a href="user.jsp"><h4>Users</h4></a><br><br>
		<a href="hospital.jsp"><h4>Hospital</h4></a><br><br><br>
		<a href="doctors.jsp"><h4>Doctors</h4></a><br><br><br>
		<a href="diseases.jsp"><h4>Diseases</h4></a>
	<br><br><br><br><br><br><br><br><br>
</div>
<div id="rightcolumn">
<div id="formdiv">
	<form method="POST" action="add_diseases.jsp">
	<caption><h2 align="center">Diseases Information</h2></caption><br>
	<label class="lb"><b>Disease Name</b></label><br>
		<input class="inp" type="text" placeholder="Enter the Name of Disease" name="dname" required><br><br>
	<label class="lb"><b>Symptom 1</b></label><br>
		<input class="inp" type="text" placeholder="Enter your Symptom" name="symptom1" required><br><br>
		<label class="lb"><b>Symptom2</b></label><br>
		<input placeholder="Enter your Symptom" class="inp" type="text" name="symptom2" required><br><br>
		<label class="lb"><b>Symptom3</b></label><br>
		<input class="inp" type="text" placeholder="Enter your Symptom" name="symptom3" required><br><br>
		<label class="lb"><b>Type</b></label><br>
		<input class="inp" type="text" name="type" placeholder="Enter Type" required><br><br>
		<label class="lb"><b>Description</b></label><br>
		<textarea rows="4" cols="90" class="inp" name="description" ></textarea>
		<button id="sub" style="text-align: center;width: 98%;margin-left: 1%;margin-top: 1%; height: 50px;"><b>Submit</b></button>
	</form><br><br><br><br><br><br>
</div>
</div>
</div>
<div class="footer">
	<p>&copy Lovesh and Harshit 2018</p>
</div>
</body>
</html>