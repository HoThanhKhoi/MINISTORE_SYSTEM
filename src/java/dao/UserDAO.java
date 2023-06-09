/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.User;
import Utils.DBUtils;
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

    public static int updateUser(int userID, String newName, String newPhone, int status) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int check = 0;
        if (cn != null) {
            String sql = "UPDATE USERS SET UserName = ?,Phone= ?,Status= ? where UserID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, newName);
            pst.setString(2, newPhone);
            pst.setInt(3, status);
            pst.setInt(4, userID);
            check = pst.executeUpdate();
        }
        return check;
    }

    public static User getUser(String email) throws Exception {
        Connection cn = DBUtils.makeConnection();
        User us = null;
        if (cn != null) {
            String sql = "Select * from USERS where Email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int userID = rs.getInt("UserID");
                    String userName = rs.getString("UserName");
                    String password = rs.getString("Password");
                    String phone = rs.getString("Phone");
                    String address = rs.getString("UserAddress");
                    int status = rs.getInt("status");
                    int roleID = rs.getInt("RoleID");
                    int worksheetID = rs.getInt("WorksheetID");
                    us = new User(userID, userName, password, phone, address, email, status, roleID, worksheetID);
                }
            }
        }
        return us;
    }

    public static ArrayList<User> getUsersByRole(int roleID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        User us;
        ArrayList<User> list = new ArrayList<>();
        if (cn != null) {
            String sql = "Select * from USERS where RoleID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, roleID);
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                int userID = rs.getInt("UserID");
                String userName = rs.getString("UserName");
                String password = rs.getString("Password");
                String phone = rs.getString("Phone");
                String address = rs.getString("UserAddress");
                String email = rs.getString("Email");
                int status = rs.getInt("status");
                int worksheetID = rs.getInt("WorksheetID");
                us = new User(userID, userName, phone, address, email, password, status, roleID, worksheetID);
                list.add(us);
            }
        }
        return list;
    }

    public static boolean updatePassword(String email, String newPass) throws Exception {
        boolean flag = false;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "UPDATE [dbo].[USERS] set password = ? where Email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, newPass);
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
            String Email, String password, int status, int roleID, int worksheetID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int table = 0;
        if (cn != null) {
            String sql = "INSERT USERS (UserName, Phone, UserAddress, Email, Password,Status, RoleID, WorksheetID)\n"
                    + "VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, userName);
            pst.setString(2, phone);
            pst.setNull(3, Types.NULL);
            pst.setString(4, Email);
            pst.setString(5, md5(password));
            pst.setInt(6, status);
            pst.setInt(7, roleID);
            if (worksheetID == 0) {
                pst.setNull(8, Types.NULL);
            } else {
                pst.setNull(8, worksheetID);
            }
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

    public static ArrayList<User> getUsersByRole(int roleID) throws Exception {
        Connection cn = DBUtils.makeConnection();
        User us;
        ArrayList<User> list = new ArrayList<>();
        if (cn != null) {
            String sql = "Select * from USERS where RoleID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, roleID);
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                int userID = rs.getInt("UserID");
                String userName = rs.getString("UserName");
                String password = rs.getString("Password");
                String phone = rs.getString("Phone");
                String address = rs.getString("UserAddress");
                String email = rs.getString("Email");
                int status = rs.getInt("status");
                int worksheetID = rs.getInt("WorksheetID");
                us = new User(userID, userName, phone, address, email, password, status, roleID, worksheetID);
                list.add(us);
            }
        }
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

    public static int updateUser(int userID, String newName, String newPhone, int status) throws Exception {
        Connection cn = DBUtils.makeConnection();
        int check = 0;
        if (cn != null) {
            String sql = "UPDATE USERS SET UserName = ?,Phone= ?,Status= ? where UserID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, newName);
            pst.setString(2, newPhone);                                    
            pst.setInt(3, status);
            pst.setInt(4, userID);
            check = pst.executeUpdate();
        }
        return check;
    }
}
