/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import dao.ProductDAO;
import dao.UserDAO;
import dto.Product;
import dto.User;
import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class Tester {

    public static void main(String[] args) throws Exception {
//        User user = UserDAO.getUser("customer18@gmail.com", "12345");
//        User user = UserDAO.getUser(30);
//        System.out.println(user.getName() + "," + user.getEmail() + "," + user.getPassword());

//        int result = UserDAO.updateAccount(37, "customer26@gmail.com", "Customer26", "0123123123", "Address 26");
//        System.out.println(result);
//        int tmp = UserDAO.updatePassword(29, "123");
//        System.out.println(tmp);

//        if (!"fsdoO8c#".matches("^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$")) {
//            System.out.println("ye");
//        } else System.out.println("f");

        ArrayList<Product> list = ProductDAO.getProducts("rice");
        for (Product product : list) {
            System.out.println(product.getProductID() + "," + product.getProductName() + "," + product.getPrice());
        }
    }
}
