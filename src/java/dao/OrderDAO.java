/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Utils.DBUtils;
import dto.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author ACER
 */
public class OrderDAO {

    public static boolean insertOrder(String customerID, String customerName, String phone, 
            String address, String postalCode, HashMap<String, Integer> cart, float totalMoney, String voucherID) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String salesID ="", orderID = "";
                cn.setAutoCommit(false); //turn off auto-commit
                //get random salesID
                String sql = "SELECT TOP 1 UserID FROM USERS WHERE RoleID=1 ORDER BY NEWID()";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    salesID = rs.getString("UserID");
                }

                //insert new order into Orders
                Timestamp t = new Timestamp(System.currentTimeMillis());
                sql = "insert ORDERS(CustomerName,Phone,Address,PostalCode,Status,OrderDate,CustomerID,SalesID) values(?,?,?,?,?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, customerName);
                pst.setString(2, phone);
                pst.setString(3, address);
                pst.setString(4, postalCode);
                pst.setInt(5, 1);
                pst.setString(6, String.valueOf(t));
                pst.setString(7, customerID);
                pst.setString(8, salesID);
                pst.executeUpdate();

                //get newly created OrderID
                sql = "select top 1 OrderID from ORDERS order by OrderID DESC";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderID = rs.getString("OrderID");
                }

                //add order with the above orderid into OrderDetail
                Set<String> pids = cart.keySet();
                for (String pid : pids) {
                    sql = "insert ORDERDETAILS(Quantity,TotalMoney,OrderID,ProductID,VoucherID) values(?,?,?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, cart.get(pid));
                    pst.setFloat(2, totalMoney);
                    pst.setString(3, orderID);
                    pst.setString(4, pid);
                    if (voucherID == null) {
                        pst.setNull(5, Types.NULL);
                    } else {
                        pst.setString(5, voucherID);
                    }
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
                return true;
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
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
    
//    public static ArrayList<Order> getMyOrdersByStatus(String userID, int status) {
//        Connection cn = null;
//        ArrayList<Order> list = new ArrayList<>();
//        Order order = null;
//        try {
//            cn = DBUtils.makeConnection();
//            if (cn != null) {
//                String sql = "select OrderID,OrdDate,shipdate,Orders.status, Orders.AccID \n"
//                        + "from Orders join Accounts on Orders.AccID = Accounts.accID\n"
//                        + "where Accounts.email = ?";
//                PreparedStatement pst = cn.prepareStatement(sql);
//                pst.setString(1, email);
//                ResultSet rs = pst.executeQuery();
//                if (rs != null) {
//                    while (rs.next()) {
//                        int orderID = rs.getInt("OrderID");
//                        String orderDate;
//                        Date OrdDate = rs.getDate("OrdDate");
//                        if (rs.wasNull()) {
//                            orderDate = "N/A";
//                        } else {
//                            orderDate = OrdDate.toString();
//                        }
//                        String shipDate;
//                        Date shipdate = rs.getDate("shipdate");
//                        if (rs.wasNull()) {
//                            shipDate = "N/A";
//                        } else {
//                            shipDate = shipdate.toString();
//                        }
//                        int status = rs.getInt("status");
//                        int accID = rs.getInt("AccID");
//                        order = new Order(orderID, orderDate, shipDate, status, accID);
//                        list.add(order);
//                    }
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (cn != null) {
//                try {
//                    cn.close();
//                } catch (Exception e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//        return list;
//    }
}
