package controllers;


import dao.CategoryDAO;
import dao.ProductDAO;
import dao.UserDAO;
import dto.Category;
import dto.Product;
import Utils.DBUtils;
import dao.OrderDAO;
import dao.WorksheetDAO;
import dto.Order;
import dto.User;
import dto.Worksheet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
ArrayList<Worksheet> list = WorksheetDAO.getAllWorksheets();
    for(int i = 0; i< list.size();i++){
        System.out.println(list.get(i).getCoeffiecent());
    }
    
    
}
}
