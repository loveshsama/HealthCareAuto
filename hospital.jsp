<%@ page import="java.sql.*"%>
<%	String hid="8000";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql:///Hospital","root","lovesh11");
		PreparedStatement ps = con.prepareStatement("SELECT * FROM hospital ORDER BY hid DESC LIMIT 1");
		ResultSet rs = ps.executeQuery();
		if(rs.next()){
			hid = ""+rs.getString("hid");
		}
		int id = Integer.parseInt(hid);
		id+=1;
		hid = String.valueOf(id);
	}
	catch(Exception e){out.print(e.toString());}
	%>
<!DOCTYPE html>
<html>
<head>
	<title>Hospital</title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width,intial-scale=1">
  	<link rel="stylesheet" type="text/css" href="hospital.css">
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
<%
	String error = "" + session.getAttribute("error");
	if(error.equals("null")){
		error="";
	}
	%>
<%
	String success = "" + session.getAttribute("success");
	if(success.equals("null")){
		success="";
	}
	%>
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
	<br><br>
		<p style="color:green"><%=success%></p>
	<br><br>
	<form method="POST" action="hosp_add.jsp">
	<caption><h2 align="center">Hospital Registration Form</h2></caption><br>
	<label class="lb"><b>Hospital ID</b></label><br>
		<input class="inp" type="text" name="hid" value="<%=hid%>" readonly><br><br>
	<label class="lb"><b>Hospital Name</b></label><br>
		<input class="inp"type="text" placeholder="Enter name" name="hname" required><br><br>
		<label class="lb"><b>Working Years</b></label><br>
		<input placeholder="Enter Working Years" class="inp" type="number" name="years" required><br><br>
		<label class="lb"><b>Specialization</b></label><br>
		<input class="inp" type="text" placeholder="Enter Specialization" name="specialization" required><br><br>
		<button id="sub" style="text-align: center;width: 98%;margin-left: 1%;margin-top: 1%; height: 50px;"><b>Submit</b></button>
		<p style="color:red"><%=error%></p>
	</form><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
</div>
</div>
<div class="footer">
	<p>&copy Lovesh and Harshit 2018</p>
</div>
</body>
</html>-