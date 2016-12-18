<%@page import="muman.models.UserInfo"%>
<%@page import="muman.etc.Webpage"%>
<%@page import="muman.db.DataAccess"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="muman.models.forum.Moderator" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Mod" %><%--
  Created by IntelliJ IDEA.
  User: numan947
  Date: 12/18/16
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Moderator</title>
</head>
<body>
    <jsp:include page="navigation.jsp"/>
<%
  String username = (String) session.getAttribute("username");
  if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
  if((new DataAccess()).isAdmin(username) == false) request.getRequestDispatcher(Webpage.home).forward(request, response);
%>

<h1>MANAGE MODERATORS</h1>

<%
// add new moderators here
String new_moderator = request.getParameter("new_moderator");
String new_moderators_section = request.getParameter("new_moderators_section");
if(new_moderator!=null && new_moderators_section!=null && !new_moderator.equals("") && !new_moderators_section.equals(""))
    (new DataAccess()).addModerator(new_moderator, new_moderators_section);

String deleted_moderator = request.getParameter("deleted_moderator");
if(deleted_moderator!=null && !deleted_moderator.equals(""))
    (new DataAccess()).deleteModerator(deleted_moderator);
%>
<%
//get all the moderators from db, also get the sections from db, also all the users
    ArrayList<Moderator>moderatorArrayList=(new DataAccess()).getModerators();
    ArrayList<UserInfo>userArrayList= (new DataAccess()).getAllUsers();
    ArrayList<String> sections = (new DataAccess()).getSections();


    for(int i=0;i<moderatorArrayList.size();i++){
        Moderator cur=moderatorArrayList.get(i);
%>
<%=cur.getFullName()+"  ("+cur.getUserName()+")    "+cur.getSectionName()%>&nbsp&nbsp
<form style="display: inline" method="post" action="Manage_Moderators.jsp">
    <button name="deleted_moderator" type="submit" value="<%=cur.getUserName()%>">DELETE</button>
</form>
<br><br>
<%}%>


<form action="Manage_Moderators.jsp" method="post">

    <select required name="new_moderator">
        <% for(int i=0;i<userArrayList.size();i++){
            UserInfo cur=userArrayList.get(i);
        %>
        <option value="<%=cur.getUsername()%>"><%=cur.getUser_full_name()+"  ("+cur.getUsername()+")"%></option>
        <%}%>
    </select>


    <select required  name="new_moderators_section">
            <%

        for(int i=0;i<sections.size();i++){

        %>
        <option values="<%=sections.get(i)%>"><%=sections.get(i)%></option>
                    <%}%>
    </select>
    &nbsp&nbsp<input type="submit" value="create">
</form>





</body>
</html>
