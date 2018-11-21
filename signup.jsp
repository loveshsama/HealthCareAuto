<%@ page import="java.sql.*"%>
<%
   String fname=request.getParameter("fname");
   String lname=request.getParameter("lname");
   String email=request.getParameter("email");
   String password=request.getParameter("password");
   String phone=request.getParameter("phone");
   String add=request.getParameter("add");
   try{
   		Class.forName("com.mysql.jdbc.Driver");
   		Connection con = DriverManager.getConnection("jdbc:mysql:///Hospital","root","lovesh11");
   		PreparedStatement ps = con.prepareStatement("insert into admin values(?,?,?,?,?,?)");
   		ps.setString(1,fname);
	    ps.setString(2,lname);
   		ps.setString(3,email);
   		ps.setString(4,password);
   		ps.setString(5,phone);
   		ps.setString(6,add);
   		ps.executeUpdate();
   		response.sendRedirect("index.html");
   }catch(Exception e)
   {
   		out.print(e.toString());
   }
%>