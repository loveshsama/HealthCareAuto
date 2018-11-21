<%@ page import="java.sql.*"%>
<%
    String type = request.getParameter("doctor");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql:///Hospital","root","lovesh11");
        PreparedStatement ps = con.prepareStatement("select dname from Hospital.doctor d where d.specialization=?");
        ps.setString(1,type);
        ResultSet rs = ps.executeQuery();%>
        

            
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
                <li></li>
                <li><a href="login.jsp">Login as Admin</a></li>
                <li><a href="newuser.jsp">Become a Member</a></li>
                <li><a href="desc-diseases.jsp" target="_blank">Disease Description</a></li>
            </ul>
        </nav>
        <div class="img_container">
            <img src="images/healthcareAI.jpg" alt="img_container">
        </div>
        <div id="heading">Health Care</div>
        <p style="font-weight: bolder; font-size: 3em;">Search Results</p>
        <div id="search-result">
                <h2>Recommendations:</h2>
                <hr>
                <%while(rs.next()){%>
                <a href="desc-doctor.jsp?dname=<%=rs.getString("dname")%>"><%=rs.getString("dname")%></a>
                <%}
            }catch(Exception e){
                out.print(e.toString());
            }
        %> 
        </div>
    </div>
</body>
</html>