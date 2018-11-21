<%@ page import="java.sql.*"%>
<%
    String hname=request.getParameter("hospital");
    String years="No result found";
    String specialization="No result found";
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql:///Hospital","root","lovesh11");
        PreparedStatement ps= con.prepareStatement("select * from Hospital.hospital h where h.hname=?");
        ps.setString(1,hname);
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            years = rs.getString("years");
            specialization = rs.getString("specialization");
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
            <h2><a href="https://en.wikipedia.org/wiki/<%=hname%>" target="_blank" style="text-decoration: none;"><%=hname.toUpperCase()%></a></h2>
            <hr>
            <ul>
                <li style="font-size: 1.5em; margin: 2%; padding: 1%; text-align:left; line-height: 1.3em; letter-spacing: 0.07em;">Years:<%=years%></li>
                <li style="font-size: 1.5em; margin: 2%; padding: 1%; text-align:left; line-height: 1.3em; letter-spacing: 0.07em;">Specialization:<%=specialization%></li>
            </ul>
        </div>
    </div>
</body>
</html>