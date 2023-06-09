package controllers;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.UserDAO;
import dto.Category;
import dto.Product;
import Utils.DBUtils;
import dao.OrderDAO;
import dao.VoucherDAO;
import dto.User;
import dto.Voucher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

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

//        User us = UserDAO.getUser("customer1@gmail.com", "123");
//        System.out.println(us.getAddress());
        
//        for (Voucher voucher : VoucherDAO.getVouchers()) {
//            System.out.println(voucher.getVoucherID() + "," + voucher.getVoucherCode() + "," + voucher.getDiscount() + "," + voucher.getExpiredDate().toString());
//        }
        
//        Category cate = CategoryDAO.getCategory(1);
//        System.out.println(cate.getCateName());
        
//        Voucher voucher = VoucherDAO.getVoucher(1);
//        System.out.println(voucher.getVoucherID() + "," + voucher.getVoucherCode() 
//                + "," + voucher.getDiscount() + "," + voucher.getExpiredDate().toString());
        HashMap<Integer,Integer> cart = new HashMap<>();
        cart.put(1, 2);
        float money = (float) 3.98;
        boolean flag = OrderDAO.insertOrder(37, "0123123123", "Address 37", cart, money, 0);
        if (flag) {
            System.out.println("yay");
        } else System.out.println("boo");
    }
}
