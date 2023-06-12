package controllers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class RegisterServlet extends HttpServlet {

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
            String userName = request.getParameter("userName");
            String email = request.getParameter("userEmail");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
            String cfpassword = request.getParameter("cfpassword");
            int status = 1;
            int roleID = 3;
            String worksheetID = null;
            int result = 0;
            

            if (UserDAO.isEmailDuplicate(email)) {
                request.setAttribute("error","Email has already been existed");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            else if(!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")){
                request.setAttribute("error","Email was wrong(example@gmail.com)");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            else if (!phone.matches("^[0-9]{10}$")) {
                request.setAttribute("error","Phone must contain 10 numbers from 0 to 9");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } 
             else if (!password.matches("^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$")) {
                request.setAttribute("error","Password must contain at least 8 characters long with 1 uppercase and 1 lowercase.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            else if (!cfpassword.equals(password)) {
                request.setAttribute("error","Password confirmation is not correct");
                request.getRequestDispatcher("register.jsp").forward(request, response);
//        
            }
            else {
                result = UserDAO.insertAccount(userName, phone, null, email, password, status, roleID, worksheetID);
            }

            if (result == 1) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
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
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
