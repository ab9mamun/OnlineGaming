
<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%
    String username = (String) session.getAttribute("username");
    if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
    
   out.print(Webpage.make(Webpage.home, "Home")+" "); 
   out.print(Webpage.make(Webpage.profile, "Profile")+" "); 
   out.print(Webpage.make(Webpage.playerinfo, "PlayerInfo")+" "); 
   
    out.print(Webpage.make(Webpage.forum, "Forum")+" "); 
    out.print(Webpage.make(Webpage.logout, "Logout")+" "); 
    %>
    <br>
    <%
    if((new DataAccess()).isAdmin(username)){
    out.print(Webpage.make(Webpage.admin_home, "Admin Home")+" "); 
    out.print(Webpage.make(Webpage.manage_moderators, "Manage Moderators")+" "); 
   
    out.print(Webpage.make(Webpage.manage_sections, "Manage Sections")+" "); 
    }

%>
<br>



