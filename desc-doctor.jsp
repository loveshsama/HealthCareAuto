<%@ page import="java.sql.*"%>
<%
    String dname=request.getParameter("dname");
    String age="No result found";
    String specialization="No result found";
    String degrees="No result found";
    String experience="No result found";
    String hospital="No result found";
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql:///Hospital","root","lovesh11");
        PreparedStatement ps= con.prepareStatement("select * from Hospital.doctor d where d.dname=?");
        ps.setString(1,dname);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            age = rs.getString("age");
            specialization = rs.getString("specialization");
            degrees = rs.getString("degrees");
            experience = rs.getString("experience");
            hospital=rs.getString("hospital");
        }
    }catch(Exception e){
        out.print(e.toString());
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>HCA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="welcome.css" />
</head>
<body>
    <div id="wrapper">
        <nav class="title_bar">
            <ul>
                <li><a href="welcome.jsp" style="float: left; position: absolute; left:10px; top:30px;">HCA</a></li>
                <li><a href="logout.jsp">Hello/logout</a></li>
                <li><a href="login.jsp">Login as Admin</a></li>
                <li><a href="newuser.jsp">Become a Member</a></li>
                <li><a href="desc-diseases.jsp" target="_blank">Disease Description</a></li>
            </ul>
        </nav>
        <div class="img_container">
            <img src="images/healthcareAI.jpg" alt="img_container">
        </div>
        <div id="heading">Health Care</div>
        <div id="symptom_form">
            <h2><a href="https://en.wikipedia.org/wiki/<%=dname%>" target="_blank" style="text-decoration: none;"><%=dname.toUpperCase()%></a></h2>
            <hr>
            <ul>
                <li style="font-size: 1.5em; margin: 2%; padding: 1%; text-align:left; line-height: 1.3em; letter-spacing: 0.07em;"><%=age%></li>
                <li style="font-size: 1.5em; margin: 2%; padding: 1%; text-align:left; line-height: 1.3em; letter-spacing: 0.07em;"><%=specialization%></li>
                <li style="font-size: 1.5em; margin: 2%; padding: 1%; text-align:left; line-height: 1.3em; letter-spacing: 0.07em;"><%=degrees%></li>
                <li style="font-size: 1.5em; margin: 2%; padding: 1%; text-align:left; line-height: 1.3em; letter-spacing: 0.07em;"><%=experience%></li>
                <li style="font-size: 1.5em; margin: 2%; padding: 1%; text-align:left; line-height: 1.3em; letter-spacing: 0.07em;"><%=hospital%></li>
            </ul>
            <a href="desc-hospital.jsp?hospital=<%=hospital%>">For Hospital Details</a>
        </div>
    </div>
</body>
</html>