/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.UserDAO;
import dto.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ChangePasswordServlet extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
int userid = Integer.parseInt(request.getParameter(("userid")));
            String currentpw = request.getParameter("currentpw");
            String newpw = request.getParameter("newpw");
            String confirmpw = request.getParameter("confirmpw");
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("customer");
            if (!currentpw.equals(user.getPassword())) {
                request.setAttribute("error", "Wrong password.");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            } else if (!newpw.matches("^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$")) {
                request.setAttribute("error", "Password must be at least 8 characters long with 1 uppercase and 1 lowercase.");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            } else if (!newpw.equals(confirmpw)) {
                request.setAttribute("error", "Password does not match.");
                request.getRequestDispatcher("changePassword.jsp").forward(request, response);
            } else {
                int tmp = UserDAO.updatePassword(userid, newpw);
                if (tmp == 1) {
                    user = UserDAO.getUser(userid);
                    session.setAttribute("customer", user);
                    request.setAttribute("noti", "Change password successfully.");
                    request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Change password failed.");
                    request.getRequestDispatcher("changePassword.jsp").forward(request, response);
                }
            }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
