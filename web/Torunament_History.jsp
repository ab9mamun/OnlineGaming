<%@page import="muman.etc.Webpage"%>
<%@ page import="muman.models.Tournament" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: numan947
  Date: 12/19/16
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tournament_History</title>
</head>
<body>
    <jsp:include page = "navigation.jsp"/>
    <%
        String username = (String) session.getAttribute("username");
        if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
       %>
<h1>Tournament History</h1>

<%
    //get the tournaments from DB
    ArrayList<Tournament> tournaments=new ArrayList<>();

    //dummy
    tournaments.add(new Tournament(12,"ABCD","NOT TODAY","NOT TOMORROW","NOT YOU"));
    tournaments.add(new Tournament(12,"ABCD","NOT TODAY","NOT TOMORROW","NOT YOU"));
    tournaments.add(new Tournament(13,"ABCD","NOT TODAY","NOT TOMORROW","NOT YOU"));
    tournaments.add(new Tournament(14,"ABCD","NOT TODAY","NOT TOMORROW","NOT YOU"));
    tournaments.add(new Tournament(15,"ABCD","NOT TODAY","NOT TOMORROW","NOT YOU"));

    for(int i=0;i<tournaments.size();i++){
        Tournament cur=tournaments.get(i);
%>
   <%=i+1%>&nbsp<%=cur.getName()%>&nbsp
    <%=cur.getStartDate()%>&nbsp<%=cur.getEndDate()%>&nbsp<%=cur.getWinner()%><br><br>
<%}%>

</body>
</html>
