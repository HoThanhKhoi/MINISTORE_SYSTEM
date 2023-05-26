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
 * @author ACER
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        try {
            User user = UserDAO.getUser(email, UserDAO.md5(password));
            if (user == null) {
                request.setAttribute("error", "Wrong email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                if (user.getStatus() == 1) {
                    HttpSession session = request.getSession();

                    //luu account tren Cookie
                    if (remember != null) {
                        Cookie e = new Cookie("emailC", email);
                        Cookie p = new Cookie("passC", password);
                        e.setMaxAge(60*60*24*365);
                        p.setMaxAge(60*60*24*365);

                        //luu e va p tren browser
                        response.addCookie(e);
                        response.addCookie(p);
                    }
                    switch (user.getRole()) {
                        case 0:
                            session.setAttribute("manager", user);
                            break;
                        case 1:
                            session.setAttribute("sales", user);
                            break;
                        case 2:
                            session.setAttribute("guard", user);
                            break;
                        default:
                            session.setAttribute("customer", user);

                            response.sendRedirect("homePage.jsp");
                            break;
                    }

                } else {
                    request.setAttribute("error", "This account has been blocked.");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
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
