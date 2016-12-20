<%@page import="muman.models.PendingTournamentMatch"%>
<%@page import="muman.models.PendingMatch"%>
<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pending Tournament Matches</title>
</head>
<body>
    <jsp:include page = "navigation.jsp"/>
    <%
        String username = (String) session.getAttribute("username");
        if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
        if((new DataAccess()).isAdmin(username) == false) request.getRequestDispatcher(Webpage.home).forward(request, response);
       %>
       <%
           String tournament_id = request.getParameter("tournament_id");
            String tournament_name = request.getParameter("tournament_name");

       %>
    <h1><%=tournament_name%></h1>
    
<%
    //todo get from tournaments
    //todo redirect if not admin
    
    ArrayList<PendingTournamentMatch>matches= 
            (new DataAccess()).getPendingTournamentMatches((Integer.parseInt(tournament_id)));
    
    
    

    //dummy
//    matches.add(new Match(12,"asd","dasd"));
//    matches.add(new Match(12,"asd","dasd"));
//    matches.add(new Match(12,"asd","dasd"));
//    matches.add(new Match(12,"asd","dasd"));

    if(matches!=null){
        %>
        
        <h5>Total <%=matches.size()%> matches pending</h5>
        <%
    for(int i=0;i<matches.size();i++){
        PendingTournamentMatch cur=matches.get(i);
%>
<form action="<%=Webpage.playtournamentmatch%>" method="post">
    <input type="hidden" name="tournament_id" value="<%=tournament_id%>">
    <input type="hidden" name="tournament_name" value="<%=tournament_name%>">
    <input type="hidden" name="player1" value="<%=cur.getPlayer1()%>">
    <input type="hidden" name="player2" value="<%=cur.getPlayer2()%>">
    <input type="hidden" name="match_id" value="<%=cur.getId()%>"><!--may need to change here :)-->
Level <%=cur.getMatch_level()%>&nbsp<%=cur.getDate()%>&nbsp->&nbsp<%=cur.getPlayer1()%>&nbspVS&nbsp<%=cur.getPlayer2()%>&nbsp
<button type="submit" name="button" value="play">MAKE THEM PLAY</button>&nbsp
</form>
<%}}%>



</body>
</html>
