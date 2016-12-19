
<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%
    String username = (String) session.getAttribute("username");
    if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
    
   out.print(Webpage.make(Webpage.home, "Home")+" "); 
   out.print(Webpage.make(Webpage.profile, "Profile")+" "); 
   out.print(Webpage.make(Webpage.playerinfo, "PlayerInfo")+" "); 
   out.print(Webpage.make(Webpage.informationpage, "InformationPage")+" "); 
   out.print(Webpage.make(Webpage.matchhistory, "MatchHistory")+" "); 
   out.print(Webpage.make(Webpage.availabletournaments, "AvailableTournaments")+" ");
   out.print(Webpage.make(Webpage.tournamenthistory, "TournamentHistory")+" ");
   %>
    &nbsp<div align="right">
        <%
    out.print(Webpage.make(Webpage.forum, "Forum")+" "); 
    out.print(Webpage.make(Webpage.logout, "Logout")+" "); 
    %>
    </div>
    <br>
    <%
    if((new DataAccess()).isAdmin(username)){
    out.print(Webpage.make(Webpage.admin_home, "AdminHome")+" "); 
    out.print(Webpage.make(Webpage.manage_moderators, "Moderators")+" "); 
   
    out.print(Webpage.make(Webpage.manage_sections, "Sections")+" "); 
    out.print(Webpage.make(Webpage.pendingmatches, "PendingMatches"+ " "));
    }

%>
<br>



