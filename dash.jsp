<!DOCTYPE html>
<html lang="en">
<head>
	<title>Dashboard</title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width,intial-scale=1">
	  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	  <link rel="stylesheet" type="text/css" href="dash.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
<%
  	response.setHeader("Cache-Control","no-cache");
  	response.setHeader("Cache-Control","no-store");
  	response.setHeader("Pragma","no-cache");
  	response.setDateHeader ("Expires", 0);
   	String disable_back = "" + session.getAttribute("name");
   	if(disable_back.equals("null")){
   			response.sendRedirect("welcome.jsp");
   		}
%>
<div class="topnav">
		<a href="welcome.jsp">HCA</a>
		<a href="newuser.jsp" style="float:right;">AddUser</a>
		<a href="logout.jsp" style="float: right;">Logout</a>
		<a href="#" style="float: right;" name="hello">Hello <%=disable_back%></a>
</div>
<div class="row">
<div class="leftcolumn" style="margin-left:1.5%;">
		<a href="dash.jsp"><h4>Dashboard</h4></a><br><br><br>
		<a href="user.jsp"><h4>Users</h4></a><br><br>
		<a href="hospital.jsp"><h4>Hospital</h4></a><br><br><br>
		<a href="doctors.jsp"><h4>Doctors</h4></a><br><br><br>
		<a href="diseases.jsp"><h4>Diseases</h4></a>
	<br><br><br><br><br><br><br><br><br>
	<div style="position: absolute; left:500px; top:100px; color: #eedc0f"><h1>Aapke Jankari Apke Haath Mein</h1></div>
</div>
<div id="rightcolumn">
<div id="formdiv">
	<table class="table table-stripped table-hover" style="margin-left:160%;margin-top:80%;">
		<tr class="table-success">
			<td><h2>Number of DOCTORS: 44</h2></td>
		</tr>
		<tr class="table-primary">
			<td><h2>Number of HOSPITALS: 32</h2></td>
		</tr>
		<tr class="table-danger">
			<td><h2>Number of DISEASES: 30</h2></td>
		</tr>
	</table>
</div>
</div>
</div>
<div class="footer">
	<p>&copy Lovesh and Harshit</p>
</div>
</body>
</html>