<%-- 
    Document   : home
    Created on : Dec 6, 2016, 12:34:36 AM
    Author     : ab9ma
--%>

<%@page import="muman.db.DataAccess"%>
<%@page import="java.util.ArrayList"%>
<%@page import="muman.models.UserInfo"%>
<%@page import="muman.etc.Webpage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        
    </head>
    <body>
        <jsp:include page = "navigation.jsp"/>
        <h3>Welcome to the Home Page</h3>
        <%
            String username = (String) session.getAttribute("username");
          
            if(username==null)
            {
                RequestDispatcher rd = request.getRequestDispatcher(Webpage.login);
                rd.forward(request, response);
            }
         %>
         <!--checking message-->
         <%
             String message = (String) request.getAttribute("message");
             if(message!=null && !message.equals("")){
                 out.println("Message: "+message+"<br><br>");
             }
             %>
         
         
         <form action="PlayRandom.do">
             <input type="submit" value="Play Random"></input>
         </form>
             
          <%
    //get from database, player names that are available to play
        ArrayList<String>available=(new DataAccess()).getAvailablePlayers();

        //dummy
//        available.add("ABCD1");
//        available.add("ABCD2");
//        available.add("ABCD3");
//        available.add("ABCD4");
//        available.add("ABCD5");
        boolean me_available= false;
    %>
     <form action="PlayRandom.do" method="post">
       <br><br>Play With Friend: <select name="player2">
            <%for(int i=0;i<available.size();i++){
            if(available.get(i).equals(username)){me_available =true; continue;} %>
            
            <option value="<%=available.get(i)%>"><%=available.get(i)%></option>
            <%}%>
        </select>&nbsp<button type="submit" value="Submit">Play</button>
     </form><br><br>
    <%if(me_available==false){%>
     <form action="MakeAvailable.do" method="post">
        </select>&nbsp<button type="submit" value="Submit">I AM AVAILABLE</button>
    </form>
     <%}
    else out.print("<h4>You are available</h4>");
%>
        
    </body>
</html>
