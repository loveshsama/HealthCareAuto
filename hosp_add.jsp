<%@ page import="java.sql.*"%>
<%
   String hid = request.getParameter("hid");
   String hname = request.getParameter("hname");
   String years = request.getParameter("years");
   String specialization = request.getParameter("specialization");
   boolean valid=true;
   PreparedStatement ps;
   String error="Hospital you are trying to add already EXISTS!!!!";
   String success = "Successfully Added";
   ResultSet rs;
   try{
   	Class.forName("com.mysql.jdbc.Driver");
   	Connection con = DriverManager.getConnection("jdbc:mysql:///Hospital","root","lovesh11");
   	ps = con.prepareStatement("select * from hospital");
   	rs = ps.executeQuery();
   	while(rs.next()){
   		if(hname.equalsIgnoreCase(rs.getString("hname"))){
   			session.setAttribute("error",error);
   			session.setAttribute("success","null");
   			response.sendRedirect("hospital.jsp");
   			valid=false;
   			break;
   		}
   	}
   if(valid){
   		ps = con.prepareStatement("insert into hospital values(?,?,?,?)");
   		ps.setString(1,hid);
   		ps.setString(2,hname);
   		ps.setString(3,years);
   		ps.setString(4,specialization);
   		ps.executeUpdate();
   		session.setAttribute("success",success);
   		session.setAttribute("error","null");
   		response.sendRedirect("hospital.jsp");
   	}
   }catch(Exception e){out.print(e.toString());}
   %>