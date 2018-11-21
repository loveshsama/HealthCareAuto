<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title></title>
	<meta charset="utf-8">
	  <meta name="viewport" content="width=device-width,intial-scale=1">
	  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	  <link rel="stylesheet" type="text/css" href="user.css">
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
   			response.sendRedirect("index.html");
   		}
%>
<%
   try{
   	Class.forName("com.mysql.jdbc.Driver");
   	Connection con = DriverManager.getConnection("jdbc:mysql:///Hospital","root","lovesh11");
   	PreparedStatement ps = con.prepareStatement("select * from admin");
   	ResultSet rs = ps.executeQuery();
   %>
<div class="topnav">
		<a href="welcome.jsp">HCA</a>
		<a href="newuser.jsp" style="float:right;">AddUser</a>
		<a href="logout.jsp" style="float: right;">Logout</a>
		<a href="#" style="float: right;" name="hello">Hello <%=disable_back%></a>
</div>
<div class="row">
<div class="leftcolumn">
		<a href="dash.jsp"><h4>Dashboard</h4></a><br><br><br>
		<a href="user.jsp"><h4>Users</h4></a><br><br>
		<a href="hospital.jsp"><h4>Hospital</h4></a><br><br><br>
		<a href="doctors.jsp"><h4>Doctors</h4></a><br><br><br>
		<a href="diseases.jsp"><h4>Diseases</h4></a>
	<br><br><br><br><br><br><br>
</div>
<div id="rightcolumn">
<div id="formdiv">
	<form style="border:none">
		<table class="table table-striped table-hover" style="margin-left:70%; margin-top: 20%">
			<caption style="margin-left:30%">Registered  Info</caption>
			<thead class="thead-dark">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Address</th>
				</tr>
			</thead>
			<%
	   while(rs.next()){
	   %>
				<tr>
					<td><%out.print(rs.getString("fname"));%></td>
					<td><%out.print(rs.getString("lname"));%></td>
					<td><%out.print(rs.getString("email"));%></td>
					<td><%out.print(rs.getString("Address"));%></td>
				</tr>
<%
		  }
	}
		catch(Exception e){
   		out.print(e.toString());
   }
   %>
		</table>
	</form>
</div>
</div>
</div>
</body>
</html>