/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class MainController extends HttpServlet {
    private String url;
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
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            if (action == null || action.equals("") || action.equalsIgnoreCase("search")){
                url = "homePage.jsp";
            } else if (action.equalsIgnoreCase("login")) {
                url = "LoginServlet";
            } else if (action.equalsIgnoreCase("logout")) {
                url = "LogoutServlet";
            } else if (action.equalsIgnoreCase("editProfile")) {
                url = "EditProfileServlet";
            } else if (action.equalsIgnoreCase("changePassword")) {
                url = "ChangePasswordServlet";
            }else if(action.equals("viewProduct")) {
             	url="ViewProductServlet";
			}
             else if(action.equals("register")) {
             url="register.jsp";
             }
             else if(action.equals("backToHome")) {
             url="homePage.jsp";
             }
             else if(action.equals("showPage")) {
             url="ShowPaginateServlet";
			 }
//            switch(action) {
//                case "login":
//                    url = "LoginServlet";
//                    break;
//                case "logout":
//                    url = "LogoutServlet";
//                case "editProfilePage":
//                    break;
//                    break;
//                    url = "editProfile.jsp";
//                case "editProfile":
//                    break;
//                    url = "EditProfileServlet";
//                case "loadProfile":
//                    url = "LoadProfileServlet";
//            }
//                    break;
            request.getRequestDispatcher(url).forward(request, response);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    @Override
            throws ServletException, IOException {
        processRequest(request, response);
    }
    /**
     *

     * Handles the HTTP <code>POST</code> method.
     * @param response servlet response
     * @param request servlet request
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
            throws ServletException, IOException {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        processRequest(request, response);

     * Returns a short description of the servlet.
    }
    /**
     *
     * @return a String containing servlet description
    @Override
     */
        return "Short description";
    }// </editor-fold>

}
    public String getServletInfo() {
