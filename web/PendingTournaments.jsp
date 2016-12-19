<%-- 
    Document   : PendingTournaments
    Created on : Dec 20, 2016, 2:45:58 AM
    Author     : ab9ma
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="muman.models.Tournament"%>
<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pending Tournaments</title>
    </head>
    <body>
        <jsp:include page = "navigation.jsp"/>
    <%
        String username = (String) session.getAttribute("username");
        if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
        if((new DataAccess()).isAdmin(username) == false) request.getRequestDispatcher(Webpage.home).forward(request, response);
       %>
        <h1>PENDING TOURNAMENTS</h1>
        <%
            ArrayList<Tournament> tournaments = (new DataAccess()).getAllUnfinishedTournaments();
            
            if(tournaments!=null){
        %>
        <h5>Total <%=tournaments.size()%> Tournaments Pending</h5>
        <%
    for(int i=0;i<tournaments.size();i++){
        Tournament cur=tournaments.get(i);
%>
<form action="<%=Webpage.pendingtournamentmatches%>" method="post">
    <input type="hidden" name="tournament_name" value="<%=cur.getName()%>">
    <input type="hidden" name="tournament_id" value="<%=cur.getId()%>"><!--may need to change here :)-->
<%=cur.getStartDate()%>&nbsp->&nbsp<%=cur.getName()%>&nbsp
<button type="submit" name="button" value="play">View Pending Matches</button>&nbsp
</form>
<%}}%>
        
    </body>
</html>
