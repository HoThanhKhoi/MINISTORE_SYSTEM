/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import dao.UserDAO;
import dto.User;

/**
 *
 * @author ACER
 */
public class Tester {
    public static void main(String[] args) throws Exception {
        User user = UserDAO.getUser("ministoremanager@gmail.com", "tlbk2003fptk17");
        System.out.println(user.getName() + "," + user.getEmail() + "," + user.getPassword());
    }
}
