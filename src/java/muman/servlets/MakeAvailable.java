/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package muman.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import muman.db.DataAccess;
import muman.etc.Webpage;

/**
 *
 * @author ab9ma
 */
public class MakeAvailable extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
      try{
           HttpSession session = request.getSession();
           String username = (String) session.getAttribute("username");
           if(username==null){
               request.getRequestDispatcher(Webpage.login).forward(request, response);
           }
           String i_will_be = request.getParameter("i_will_be");
           DataAccess db = new DataAccess();
           if(i_will_be!=null && i_will_be.equals("available")){
             int count = db.makeMeAvailable(username);
             if(count>0){
                 request.setAttribute("message", "You are available to play now.");
             }
          }
           else if(i_will_be!=null && i_will_be.equals("unavailable")){
             int count = db.makeMeUnvailable(username);
             if(count>0){
                 request.setAttribute("message", "You are unavailable to play now.");
             }
          }
           request.getRequestDispatcher(Webpage.home).forward(request, response);
      }
      catch(Exception e){
          e.printStackTrace();
      }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
