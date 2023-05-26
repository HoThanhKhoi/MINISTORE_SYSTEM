package controllers;


import DAO.UserDAO;
import Utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
        Connection cn = DBUtils.makeConnection();
        if(cn != null){
            String sql = "Select * from USERS";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet table = pst.executeQuery();
            while(table.next()){
                String name = table.getString("UserName");
                System.out.println(name); 
        }
            int a = UserDAO.insertAccount("bao1", "bao1", null, "bao1", "bao1", 0, 0, 0);
            System.out.println(a);
        
        }
   }
}

