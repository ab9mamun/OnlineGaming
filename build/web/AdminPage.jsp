<%--
  Created by IntelliJ IDEA.
  User: numan947
  Date: 12/18/16
  Time: 2:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Page</title>
</head>
<body>
    <jsp:include page="navigation.jsp" />
<%
  String username = (String) session.getAttribute("username");
  if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
  if((new DataAccess()).isAdmin(username) == false) request.getRequestDispatcher(Webpage.home).forward(request, response);
%>

<h1>WELCOME TO ADMIN PAGE</h1>

</body>
</html>
