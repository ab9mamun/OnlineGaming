<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="muman.models.Match" %><%--
  Created by IntelliJ IDEA.
  User: numan947
  Date: 12/19/16
  Time: 2:03 PM
  To change this template use File | Settings | File Templates.
--%>
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

    ArrayList<Match>matches=new ArrayList<>();


    //dummy
    matches.add(new Match(12,"asd","dasd"));
    matches.add(new Match(12,"asd","dasd"));
    matches.add(new Match(12,"asd","dasd"));
    matches.add(new Match(12,"asd","dasd"));

    if(matches!=null)
    for(int i=0;i<matches.size();i++){
        Match cur=matches.get(i);
%>
<form action="#todo_change_this_with_play_match_page" method="post">
    <input type="hidden" name="match_id" value="<%=cur.getId()%>"><!--may need to change here :)-->
<%=cur.getPlayer1()%>&nbspVS&nbsp<%=cur.getPlayer2()%>&nbsp<button type="submit" value="Submit">MAKE THEM PLAY</button>
</form>
<%}%>



</body>
</html>
