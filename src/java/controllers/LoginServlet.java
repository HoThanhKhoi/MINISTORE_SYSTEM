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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Admin
 */
public class LoginServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        
        //create cookie
        Cookie ce = new Cookie("cemail", email);
        Cookie cp = new Cookie("cpass", password);
        Cookie cr = new Cookie("crem", remember);
        if (remember != null) {
            ce.setMaxAge(60*60*24*180);
            cp.setMaxAge(60*60*24*180);
            cr.setMaxAge(60*60*24*180);
        } else {
            ce.setMaxAge(0);
            cp.setMaxAge(0);
            cr.setMaxAge(0);
        }
        //save cookie to browser
        response.addCookie(ce);
        response.addCookie(cp);
        response.addCookie(cr);
        
        try {
            User user = UserDAO.getUser(email, UserDAO.md5(password));
            if (user == null) {
                request.setAttribute("error", "Wrong email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                if (user.getStatus() == 1) {
                    HttpSession session = request.getSession();

                    switch (user.getRole()) {
                        case 0:
                            session.setAttribute("manager", user);
                            response.sendRedirect("managerDashboard.jsp");
                            
                            break;
                        case 1:
                            session.setAttribute("sales", user);
                            break;
                        case 2:
                            session.setAttribute("guard", user);
                            break;
                        default:
                            session.setAttribute("customer", user);
                            session.setAttribute("email", user.getEmail());
                            response.sendRedirect("homePage.jsp");
                            break;
                    }

                } else {
                    request.setAttribute("error", "This account has been blocked.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
