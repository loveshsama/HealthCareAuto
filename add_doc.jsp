<%@ page import="java.sql.*"%>
<%
   String did = request.getParameter("did");
   String dname = request.getParameter("dname");
   String age = request.getParameter("age");
   String specialization = request.getParameter("specialization");
   String degrees = request.getParameter("degrees");
   String experience = request.getParameter("experience");
   String hospital = request.getParameter("hospital");
   boolean valid=true;
   PreparedStatement ps;
   String error="Doctor you are trying to add already EXISTS!!!!";
   String success = "Successfully Added";
   ResultSet rs;
   try{
   	Class.forName("com.mysql.jdbc.Driver");
   	Connection con = DriverManager.getConnection("jdbc:mysql:///Hospital","root","lovesh11");
   	ps = con.prepareStatement("select * from doctor");
   	rs = ps.executeQuery();
   	while(rs.next()){
   		if(dname.equalsIgnoreCase(rs.getString("dname")) && specialization.equalsIgnoreCase(rs.getString("specialization")) && hospital.equals(rs.getString("hospital"))){
   			session.setAttribute("error",error);
   			session.setAttribute("success","null");
   			response.sendRedirect("doctors.jsp");
   			valid=false;
   			break;
   		}
   	}
   if(valid){
   		ps = con.prepareStatement("insert into doctor values(?,?,?,?,?,?,?)");
   		ps.setString(1,did);
   		ps.setString(2,dname);
   		ps.setString(3,age);
        ps.setString(4,specialization);
        ps.setString(5,degrees);
        ps.setString(6,experience);
        ps.setString(7,hospital);
   		ps.executeUpdate();
   		session.setAttribute("success",success);
   		session.setAttribute("error","null");
   		response.sendRedirect("doctors.jsp");
   	}
   }catch(Exception e){out.print(e);}
   %>