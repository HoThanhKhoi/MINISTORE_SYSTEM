/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.OrderDAO;
import dto.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class ReorderServlet extends HttpServlet {

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
            String orderID = request.getParameter("orderid");
            ArrayList<OrderDetail> list = OrderDAO.getOrderDetail(orderID);
            HttpSession session = request.getSession(true); //get session storing shopping cart
            if (session != null) {
                HashMap<String, Integer> cart = (HashMap<String, Integer>) session.getAttribute("cart");
                for (OrderDetail orderDetail : list) {
                    if (cart == null) { //if cart is empty then create a new cart
                        cart = new HashMap<>();
                        cart.put(orderDetail.getProductID(), orderDetail.getQuantity());
                    } else {
                        Integer tmp = cart.get(orderDetail.getProductID()); //check if the product exists in the cart
                        if (tmp == null) {
                            cart.put(orderDetail.getProductID(), orderDetail.getQuantity());
                        } else {
                            tmp += orderDetail.getQuantity();
                            cart.put(orderDetail.getProductID(), tmp);
                        }
                    }
                }
                
                session.setAttribute("cart", cart);
                response.sendRedirect("MainController?action=viewCart");
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
