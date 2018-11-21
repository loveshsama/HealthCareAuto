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
            </ul>
        </nav>
        <div class="img_container">
            <img src="images/healthcareAI.jpg" alt="img_container">
        </div>
        <div id="heading">Health Care</div>
        <div id="symptom_form">
            <form method="GET" action="desc-dname.jsp">
                <label>Enter Disease Name</label>
                <input name="dname" type="text" placeholder="Please mind your spellings">
                <button type="submit">Search</button>
            </form>
        </div>
    </div>
</body>
</html>