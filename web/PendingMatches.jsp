<%@page import="muman.models.PendingMatch"%>
<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Pending Matches</title>
</head>
<body>
    <jsp:include page = "navigation.jsp"/>
    <%
        String username = (String) session.getAttribute("username");
        if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
        if((new DataAccess()).isAdmin(username) == false) request.getRequestDispatcher(Webpage.home).forward(request, response);
       %>
<h1>PENDING MATCHES</h1>

<%
    //todo get from tournaments
    //todo redirect if not admin

    ArrayList<PendingMatch>matches= (new DataAccess()).getPendingMatches();


    //dummy
//    matches.add(new Match(12,"asd","dasd"));
//    matches.add(new Match(12,"asd","dasd"));
//    matches.add(new Match(12,"asd","dasd"));
//    matches.add(new Match(12,"asd","dasd"));

    if(matches!=null){
        %>
        <h5>Total <%=matches.size()%> Matches Pending</h5>
        <form action="<%=Webpage.playmatch%>" method="post">
            <button type="submit" name="button" value="discardall">Discard All</button>
      
        </form>
                
        
        <%
    for(int i=0;i<matches.size();i++){
        PendingMatch cur=matches.get(i);
%>
<form action="<%=Webpage.playmatch%>" method="post">
    <input type="hidden" name="player1" value="<%=cur.getPlayer1()%>">
    <input type="hidden" name="player2" value="<%=cur.getPlayer2()%>">
    <input type="hidden" name="match_id" value="<%=cur.getId()%>"><!--may need to change here :)-->
<%=cur.getDate()%>&nbsp->&nbsp<%=cur.getPlayer1()%>&nbspVS&nbsp<%=cur.getPlayer2()%>&nbsp
<button type="submit" name="button" value="play">MAKE THEM PLAY</button>&nbsp
<button type="submit" name="button" value="discard">Discard</button>
</form>
<%}}%>



</body>
</html>
