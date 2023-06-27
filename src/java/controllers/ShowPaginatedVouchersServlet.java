/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.VoucherDAO;
import dto.Voucher;
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
public class ShowPaginatedVouchersServlet extends HttpServlet {

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
            int signal = Integer.parseInt(request.getParameter("signal"));
            int pageNumber = Integer.parseInt(request.getParameter("page"));
            int voucherPerPage = 6;
            if (signal == 1) {
                ArrayList<Voucher> alist = VoucherDAO.getAllVouchers();
                ArrayList<Voucher> list = VoucherDAO.getPaginatedVouchers(pageNumber, voucherPerPage, alist);
                request.setAttribute("vlist", list);
                request.setAttribute("signal", 1);
                request.setAttribute("vouchersList", alist);
                request.setAttribute("page", pageNumber);
                request.getRequestDispatcher("viewVouchers.jsp").forward(request, response);
            } 
            else if (signal == 2) {
                ArrayList<Voucher> uvlist = VoucherDAO.getVouchers();
                ArrayList<Voucher> list = VoucherDAO.getPaginatedVouchers(pageNumber, voucherPerPage, uvlist);
                request.setAttribute("vlist", list);
                request.setAttribute("signal", 2);
                request.setAttribute("vouchersList", uvlist);
                request.setAttribute("page", pageNumber);
                request.getRequestDispatcher("viewVouchers.jsp").forward(request, response);
            } else if (signal == 3) {
                ArrayList<Voucher> evlist = VoucherDAO.getExpiredVouchers();
                ArrayList<Voucher> list = VoucherDAO.getPaginatedVouchers(pageNumber, voucherPerPage, evlist);
                request.setAttribute("vlist", list);
                request.setAttribute("signal", 3);
                request.setAttribute("vouchersList", evlist);
                request.setAttribute("page", pageNumber);
                request.getRequestDispatcher("viewVouchers.jsp").forward(request, response);
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
            Logger.getLogger(ShowPaginatedVouchersServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ShowPaginatedVouchersServlet.class.getName()).log(Level.SEVERE, null, ex);
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
