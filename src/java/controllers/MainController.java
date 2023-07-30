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
            } else if (action.equalsIgnoreCase("viewMyOrders")) {
                url = "ViewMyOrdersServlet";
            } else if (action.equalsIgnoreCase("viewMyOrdersByStatus")) {
                url = "ViewMyOrdersByStatusServlet";
            } else if (action.equalsIgnoreCase("viewOrderInformation")) {
                url = "ViewOrderInformationServlet";
            } else if (action.equalsIgnoreCase("updateOrderStatus")) {
                url = "UpdateOrderStatusServlet";
            } else if (action.equalsIgnoreCase("reorder")) {
                url = "ReorderServlet";
            } else if (action.equalsIgnoreCase("viewVouchers")) {
                url = "ViewAllVouchersServlet";
            } else if (action.equalsIgnoreCase("viewUnexpiredVouchers")) {
                url = "ViewUnexpiredVouchersServlet";
            } else if (action.equalsIgnoreCase("viewExpiredVouchers")) {
                url = "ViewExpiredVouchersServlet";
            } else if (action.equalsIgnoreCase("viewVoucherDetailsPage")) {
                url = "ViewVoucherDetailsServlet";
            } else if (action.equalsIgnoreCase("updateVoucher")) {
                url = "UpdateVoucherServlet";
            } else if (action.equalsIgnoreCase("addVoucher")) {
                url = "AddVoucherServlet";
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
            } else if (action.equalsIgnoreCase("viewProductDetailsPage")) {
                url = "ViewProductDetailsPageServlet";
            } else if (action.equalsIgnoreCase("viewAlertProducts")) {
                url = "ViewAlertProductsServlet";
            } else if (action.equalsIgnoreCase("viewOutOfStockProducts")) {
                url = "ViewOutOfStockProductsServlet";
            } else if (action.equalsIgnoreCase("showAlertItemsPage")) {
                url = "ShowPaginatedAlertItemsServlet";
            } else if (action.equalsIgnoreCase("getSearchedProduct")) {
                url = "ManageSearchedProductsServlet";
            } else if (action.equalsIgnoreCase("showSearchedItemsPage")) {
                url = "ManagePaginatedSearchedProductsServlet";
            } else if (action.equalsIgnoreCase("viewAllCategories")) {
                url = "ViewAllCategoriesServlet";
            } else if (action.equalsIgnoreCase("viewCategoryDetailsPage")) {
                url = "updateCategory.jsp";
            } else if (action.equalsIgnoreCase("updateCategory")) {
                url = "UpdateCategoryServlet";
            } else if (action.equalsIgnoreCase("updateProduct")) {
                url = "UpdateProductServlet";
            } else if (action.equalsIgnoreCase("showPaginatedUserPage")) {
                url = "ShowPaginatedSearhedUsersServlet";
            } else if (action.equalsIgnoreCase("showVouchersPage")) {
                url = "ShowPaginatedVouchersServlet";
            } else if(action.equalsIgnoreCase("addNewCategory")) {
                url="AddNewCategoryServlet";
            } else if (action.equalsIgnoreCase("searchVoucher")) {
                url = "SearchVouchersServlet";
            } else if (action.equalsIgnoreCase("deleteEmployee")) {
                url = "DeleteEmployeeServlet";
            } else if (action.equalsIgnoreCase("viewAddPage")) {
                url = "addProduct.jsp";
            } else if (action.equalsIgnoreCase("addProduct")) {
                url = "AddNewProductServlet";
            } else if (action.equalsIgnoreCase("viewAllOrders")) {
                url = "ViewAllOrdersServlet";
            } else if (action.equalsIgnoreCase("viewOrderDetailsPage")) {
                url = "ViewOrderDetailsPageServlet";
            } else if (action.equalsIgnoreCase("viewSchedule")) {
                url = "viewEmployeeSchedule.jsp";
            } else if (action.equalsIgnoreCase("changeOrderStatus")) {
                url = "ChangeOrderStatusServlet";
            } else if (action.equalsIgnoreCase("viewCustomerOrders")) {
                url = "ViewCustomerOrders";
            } else if (action.equalsIgnoreCase("saleViewOrderDetailsPage")) {
                url = "SaleViewOrderDetailsPageServlet";
            } else if (action.equalsIgnoreCase("saleChangeOrderStatus")) {
                url = "SaleChangeOrderStatusServlet";
            } else if (action.equalsIgnoreCase("getEmployeeSchedule")) {
                url = "GetEmployeeScheduleServlet";
            } else if (action.equalsIgnoreCase("searchByCustomerID")) {
                url = "SearchByCustomerIDServlet";
            } else if (action.equalsIgnoreCase("showOrdersPage")) {
                url = "ShowPaginatedOrdersServlet";
            } else if (action.equalsIgnoreCase("showMyOrdersPage")) {
                url = "ShowPaginatedMyOrdersServlet";
            } else if (action.equalsIgnoreCase("showSaleOrdersPage")) {
                url = "ShowPaginatedSaleOrderServlet";
            } else if (action.equalsIgnoreCase("viewSaleOrdersByStatus")) {
                url = "ViewSaleOrdersByStatusServlet";
            } else if (action.equalsIgnoreCase("saleSearchByCustomerID")) {
                url = "SaleSearchByCustomerIDServlet";
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
