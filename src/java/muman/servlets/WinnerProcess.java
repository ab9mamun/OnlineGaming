/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package muman.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import muman.db.DataAccess;
import muman.etc.Webpage;
import muman.models.PendingMatch;

/**
 *
 * @author ab9ma
 */
@WebServlet(name = "WinnerProcess", urlPatterns = {"/WinnerProcess.do"})
public class WinnerProcess extends HttpServlet {

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
           
             int match_id = Integer.parseInt(request.getParameter("match_id"));
             String player1 = request.getParameter("player1");
             String player2 = request.getParameter("player2");
             
             int score1 = Integer.parseInt(request.getParameter("score1"));
             int score2 = Integer.parseInt(request.getParameter("score2"));
             
             DataAccess db = new DataAccess();
             db.updateMatch(match_id, player1,score1, player2,  score2);
             
             request.getRequestDispatcher(Webpage.pendingmatches).forward(request, response);
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
