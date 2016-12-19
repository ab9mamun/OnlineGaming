/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package muman.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.spi.http.HttpContext;
import muman.db.DataAccess;
import muman.etc.Webpage;
import muman.models.PendingMatch;

/**
 *
 * @author ab9ma
 */
@WebServlet(name = "PlayRandom", urlPatterns = {"/PlayRandom.do"})
public class PlayRandom extends HttpServlet {

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
               RequestDispatcher rd = request.getRequestDispatcher(Webpage.login);
                rd.forward(request, response);
           }
           else {
               String player2 = request.getParameter("player2");
               System.out.println("You are going to play with "+player2);
               DataAccess  db = new DataAccess();
               if(player2==null || player2.equals("")){
                   player2 = db.getRandomPlayer(username);
               }
               if(player2==null) {
                   request.setAttribute("message","No player available");}
               else{
                int id = db.addMatch(username, player2);
                   
                if(id>0) request.setAttribute("message", "Match has been played with "+player2+", Admin will announce the result.");
                else request.setAttribute("message", "Sorry, Match was not played.");
               }
                RequestDispatcher rd = request.getRequestDispatcher(Webpage.home);
                
                rd.forward(request, response);
               
           }
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
