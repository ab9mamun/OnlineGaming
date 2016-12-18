<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%@ page import="muman.models.Player" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: numan947
  Date: 12/18/16
  Time: 3:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PlayerInfo</title>
</head>
<body>
    <jsp:include page = "navigation.jsp"/>
    <%
        String username = (String) session.getAttribute("username");
        if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
       %>
    
<h1>WELCOME TO THE PLAYER INFO PAGE</h1>
<%
    
    //get player information from database
    Player player=(new DataAccess()).getPlayerInfo(username);
    if(player==null) request.getRequestDispatcher(Webpage.home).forward(request, response);


%>

<h4>UserName:&nbsp<%=player.getUsername()%><br></h4>

Rating:&nbsp<%=player.getRating()%><br>

Match Count:&nbsp<%=player.getMatchCount()%><br>

Win Count:&nbsp<%=player.getWinCount()%><br>

Best Score:&nbsp<%=player.getBestScore()%><br>

Total XP:&nbsp<%=player.getTotalXP()%><br>

<h3>Achievements:</h3>

<%
    ArrayList<String>ach= (new DataAccess()).getAchievements(username);
    

    if(ach!=null)
    for(int i=0;i<ach.size();i++){
%>
<%="NO."+(i+1)+" "%>&nbsp<%=ach.get(i)%><br>
<%}%>






</body>
</html>
