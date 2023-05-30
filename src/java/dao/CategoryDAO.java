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
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    public static Category getCategory(int CateID) throws Exception {
        Category cate = null;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "Select CateName,ImgPath from CATEGORIES where CateID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, CateID);
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
            String sql = "Select * from CATEGORIES";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int CateID = rs.getInt("CateID");
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
}
