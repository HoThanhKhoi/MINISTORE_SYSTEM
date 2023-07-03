/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.User;
import utils.DBUtils;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public static User getUser(String email, String password) throws Exception {
        Connection cn = null;
        User user = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select UserID,UserName,Phone,UserAddress,Email,Password,Status,RoleID\n"
                        + "from USERS where Email=? and Password=? COLLATE Latin1_General_CS_AI";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String userID = rs.getString("UserID");
                    String userName = rs.getString("UserName");
                    String userPhone = rs.getString("Phone");
                    String userAddress = rs.getString("UserAddress");
                    String userEmail = rs.getString("Email");
                    String userPassword = rs.getString("Password");
                    int userStatus = rs.getInt("Status");
                    int userRole = rs.getInt("RoleID");
                    user = new User(userID, userName, userPhone, userAddress, email, password, userStatus, userRole);
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

    public static User getUser(String id) throws Exception {
        Connection cn = null;
        User user = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select UserID,UserName,Phone,UserAddress,Email,Password,Status,RoleID\n"
                        + "from USERS where UserID=?";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String userID = rs.getString("UserID");
                    String userName = rs.getString("UserName");
                    String userPhone = rs.getString("Phone");
                    String userAddress = rs.getString("UserAddress");
                    String userEmail = rs.getString("Email");
                    String userPassword = rs.getString("Password");
                    int userStatus = rs.getInt("Status");
                    int userRole = rs.getInt("RoleID");
                    user = new User(userID, userName, userPhone, userAddress, userEmail, userPassword, userStatus, userRole);
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

    public static int updateAccount(String userID, String newName, String newPhone, String newAdd) {
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
                pst.setString(4, userID);
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

    public static int updatePassword(String userID, String newPass) {
        int result = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update USERS set Password=? where UserID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, md5(newPass));
                pst.setString(2, userID);
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

    public static User getUserByEmail(String email) throws Exception {
        Connection cn = DBUtils.makeConnection();
        User us = null;
        if (cn != null) {
            String sql = "Select UserID,UserName,Password,Phone,UserAddress,Email,Status,RoleID from USERS where Email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String userName = rs.getString("UserName");
                    String password = rs.getString("Password");
                    String phone = rs.getString("Phone");
                    String address = rs.getString("UserAddress");
                    int status = rs.getInt("status");
                    int roleID = rs.getInt("RoleID");
                  
                    us = new User(userID, userName, phone, address, email, password, status, roleID);
                }
            }
        }
        return us;
    }

    public static boolean updateNewPassword(String email, String newPass) throws Exception {
        boolean flag = false;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "UPDATE [dbo].[USERS] set password = ? where Email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, UserDAO.md5(newPass));
            pst.setString(2, email);
            flag = pst.executeUpdate() == 1;
            cn.close();
        }

        return flag;

    }

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

    public static int insertAccount(String userName, String phone, String userAddress,
            String Email, String password, int status, int roleID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int table = 0;
        if (cn != null) {
            String sql = "INSERT USERS (UserName, Phone, UserAddress, Email, Password,Status, RoleID)\n"
                    + "VALUES (?,?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, userName);
            pst.setString(2, phone);
            if (userAddress == null) {
                pst.setNull(3, Types.NULL);
            } else {
                pst.setString(3, userAddress);
            }
            pst.setString(4, Email);
            pst.setString(5, md5(password));
            pst.setInt(6, status);
            pst.setInt(7, roleID);
            table = pst.executeUpdate();

            cn.close();
        }
        return table;

    }

    public static boolean isEmailDuplicate(String email) {
        boolean flag = false;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select UserID,UserName,Phone,UserAddress,Email,Password,Status,RoleID\n"
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

    public static ArrayList<User> getUsersByRole(int roleID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        User us;
        ArrayList<User> list = new ArrayList<>();
        if (cn != null) {
            String sql = "Select  UserID,UserName,Phone,UserAddress,Email,Password,Status,RoleID from USERS where RoleID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, roleID);
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                String userID = rs.getString("UserID");
                String userName = rs.getString("UserName");
                String password = rs.getString("Password");
                String phone = rs.getString("Phone");
                String address = rs.getString("UserAddress");
                String email = rs.getString("Email");
                int status = rs.getInt("status");
                us = new User(userID, userName, phone, address, email, password, status, roleID);
                list.add(us);
            }
        }
        cn.close();
        return list;
    }

    public static ArrayList<User> getPaginatedEmployees(int pageNumber, int productPerPage, int roleID) throws Exception {
        ArrayList<User> list = new ArrayList<>();
        ArrayList<User> employeeList = UserDAO.getUsersByRole(roleID);
        Connection cn = DBUtils.makeConnection();
        int start = (pageNumber - 1) * productPerPage;
        int end = start + productPerPage - 1;
        if (end > employeeList.size()) {
            end = employeeList.size() - 1;
        }
        for (int i = start; i <= end; i++) {
            list.add(employeeList.get(i));
        }
        cn.close();
        return list;
    }

    public static int updateUser(String userID, String newName, String newPhone, int status) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int check = 0;
        if (cn != null) {
            String sql = "UPDATE USERS SET UserName = ?,Phone= ?,Status= ? where UserID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, newName);
            pst.setString(2, newPhone);
            pst.setInt(3, status);
            pst.setString(4, userID);
            check = pst.executeUpdate();
        }
        cn.close();
        return check;
    }

    public static ArrayList<User> searchUsers(int roleID, String keyword) throws Exception {
        ArrayList<User> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        User us = null;
        if (cn != null) {
            String sql = "Select UserID,UserName,Phone,UserAddress,Email,Password,Status,RoleID from USERS where RoleID = ? and (UserID like ? or UserName like ? or UserAddress like ?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1,roleID);
            pst.setString(2, '%' + keyword + '%');
            pst.setString(3, '%' + keyword + '%');
            pst.setString(4, '%' + keyword + '%');
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                String userID = rs.getString("UserID");
                String userName = rs.getString("UserName");
                String password = rs.getString("Password");
                String phone = rs.getString("Phone");
                String address = rs.getString("UserAddress");
                String email = rs.getString("Email");
                int status = rs.getInt("status");
                us = new User(userID, userName, phone, address, email, password, status, roleID);
                list.add(us);
            }
        }
        cn.close();
        return list;

        }
    
    public static ArrayList<User> getPaginatedSearchedUsers(int pageNumber, int productPerPage, int roleID,String keyword) throws Exception {
        ArrayList<User> list = new ArrayList<>();
        ArrayList<User> employeeList = UserDAO.searchUsers(roleID, keyword);
        Connection cn = DBUtils.makeConnection();
        int start = (pageNumber - 1) * productPerPage;
        int end = start + productPerPage - 1;
        if (end > employeeList.size()) {
            end = employeeList.size() - 1;
        }
        for (int i = start; i <= end; i++) {
            list.add(employeeList.get(i));
        }
        cn.close();
        return list;
    }
    }


