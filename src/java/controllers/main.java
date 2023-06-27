package controllers;

import java.time.LocalDate;
import java.time.temporal.WeekFields;
import dao.CategoryDAO;
import dao.ProductDAO;
import dao.UserDAO;
import dto.Category;
import dto.Product;
import utils.DBUtils;
import dao.OrderDAO;
import dao.VoucherDAO;
import dto.Order;
import dto.OrderDetail;
import dto.User;
import dto.Voucher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Admin
 */
public class main {

    public static void main(String[] args) throws Exception {
//        Connection cn = DBUtils.makeConnection();
//        if(cn != null){
//            String sql = "Select * from USERS";
//            PreparedStatement pst = cn.prepareStatement(sql);
//            ResultSet table = pst.executeQuery();
//            while(table.next()){
//                String name = table.getString("UserName");
//                System.out.println(name); 
//        }
//            int a = UserDAO.insertAccount("bao1", "bao1", null, "bao1", "bao1", 0, 0, 0);
//            System.out.println(a);
//        
//        }
//        ArrayList<Product> list = ProductDAO.getProducts();
//        for(int i = 0 ;i < list.size() ;i++){
//            System.out.println(list.get(i).getProductName());
//        }
//        Product product = ProductDAO.getProductInfo(1);
//        System.out.println(product.getProductName());
//       ArrayList<Category> list = CategoryDAO.getCategories();
//       for(int i = 0 ;i < list.size() ;i++){
//            System.out.println(list.get(i).getCateID());
//        }

//User us = UserDAO.getUser("customer1@gmail.com", "123");
//System.out.println(us.getAddress());
//float num = (float) 198/20;
//        System.out.println(num);
//   }
//    ArrayList<Product>list = ProductDAO.getPaginatedSearchedProduct(2, 20, "a");
//    for(int i = 0 ;i < list.size() ;i++){
//            System.out.println(list.get(i).getProductName());       }
//    ArrayList<User> list = UserDAO.getEmployees(2);
//    for(int i = 0;i<list.size();i++){
//        System.out.println(list.get(i).getName());
//    }
//System.out.println(FormatDouble.formatNumber(134.56789));
//        ArrayList<User> list = UserDAO.searchUsers(3, "h");
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println(list.get(i).getName());
//        }
//        Order order = OrderDAO.getOrderById("MS-0002");
//        System.out.println(order.getCustomerName() + order.getOrderID());
//        ArrayList<OrderDetail> list = OrderDAO.getOrderDetail("MS-0003");
//        for (OrderDetail orderDetail : list) {
//            System.out.println(orderDetail.getOrderDetailID() + "," + orderDetail.getOrderID());
//        }
//        ArrayList<Voucher> list = VoucherDAO.getExpiredVouchers();
//        for (Voucher v : list) {
//            System.out.println(v.getVoucherID()+","+v.getExpiredDate());
//        }
//        String t = "2023-05-31T00:00:00.0";
//        System.out.println(Timestamp.valueOf(t.replace("T", " ")));
//        
//        int result = VoucherDAO.updateVoucher("V-0011", "VOUCHER11", 2.8f, Timestamp.valueOf(t.replace("T", " ")), 200);
//        if (result > 0) {
//            System.out.println("yay");
//        } else {
//            System.out.println("bruh");
//        }
//        ArrayList<Category> list = CategoryDAO.getCategories();
//        for (int i = 0; i < list.size(); i++) {
//            System.out.println(list.get(i).getCateName());
//        }
//        ArrayList<String> imgList = CategoryDAO.getImgPath();
//        for (String string : imgList) {
//            System.out.println(string);
//        }
// ArrayList<Voucher> uvlist = VoucherDAO.getAllVouchers();
//                ArrayList<Voucher> list = VoucherDAO.getPaginatedVouchers(2, 6,uvlist);
//             for (int i = 0; i < list.size(); i++) {
//            System.out.println(list.get(i).getVoucherCode());
//        }   
        LocalDate startDate = LocalDate.of(2023, 1, 1);
        LocalDate endDate = LocalDate.of(2023, 12, 31);

        LocalDate current = startDate;
        WeekFields weekFields = WeekFields.ISO;

        while (current.isBefore(endDate) || current.isEqual(endDate)) {
            int weekNumber = current.get(weekFields.weekOfWeekBasedYear());
            System.out.println("Week " + weekNumber + ": " + current);

            current = current.plusDays(7);
        }
    }
}
