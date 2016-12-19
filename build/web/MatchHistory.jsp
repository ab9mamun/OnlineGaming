<%-- 
    Document   : MatchHistory
    Created on : Dec 19, 2016, 1:28:25 PM
    Author     : ab9ma
--%>

<%@page import="muman.etc.Webpage"%>
<%@page import="muman.db.DataAccess"%>
<%@page import="muman.models.MatchDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Match History</title>
    </head>
    <body>
        <jsp:include page = "navigation.jsp"/>
    <%
        String username = (String) session.getAttribute("username");
        if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
       %>
        
        
        
        <h1>MATCH HISTORY</h1>
        <%
            MatchDetails match;
            ArrayList<MatchDetails> matches = (new DataAccess()).getAllFinishedMatches();
            if(matches!=null) {
             out.println("<h3>TOTAL MATCH FOUND: "+matches.size()+"</h3>");
            for(int i=0; i<matches.size(); i++){
                match = matches.get(i);
               %>
    DATE:&nbsp<%=match.getDate()%><br>
    Player 1:&nbsp<%=match.getPlayer1()%><br>
    Player 2:&nbsp<%=match.getPlayer2()%><br>
    Player 1 Score:&nbsp<%=match.getScore1()%><br>
    Player 2 Score:&nbsp<%=match.getScore2()%>
    <br><br>        

            <%}}%>
            
    </body>
</html>
