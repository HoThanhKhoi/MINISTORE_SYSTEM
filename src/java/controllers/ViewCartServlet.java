/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.VoucherDAO;
import dto.Product;
import dto.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
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
public class ViewCartServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            ArrayList<Voucher> voucherList = VoucherDAO.getVouchers();
            HashMap<Integer, Integer> cart = (HashMap<Integer, Integer>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
                float money = 0;
                Set<Integer> pidList = cart.keySet();
                HashMap<Integer, Float> priceList = new HashMap<>();
                HashMap<Integer, String> nameList = new HashMap<>();
                HashMap<Integer, String> imgList = new HashMap<>();
//                HashMap<Integer, Integer> cateIDList = new HashMap<>();
//                HashMap<Integer, String> cateList = new HashMap<>();
                for (int pid : pidList) {
                    int quantity = cart.get(pid);
                    Product p = ProductDAO.getProductInfo(pid);
                    money = money + p.getPrice() * quantity;
                    priceList.put(pid, p.getPrice());
                    nameList.put(pid, p.getProductName());
                    imgList.put(pid, p.getImgPath());
//                    cateIDList.put(p.getCateID(), pid);
//                    cateList.put(p.getCateID(), CategoryDAO.getCategory(p.getCateID()).getCateName());//get category name
                }
                session.setAttribute("subTotalMoney", money);
                session.setAttribute("priceList", priceList);
                session.setAttribute("nameList", nameList);
                session.setAttribute("imgList", imgList);
//                request.setAttribute("cateList", cateList);
//                request.setAttribute("cateIDList", cateIDList);
                session.setAttribute("voucherList", voucherList);
            }
            request.getRequestDispatcher("viewCart.jsp").forward(request, response);
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
            Logger.getLogger(ViewCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ViewCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
