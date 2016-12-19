<%-- 
    Document   : playRandom
    Created on : Dec 15, 2016, 10:36:31 AM
    Author     : ab9ma
--%>

<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%@page import="muman.models.PendingMatch"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Play Match</title>
    </head>
    <body>
        <jsp:include page = "navigation.jsp"/>
        <h3>Welcome to the Play Match Page</h3>
        <%
            String username = (String) session.getAttribute("username");
          
            
            if(username==null)
            {
                RequestDispatcher rd = request.getRequestDispatcher(Webpage.login);
                rd.forward(request, response);
            }
            if(!(Boolean)(session.getAttribute("admin"))) 
                request.getRequestDispatcher(Webpage.home).forward(request, response);
            
         %>
            
         <%
             String button = request.getParameter("button");
             if(button!=null && button.equals("discardall")){
                (new DataAccess()).deleteAllUnpendingMatches();
                 RequestDispatcher rd =  request.getRequestDispatcher(Webpage.pendingmatches);
                rd.forward(request, response);
            }
         %>
        <%
            int match_id = Integer.parseInt(request.getParameter("match_id"));
             String player1 = request.getParameter("player1");
             String player2 = request.getParameter("player2");
             
            if(match_id<=0 || player1 == null || player2==null || player1.equals("") || player2.equals("")){
                RequestDispatcher rd =  request.getRequestDispatcher(Webpage.home);
                rd.forward(request, response);
            }
            if(button!=null && button.equals("discard")){
                (new DataAccess()).deleteMatch(match_id);
                 RequestDispatcher rd =  request.getRequestDispatcher(Webpage.pendingmatches);
                rd.forward(request, response);
            }
            out.print("Player 1: "+player1);
            out.print("<br>Player 2: "+player2);
        %>
        <br><br>
        <form method="post" action="WinnerProcess.do">
            
            Player 1 Score<input required type="number" name="score1"></input><br>
            Player 2 Score<input required type="number" name="score2"></input><br>
            
            <input type="hidden" name="player1" value="<%=player1%>">
             <input type="hidden" name="player2" value="<%=player2%>">
              <input type="hidden" name="match_id" value="<%=match_id%>">
            <input type="submit" value="End Match"></input>
            
        </form>
            
    </body>
</html>
