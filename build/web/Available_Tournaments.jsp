<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="muman.models.Tournament" %><%--
  Created by IntelliJ IDEA.
  User: numan947
  Date: 12/19/16
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Available Tournaments</title>
</head>
<body>
    <jsp:include page = "navigation.jsp"/>
    <%
        String username = (String) session.getAttribute("username");
        if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
       %>
    

<%
    //create tournament option for admin
    if((new DataAccess()).isAdmin(username)){ %>
    <h4>Create A Tournament</h4>   
    <form method="post" action="CreateTournament.do">
        Tournament Name <input required name="new_tournament_name" type="text"/><br>
        Start Date <input required name="new_tournament_start_date" type="text"/>(DD/MON/YYYY)<br>
        NO of Participants <select required name="new_tournament_capacity">
            <option value="4">4</option>
            <option value="8">8</option>
            <option value="16">16</option>
        </select>
        
        <input type="submit" value="Create"/> 
       </form> 
    <%}%>
    <h1>AVAILABLE TOURNAMENTS</h1>
    <%
    
    
//get the tournaments from DB
    ArrayList<Tournament>tournaments= (new DataAccess()).getAvailableTournamentsForMe(username);
        
    //dummy
//    tournaments.add(new Tournament(12,"ABCD","NOT TODAY","NOT TOMORROW","NOT YOU"));
//    tournaments.add(new Tournament(12,"ABCD","NOT TODAY","NOT TOMORROW","NOT YOU"));
//    tournaments.add(new Tournament(13,"ABCD","NOT TODAY","NOT TOMORROW","NOT YOU"));
//    tournaments.add(new Tournament(14,"ABCD","NOT TODAY","NOT TOMORROW","NOT YOU"));
//    tournaments.add(new Tournament(15,"ABCD","NOT TODAY","NOT TOMORROW","NOT YOU"));

    if(tournaments ==null){out.print("<h4>No Record</h4>");}
    else
    for(int i=0;i<tournaments.size();i++){
        Tournament cur=tournaments.get(i);
%>
<form method="post" action="JoinTournament.do">
    <input type="hidden" name="tournamen_id" value="<%=cur.getId()+""%>"/>
<%=i+1%>&nbsp<%=cur.getName()%>&nbsp
<%=cur.getStartDate()%>&nbsp<input type="hidden" name="tournament_id" value="<%=cur.getId()%>">
<button type="submit" value="Submit">JOIN</button>
</form>
<%}%>


</body>
</html>
