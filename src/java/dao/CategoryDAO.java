/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Category;
import utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    public static Category getCategory(String CateID) throws Exception {
        Category cate = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "Select CateName,ImgPath from CATEGORIES where CateID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, CateID);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                String CateName = rs.getString("CateName");
                String imgPath = rs.getString("ImgPath");
                cate = new Category(CateID, CateName, imgPath);
            }
            cn.close();
        }
        return cate;
    }
    
    public static ArrayList<Category> getCategories() throws Exception {
        Connection cn = DBUtils.makeConnection();
        ArrayList<Category> cateList = new ArrayList<>();
        if (cn != null) {
            String sql = "Select CateID,CateName,ImgPath from CATEGORIES";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String CateID = rs.getString("CateID");
                    String CateName = rs.getString("CateName");
                    String imgPath = rs.getString("ImgPath");
                    Category cate = new Category(CateID, CateName, imgPath);
                    cateList.add(cate);
                }
            }
        }
        cn.close();
        return cateList;
    }
    
    
    
    
    public static ArrayList<Category> getPaginatedCategory(int pageNumber, int productPerPage) throws Exception {
        ArrayList<Category> list = new ArrayList<>();
        ArrayList<Category> cateList = CategoryDAO.getCategories();
        Connection cn = DBUtils.makeConnection();
        int start = (pageNumber - 1) * productPerPage;
        int end = start + productPerPage - 1;
        if (end > cateList.size()) {
            end = cateList.size() - 1;
        }
        for (int i = start; i <= end; i++) {
            list.add(cateList.get(i));
        }
        return list;
    }
    
    public static ArrayList<String> getImgPath() throws Exception{
        ArrayList<String> imgList = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null){
            String sql = "select distinct [ImgPath] from [dbo].[CATEGORIES]";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs != null && rs.next()){
                imgList.add(rs.getString("imgPath"));
            }
            cn.close();
        }
        return imgList;
    }
    
    public static boolean updateCategory(String cateID, String cateName, String imgpath) throws Exception {
        boolean flag = false;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "update CATEGORIES\n"
                    + "set [CateName]=?,[ImgPath]=?\n"
                    + "where CateID=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, cateName);
            pst.setString(2, imgpath);
            pst.setString(3, cateID);
            flag = pst.executeUpdate() == 1;
            cn.close();
        }
        return flag;
    }
}
