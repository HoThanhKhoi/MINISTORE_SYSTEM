/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author ACER
 */
public class ProductDAO {

    public static ArrayList<Product> getProducts(String keyword) throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && keyword != null) {
                String sql = "select ProductID,ProductName,Price,Description,StockQuantity,PRODUCTS.ImgPath,PRODUCTS.CateID\n"
                        + "from PRODUCTS where PRODUCTS.ProductName like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("ProductID");
                        String name = rs.getString("ProductName");
                        float price = rs.getFloat("Price");
                        String description = rs.getString("Description");
                        int stockQuantity = rs.getInt("StockQuantity");
                        String imgpath = rs.getString("imgPath");
                        int cateid = rs.getInt("CateID");
                        Product product = new Product(id, name, price, description, stockQuantity, imgpath, cateid);
                        list.add(product);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }
}
