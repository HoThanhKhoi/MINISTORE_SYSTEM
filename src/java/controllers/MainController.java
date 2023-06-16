/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    private String url = "";

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
            String action = request.getParameter("action");
            if (action == null || action.equalsIgnoreCase("")) {
                url = "homePage.jsp";
            } else if (action.equalsIgnoreCase("register")) {
                url = "register.jsp";
            } else if (action.equalsIgnoreCase("login")) {
                url = "LoginServlet";
            } else if (action.equalsIgnoreCase("logout")) {
                url = "LogoutServlet";
            } else if (action.equalsIgnoreCase("backToHome")) {
                url = "homePage.jsp";
            } else if (action.equalsIgnoreCase("viewProduct")) {
                url = "ViewProductServlet";
            } else if (action.equalsIgnoreCase("showPage")) {
                url = "ShowPaginateServlet";
            } else if (action.equalsIgnoreCase("editProfile")) {
                url = "EditProfileServlet";
            } else if (action.equalsIgnoreCase("changePassword")) {
                url = "ChangePasswordServlet";
            } else if (action.equalsIgnoreCase("addToCart")) {
                url = "AddToCartServlet";
            } else if (action.equalsIgnoreCase("viewCart")) {
                url = "ViewCartServlet";
            } else if (action.equalsIgnoreCase("deleteCart")) {
                url = "DeleteCartServlet";
            } else if (action.equalsIgnoreCase("updateCart")) {
                url = "UpdateCartServlet";
            } else if (action.equalsIgnoreCase("applyVoucher")) {
                url = "ApplyVoucherServlet";
            } else if (action.equalsIgnoreCase("viewCustomers")) {
                url = "ViewCustomersServlet";
            } else if (action.equalsIgnoreCase("viewCustomerDetailsPage")) {
                url = "ViewCustomerDetailsServlet";
            } else if (action.equalsIgnoreCase("updateUser")) {
                url = "UpdateUserServlet";
            } else if (action.equalsIgnoreCase("cartConfirmationPage")) {
                url = "CartConfirmationPageServlet";
            } else if (action.equalsIgnoreCase("confirmCart")) {
                url = "ConfirmCartServlet";
            } else if(action.equalsIgnoreCase("viewProductByCategory")){
                url = "ViewProductByCateGoryServlet";
            } else if(action.equalsIgnoreCase("searchProduct")){
                url = "GetSearchedProductsServlet";
            }else if(action.equalsIgnoreCase("showSearchedPage")){
                url = "ShowPaginatedSearchedServlet";
            } else if(action.equalsIgnoreCase("viewGuards")){
                url = "ViewGuardServlet";
            } else if(action.equalsIgnoreCase("viewGuardDetailsPage")){
                url = "ViewGuardDetailServlet";
            } else if(action.equalsIgnoreCase("updateUser")){
                url = "UpdateUserServlet";
            } else if(action.equalsIgnoreCase("viewSales")){
                url = "ViewSalesServlet";
            } else if(action.equalsIgnoreCase("viewSaleDetailsPage")){
                url = "ViewSaleDetailServlet";
            } else if(action.equalsIgnoreCase("viewCustomers")){
                url = "ViewCustomersServlet";       		
            } else if(action.equalsIgnoreCase("showUserPage")){
                url = "ShowPaginatedUsersServlet";
            } else if(action.equalsIgnoreCase("confirmEmail")){
                url = "ConfirmEmailServlet";
            } else if (action.equalsIgnoreCase("cartConfirmationPage")) {
                url = "CartConfirmationPageServlet";
            } else if (action.equalsIgnoreCase("confirmCart")) {
                url = "ConfirmCartServlet";
            } else if (action.equalsIgnoreCase("searchUsers")) {
                url = "SearchUsersServlet";
            } else if (action.equalsIgnoreCase("manageSaleOrders")) {
                url = "ManageSaleOrdersServlet";
            } else if (action.equalsIgnoreCase("addEmployeePage")) {
                url = "ChangeToAddPageServlet";
            } else if (action.equalsIgnoreCase("addEmployee")) {
                url = "AddEmployeeServlet";
            } else if (action.equalsIgnoreCase("viewAllProducts")) {
                url = "ViewAllProductsServlet";
            } else if (action.equalsIgnoreCase("viewAllCategories")) {
                url = "ViewAllCategoriesServlet";
            } else if (action.equalsIgnoreCase("showItemsPage")) {
                url = "ShowPaginatedItemsServlet";
            }

 
             RequestDispatcher rd = request.getRequestDispatcher(url);
             rd.forward(request, response);    
             
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
