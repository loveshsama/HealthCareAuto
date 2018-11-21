<%@ page import="java.sql.*"%>
<%
    String dname = request.getParameter("dname");
    String symptom1 = request.getParameter("symptom1");
    String symptom2 = request.getParameter("symptom2");
    String symptom3 = request.getParameter("symptom3");
    String type = request.getParameter("type");
    String description = request.getParameter("description");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql:///Hospital","root","lovesh11");
        PreparedStatement ps = con.prepareStatement("select * from diseases");
        ResultSet rs = ps.executeQuery();
        boolean valid=true;
        while(rs.next()){
            if(dname.equals(rs.getString("dname")) && symptom1.equals(rs.getString("symtom1")) && symptom2.equals(rs.getString("symptom2")) && symptom3.equals(rs.getString("symptom3")) && type.equals(rs.getString("type"))){
                valid=false;
                response.sendRedirect("diseases_err.jsp");
                break;
            }
        }
        if(valid){
            ps = con.prepareStatement("insert into diseases values(?,?,?,?,?,?)");
            ps.setString(1,dname);
            ps.setString(2,symptom1);
            ps.setString(3,symptom2);
            ps.setString(4,symptom3);
            ps.setString(5,type);
            ps.setString(6,description);
            ps.executeUpdate();
            response.sendRedirect("diseases.jsp");
        }
    }catch(Exception e){out.println(e.toString());}
%>