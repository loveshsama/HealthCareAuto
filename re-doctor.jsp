<%
    String disable_back = "" + session.getAttribute("name");
    String req = request.getParameter("doctor");
   	if(disable_back.equals("null")){
           response.sendRedirect("index.html");		
}
else{
    RequestDispatcher rd = request.getRequestDispatcher("list-doctor.jsp");
    rd.forward(request,response);
}
%>