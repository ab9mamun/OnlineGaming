<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%@ page import="muman.models.Player" %>
<%@ page import="muman.models.MatchDetails" %>
<%@ page import="java.sql.Date" %><%--
  Created by IntelliJ IDEA.
  User: numan947
  Date: 12/18/16
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Information</title>
</head>
<body>
    <jsp:include page = "navigation.jsp"/>
    <%
        String username = (String) session.getAttribute("username");
        if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
       %>
<h1>WELCOME TO INFORMATION PAGE</h1>

<%

    String type=request.getParameter("type");// caution!! it'll be used in if else
    //if bpimr, I expect a Player object
    Player player =null;
    int highestVal=0;
    MatchDetails match = null;
    if(type!=null && type.equals("bpimr")) {
        player = (new DataAccess()).getBestPlayerInMyRegion(username);
        if(player==null) player = new Player("No player", -1, -1, -1, -1, -1);
    }
    
    //if bpiar, I expect a Player object
    else if(type!=null && type.equals("bpiar")) {
        player = (new DataAccess()).getBestPlayerInAllRegions();
        if(player==null) player = new Player("No player", -1, -1, -1, -1, -1);
    }
    //if nomt, I expect an integer
    else if(type!=null && type.equals("nomt")){
        highestVal = (new DataAccess()).getNumberOfMatchesToday();
    }
    
    
    //if mwhts, I expect a matchdetails object
     else if(type!=null && type.equals("mwhts")) {
        match= (new DataAccess()).getMatchWithHighestTotalScore();
        if(match ==null) match = new MatchDetails(-1, -1, "No player", "No player", new Date(new java.util.Date().getTime()));
    }
    //if mwhsd, I expect a matchdetails object
    else if(type!=null && type.equals("mwhsd")) {
        match= (new DataAccess()).getMatchWithHighestScoreDifference();
         if(match ==null) match = new MatchDetails(-1, -1, "No player", "No player", new Date(new java.util.Date().getTime()));
    }
    //if(type==) check here and do the rest

    //DUMMY STARTS HERE

    //case 4
  
    //case 3
  //  int highestVal=1000;
    //case 2 & 1
  //  Player player=new Player("NUMAN",1,2,3,4,5);

%>


<form method="post" action="InformationPage.jsp">

    <select name="type">
        <option value="bpimr">Best player in my region</option>
        <option value="bpiar">Best player of all regions</option>
        <option value="nomt">Number of matches today</option>
        <option value="mwhts">Match with highest total score</option>
        <option value="mwhsd">Match with highest score difference</option>

    </select>

<button type="submit" value="Submit">GO</button>
</form>

<!--printing start from here, don't touch-->

<%
if(type!=null){
if(type.equals("bpimr"))out.print("<h2>BEST PLAYER IN MY REGION</h2><br>");
else if(type.equals("bpiar"))out.print("<h2>BEST PLAYER IN ALL REGION</h2><br>");
else if(type.equals("nomt"))out.print("<h2>NUMBER OF MATCHES TODAY</h2><br>");
else if (type.equals("mwhts"))out.print("<h2>MATCH WITH HIGHEST TOTAL SCORE</h2><br>");
else if (type.equals("mwhsd"))out.print("<h2>MATCH WITH HIGHEST SCORE DIFFERENCE</h2><br>");

if((type.equals("bpimr")||type.equals("bpiar"))){%>
USERNAME:&nbsp <h3><%=player.getUsername()%></h3><br>
TOTAL MATCH PLAYED:&nbsp<%=player.getMatchCount()%><br>
BEST SCORE:&nbsp<%=player.getBestScore()%><br>
TOTAL MATCH WON:&nbsp<%=player.getWinCount()%><br>
TOTAL XP:&nbsp<%=player.getTotalXP()%><br>
TOTAL RATING:&nbsp<%=player.getRating()%><br>
<%}%>
<%if(type.equals("nomt")){%>
<h4>Today there are (is) <%=highestVal%> match(es)</h4>
<%}%>
<%if(type.equals("mwhts")||type.equals("mwhsd")){%>
DATE:&nbsp<%=match.getDate()%><br>
Player 1:&nbsp<%=match.getPlayer1()%><br>
Player 2:&nbsp<%=match.getPlayer2()%><br>
Player 1 Score:&nbsp<%=match.getScore1()%><br>
Player 2 Score:&nbsp<%=match.getScore2()%>
<%}%>


<%}%>
</body>
</html>
