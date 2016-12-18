<%@page import="muman.db.DataAccess"%>
<%@page import="muman.etc.Webpage"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %><%--
  Created by IntelliJ IDEA.
  User: numan947
  Date: 12/18/16
  Time: 2:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Section</title>
</head>
<body>
    <jsp:include page="navigation.jsp" />
  <%
  String username = (String) session.getAttribute("username");
  if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
  if((new DataAccess()).isAdmin(username) == false) request.getRequestDispatcher(Webpage.home).forward(request, response);
%>
    
<h1>SECTION MANAGEMENT</h1>

<%
    String sectionName=request.getParameter("new_section");
    //add the new section to database
    if(sectionName!=null && !sectionName.equals("")){
       (new DataAccess()).addSection(sectionName);
    }
    
    String updated_section = request.getParameter("updated_section_name");
    if(updated_section!=null && !updated_section.equals("")){
        String old_section = request.getParameter("old_section_name");
        System.out.println(old_section+" "+updated_section);
        
       (new DataAccess()).renameSection(old_section, updated_section);
    }
    
    /*
//    String deleted_section = request.getParameter("deleted_section_name");
//    if(deleted_section!=null && !deleted_section.equals("")){
//        System.out.println(deleted_section);
//        
//       (new DataAccess()).deleteSection(deleted_section);
//    }
*/

%>


<%
    //get the sections from database
    ArrayList<String>sections=(new DataAccess()).getSections();



    for(int i=0;i<sections.size();i++){


%>
<%=sections.get(i)%>&nbsp

<form style="display: inline" method="post" action="Manage_Sections.jsp" >
    <input type="hidden" name="old_section_name" value="<%=sections.get(i)%>"/>
<input type="text" name="updated_section_name" placeholder="new name">&nbsp
<input type="submit" value="update">
</form>


<!--
<form style="display: inline" method="post" action="Manage_Sections.jsp">
    <button name="deleted_section_name" type="submit" value="<%=sections.get(i)%>">DELETE</button>
</form>
-->
<br>

<%}%>

<form action="Manage_Sections.jsp" method="post">
    <input type="text" name="new_section" placeholder="name">&nbsp<input type="submit" value="create">
</form>



</body>
</html>
