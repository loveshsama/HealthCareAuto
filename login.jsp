<%
	String disable_back = "" + session.getAttribute("name");
   	if(disable_back.equals("null")){
           response.sendRedirect("index.html");		
}
else{
	response.sendRedirect("dash.jsp");
}
%>