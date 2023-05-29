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
 * @author ACER
 */
<<<<<<<< HEAD:src/java/controllers/EditProfileServlet.java
public class EditProfileServlet extends HttpServlet {
========
public class ChangeNewPasswordServlet extends HttpServlet {
>>>>>>>> origin/Bao:src/java/controllers/ChangeNewPasswordServlet.java

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
            int userID = Integer.parseInt(request.getParameter("userID"));
            String newName = request.getParameter("name");
            String newPhone = request.getParameter("phone");
            String newAdd = request.getParameter("address");
            HttpSession session = request.getSession();
            if (!newPhone.matches("^[0-9]{10}$")) {
                request.setAttribute("error", "Invalid phone number.");
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            } else {
                int tmp = UserDAO.updateAccount(userID, newName, newPhone, newAdd);
                if (tmp == 1) {
                    User user = UserDAO.getUser(userID);
                    session.setAttribute("customer", user);
                    request.setAttribute("noti", "Save successfully.");
                    request.getRequestDispatcher("customerProfile.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Edit profile failed.");
                    request.getRequestDispatcher("editProfile.jsp").forward(request, response);
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
<<<<<<<< HEAD:src/java/controllers/EditProfileServlet.java
            Logger.getLogger(EditProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
========
            Logger.getLogger(ChangeNewPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
>>>>>>>> origin/Bao:src/java/controllers/ChangeNewPasswordServlet.java
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
<<<<<<<< HEAD:src/java/controllers/EditProfileServlet.java
            Logger.getLogger(EditProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
========
            Logger.getLogger(ChangeNewPasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
>>>>>>>> origin/Bao:src/java/controllers/ChangeNewPasswordServlet.java
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
