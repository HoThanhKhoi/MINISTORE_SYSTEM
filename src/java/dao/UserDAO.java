/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.User;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utils.DBUtils;

/**
 *
 * @author ACER
 */
public class UserDAO {

    public static User getUser(String email, String password) throws Exception {
        Connection cn = null;
        User user = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select UserID,UserName,Phone,UserAddress,Email,Password,Status,RoleID,WorksheetID\n"
                        + "from USERS where Email=? and Password=? COLLATE Latin1_General_CS_AI";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int userID = rs.getInt("UserID");
                    String userName = rs.getString("UserName");
                    String userPhone = rs.getString("Phone");
                    String userAddress = rs.getString("UserAddress");
                    String userEmail = rs.getString("Email");
                    String userPassword = rs.getString("Password");
                    int userStatus = rs.getInt("Status");
                    int userRole = rs.getInt("RoleID");
                    int userWorksheet = rs.getInt("WorksheetID");
                    user = new User(userID, userName, userPhone, userAddress, email, password, userStatus, userRole, userWorksheet);
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
        return user;
    }
    
    public static User getUser(int id) throws Exception {
        Connection cn = null;
        User user = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select UserID,UserName,Phone,UserAddress,Email,Password,Status,RoleID,WorksheetID\n"
                        + "from USERS where UserID=?";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int userID = rs.getInt("UserID");
                    String userName = rs.getString("UserName");
                    String userPhone = rs.getString("Phone");
                    String userAddress = rs.getString("UserAddress");
                    String userEmail = rs.getString("Email");
                    String userPassword = rs.getString("Password");
                    int userStatus = rs.getInt("Status");
                    int userRole = rs.getInt("RoleID");
                    int userWorksheet = rs.getInt("WorksheetID");
                    user = new User(userID, userName, userPhone, userAddress, userEmail, userPassword, userStatus, userRole, userWorksheet);
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
        return user;
    }

    public static int updateAccount(int userID, String newName, String newPhone, String newAdd) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update USERS set UserName=?,Phone=?,UserAddress=? where UserID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, newName);
                pst.setString(2, newPhone);
                pst.setString(3, newAdd);
                pst.setInt(4, userID);
                result = pst.executeUpdate();
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
        return result;
    }
    
    public static int updatePassword(int userID, String newPass) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update USERS set Password=? where UserID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, md5(newPass));
                pst.setInt(2, userID);
                result = pst.executeUpdate();
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
        return result;
    }
    
    public static boolean isEmailDuplicate(String email) {
        boolean flag = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select UserID,UserName,Phone,UserAddress,Email,Password,Status,RoleID,WorksheetID\n"
                        + "from USERS where Email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        flag = true;
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
        return flag;
    }

    //md5
    public static String md5(String str) {
        MessageDigest md;
        String result = "";
        try {
            md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes());
            BigInteger bi = new BigInteger(1, md.digest());

            result = bi.toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return result;
    }
}
