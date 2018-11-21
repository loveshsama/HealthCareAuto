<%@ page import="java.sql.*"%>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql:///Hospital","root","lovesh11");
        PreparedStatement ps1 = con.prepareStatement("SELECT distinct symtom1 FROM diseases");
        PreparedStatement ps2 = con.prepareStatement("SELECT distinct symptom2 FROM diseases");
        PreparedStatement ps3 = con.prepareStatement("SELECT distinct symptom3 FROM diseases");
        ResultSet rs1 = ps1.executeQuery();
        ResultSet rs2 = ps2.executeQuery();
        ResultSet rs3 = ps3.executeQuery();
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
                <li><a href="logout.jsp">Hello/Logout</a></li>
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
            <form method="GET" action="list.jsp">
                <label>Enter your Symptoms</label>
                <select name="symptom1">
                    <% 
                        while(rs1.next()){%>
                            <option><%=rs1.getString("symtom1")%></option>
                      <%  }
                    %>
                </select>
                <select name="symptom2">
                    <%
                        while(rs2.next()){%>
                            <option><%=rs2.getString("symptom2")%></option>
                       <% }
                    %>
                </select>
                <select name="symptom3">
                        <%
                        while(rs3.next()){%>
                            <option><%=rs3.getString("symptom3")%></option>
                       <% }
                    %>
                </select>
                <button type="submit">Search</button>
            </form>
            <%
        }catch(Exception e){
            out.print(e.toString());
        }
%>
        </div>
    </div>
</body>
</html>