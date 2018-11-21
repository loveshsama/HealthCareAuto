<%@ page import="java.sql.*"%>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String name = "";
	String disable_back = "" + session.getAttribute("name");
   	if(disable_back.equals("null")){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql:///Hospital","root","lovesh11");
			boolean valid=false;
			PreparedStatement ps = con.prepareStatement("select * from admin");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				if(email.equals(rs.getString("email")) && password.equals(rs.getString("password"))){
				valid=true;
				name=rs.getString("fname");
				break;
				}
			}
			if(valid){
				session.setAttribute("name",name);
				response.sendRedirect("welcome.jsp");
			}else{
				response.sendRedirect("loginerr.html");
			}
		}catch(Exception e){
			out.println(e);
	}
}
else{
	response.sendRedirect("dash.jsp");
}
%>