/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.OrderDAO;
import dto.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
public class ConfirmCartServlet extends HttpServlet {

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
            HttpSession session = request.getSession(false);
            String customerID = request.getParameter("cusID");
            String customerName = request.getParameter("cusName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String postalCode = request.getParameter("postalCode");
            Timestamp time = new Timestamp(System.currentTimeMillis());
            HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
            String voucherID;
            if (session.getAttribute("voucher") == null) {
                voucherID = null;
            } else {
                Voucher voucher = (Voucher) session.getAttribute("voucher");
                voucherID = voucher.getVoucherID();
            }
            String totalMoney = request.getParameter("totalMoney");
            if (cart != null && !cart.isEmpty()) {
                if (session.getAttribute("customer") == null) { //not login
                    request.setAttribute("error", "You must login to checkout.");
                } else {
                    boolean result = OrderDAO.insertOrder(customerID, customerName, 
                            phone, address, postalCode, cart, Float.parseFloat(totalMoney), voucherID);
                    if (result) {
                        session.setAttribute("cart", null);
                        session.setAttribute("voucher", null);
                        session.setAttribute("totalMoney", null);
                        request.setAttribute("noti", "Save sucessfully.");
                        request.getRequestDispatcher("orderSuccessful.jsp").forward(request, response);
                    } else {
                        request.setAttribute("error", "Save fail.");
                        request.getRequestDispatcher("cartConfirmation.jsp").forward(request, response);
                    }
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
