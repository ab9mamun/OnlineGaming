package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import muman.db.DataAccess;
import muman.etc.Webpage;
import java.util.ArrayList;
import java.util.Collections;

public final class Manage_005fSections_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Manage Section</title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "navigation.jsp", out, false);
      out.write("\n");
      out.write("  ");

  String username = (String) session.getAttribute("username");
  if(username==null) request.getRequestDispatcher(Webpage.login).forward(request, response);
  if((new DataAccess()).isAdmin(username) == false) request.getRequestDispatcher(Webpage.home).forward(request, response);

      out.write("\n");
      out.write("    \n");
      out.write("<h1>SECTION MANAGEMENT</h1>\n");
      out.write("\n");

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
    
    String deleted_section = request.getParameter("deleted_section_name");
    if(deleted_section!=null && !deleted_section.equals("")){
        System.out.println(deleted_section);
        
       (new DataAccess()).deleteSection(deleted_section);
    }


      out.write("\n");
      out.write("\n");
      out.write("\n");

    //get the sections from database
    ArrayList<String>sections=(new DataAccess()).getSections();



    for(int i=0;i<sections.size();i++){



      out.write('\n');
      out.print(sections.get(i));
      out.write("&nbsp\n");
      out.write("\n");
      out.write("<form style=\"display: inline\" method=\"post\" action=\"Manage_Sections.jsp\" >\n");
      out.write("    <input type=\"hidden\" name=\"old_section_name\" value=\"");
      out.print(sections.get(i));
      out.write("\"/>\n");
      out.write("<input type=\"text\" name=\"updated_section_name\" placeholder=\"new name\">&nbsp\n");
      out.write("<input type=\"submit\" value=\"update\">\n");
      out.write("</form>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<form style=\"display: inline\" method=\"post\" action=\"Manage_Sections.jsp\">\n");
      out.write("    <button name=\"deleted_section_name\" type=\"submit\" value=\"");
      out.print(sections.get(i));
      out.write("\">DELETE</button>\n");
      out.write("</form>\n");
      out.write("\n");
      out.write("<br>\n");
      out.write("\n");
}
      out.write("\n");
      out.write("\n");
      out.write("<form action=\"Manage_Sections.jsp\" method=\"post\">\n");
      out.write("    <input type=\"text\" name=\"new_section\" placeholder=\"name\">&nbsp<input type=\"submit\" value=\"create\">\n");
      out.write("</form>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
