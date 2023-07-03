/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Product;
import utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    public static ArrayList<Product> getProducts() throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "Select ProductID,ProductName,Price,Description,StockQuantity,ImgPath,CateID \n"
                    + "from PRODUCTS";
            Statement st = cn.createStatement();
            ResultSet table = st.executeQuery(sql);
            while (table.next()) {
                String productID = table.getString("ProductID");
                String productName = table.getString("ProductName");
                float price = table.getFloat("Price");
                String description = table.getString("Description");
                int quantity = table.getInt("StockQuantity");
                String imgPath = table.getString("ImgPath");
                String cateID = table.getString("CateID");
                Product product = new Product(productID, productName, price, description, quantity, imgPath, cateID);
                list.add(product);
            }
        }
        cn.close();
        return list;
    }

    public static Product getProductInfo(String pid) throws Exception {
        Product product = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "Select ProductID,ProductName,Price,Description,StockQuantity,ImgPath,CateID  from PRODUCTS where ProductID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, pid);
            ResultSet table = pst.executeQuery();
            if (table != null && table.next()) {
                String productName = table.getString("ProductName");
                float price = table.getFloat("Price");
                String description = table.getString("Description");
                int quantity = table.getInt("StockQuantity");
                String imgPath = table.getString("ImgPath");
                String cateID = table.getString("CateID");
                product = new Product(pid, productName, price, description, quantity, imgPath, cateID);
            }
        }
        return product;
    }

    public static int getTotalProduct() throws Exception {
        int total = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "Select COUNT(*) FROM PRODUCTS";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet table = pst.executeQuery();
            if (table.next()) {
                total = table.getInt(1);
            }
            cn.close();
        }
        return total;
    }

    public static ArrayList<Product> getPaginatedProduct(int pageNumber, int productPerPage) throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        ArrayList<Product> productList = ProductDAO.getProducts();
        Connection cn = DBUtils.makeConnection();
        int start = (pageNumber - 1) * productPerPage;
        int end = start + productPerPage - 1;
        if (end > productList.size() || end == productList.size() ) {
            end = productList.size() - 1;
        }
        for (int i = start; i <= end; i++) {
            list.add(productList.get(i));
        }
        return list;
    }

    public static ArrayList<Product> getCategorizedProducts(String cateID) throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        Product product;
        if (cn != null) {
            String sql = "Select ProductID,ProductName,Price,Description,StockQuantity,ImgPath,CateID  from PRODUCTS where CateID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, cateID);
            ResultSet table = pst.executeQuery();
            while (table.next() && table != null) {
                String pid = table.getString("ProductID");
                String productName = table.getString("ProductName");
                float price = table.getFloat("Price");
                String description = table.getString("Description");
                int quantity = table.getInt("StockQuantity");
                String imgPath = table.getString("ImgPath");
                product = new Product(pid, productName, price, description, quantity, imgPath, cateID);
                list.add(product);
            }
        }
        return list;
    }

    public static ArrayList<Product> getSearchedProducts(String keyword) throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        Product product;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "Select ProductID,ProductName,Price,Description,StockQuantity,PRODUCTS.ImgPath,PRODUCTS.CateID  from PRODUCTS JOIN CATEGORIES ON PRODUCTS.CateID = CATEGORIES.CateID WHERE ProductName like ? or CateName like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, '%' + keyword + '%');
            pst.setString(2, '%' + keyword + '%');
            ResultSet table = pst.executeQuery();
            while (table.next() && table != null) {
                String pid = table.getString("ProductID");
                String productName = table.getString("ProductName");
                float price = table.getFloat("Price");
                String description = table.getString("Description");
                int quantity = table.getInt("StockQuantity");
                String imgPath = table.getString("ImgPath");
                String cateID = table.getString("CateID");
                product = new Product(pid, productName, price, description, quantity, imgPath, cateID);
                list.add(product);
            }
        }
        return list;
    }

    public static ArrayList<Product> getPaginatedSearchedProduct(int pageNumber, int productPerPage, String keyword) throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        ArrayList<Product> productList = ProductDAO.getSearchedProducts(keyword);
        Connection cn = DBUtils.makeConnection();
        int start = (pageNumber - 1) * productPerPage;
        int end = start + productPerPage - 1;
        if (end > productList.size() || end == productList.size()) {
            end = productList.size() - 1;
        }
        for (int i = start; i <= end; i++) {
            list.add(productList.get(i));
        }
        return list;
    }

    public static ArrayList<Product> getAlertProducts() throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        Product product;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "Select ProductID,ProductName,Price,Description,StockQuantity,ImgPath,CateID from PRODUCTS \n"
                    + "where StockQuantity >= 10 and StockQuantity <= 30";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet table = pst.executeQuery();
            while (table.next() && table != null) {
                String pid = table.getString("ProductID");
                String productName = table.getString("ProductName");
                float price = table.getFloat("Price");
                String description = table.getString("Description");
                int quantity = table.getInt("StockQuantity");
                String imgPath = table.getString("ImgPath");
                String cateID = table.getString("CateID");
                product = new Product(pid, productName, price, description, quantity, imgPath, cateID);
                list.add(product);
            }
        }
        return list;

    }

    public static ArrayList<Product> getOutOfStocktProducts() throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        Product product;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "Select ProductID,ProductName,Price,Description,StockQuantity,ImgPath,CateID from PRODUCTS where  StockQuantity < 10";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet table = pst.executeQuery();
            while (table.next() && table != null) {
                String pid = table.getString("ProductID");
                String productName = table.getString("ProductName");
                float price = table.getFloat("Price");
                String description = table.getString("Description");
                int quantity = table.getInt("StockQuantity");
                String imgPath = table.getString("ImgPath");
                String cateID = table.getString("CateID");
                product = new Product(pid, productName, price, description, quantity, imgPath, cateID);
                list.add(product);
            }
        }
        return list;

    }

    public static ArrayList<Product> getPaginatedAlertProducts(int pageNumber, int productPerPage) throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        ArrayList<Product> productList = ProductDAO.getAlertProducts();
        Connection cn = DBUtils.makeConnection();
        int start = (pageNumber - 1) * productPerPage;
        int end = start + productPerPage - 1;
        if (end > productList.size() || end == productList.size()) {
            end = productList.size() - 1;
        }
        
        
        for (int i = start; i <= end; i++) {
            list.add(productList.get(i));
        }
        return list;
    }

    public static ArrayList<Product> getPaginatedOutProducts(int pageNumber, int productPerPage) throws Exception {
        ArrayList<Product> list = new ArrayList<>();
        ArrayList<Product> productList = ProductDAO.getOutOfStocktProducts();
        Connection cn = DBUtils.makeConnection();
        int start = (pageNumber - 1) * productPerPage;
        int end = start + productPerPage - 1;
        if (end > productList.size() || end == productList.size()) {
            end = productList.size() - 1;
        }
        for (int i = start; i <= end; i++) {
            list.add(productList.get(i));
        }
        return list;
    }

    public static int updateProduct(String pid, String productName, float price, String description, int quantity, String cateID) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "UPDATE PRODUCTS SET ProductName= ?,Price= ?,Description=?,StockQuantity=?,CateID=? \n"
                    + "where ProductID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, productName);
            pst.setFloat(2, price);
            pst.setString(3, description);
            pst.setInt(4, quantity);
            pst.setString(5, cateID);
            pst.setString(6,pid);
            result = pst.executeUpdate();
        }
        return result;
    }
    
    public static int addProduct(String pName,float price,String des,int stockQuantity,String imgPath,String cateID) throws Exception{
        int result = 0;
         Connection cn = DBUtils.makeConnection();
         try{
             if(cn != null){
                 String sql ="INSERT INTO PRODUCTS (ProductName,Price,Description,StockQuantity,ImgPath,CateID)"
                         + " VALUES (?,?,?,?,?,?)";
                 PreparedStatement pst = cn.prepareStatement(sql);
                 pst.setString(1,pName);
                 pst.setFloat(2,price);
                 pst.setString(3,des);
                 pst.setInt(4, stockQuantity);
                 pst.setString(5,imgPath);
                 pst.setString(6,cateID);
                 result = pst.executeUpdate();
             }
         }catch(Exception e){
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
         return result;
    }
//    product = new Product(pid, productName, price, description, quantity, imgPath, cateID);
}
