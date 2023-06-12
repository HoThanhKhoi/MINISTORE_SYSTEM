/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author ACER
 */
public class OrderDAO {

    public static boolean insertOrder(String customerID, String phone, String address, HashMap<Integer, Integer> cart, float totalMoney, String voucherID) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int salesID = 0, orderid = 0;
                cn.setAutoCommit(false); //turn off auto-commit
                //get random salesID
                String sql = "SELECT TOP 1 UserID FROM USERS WHERE RoleID=1 ORDER BY NEWID()";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    salesID = rs.getInt("UserID");
                }

                //insert new order into Orders
                Timestamp t = new Timestamp(System.currentTimeMillis());
                sql = "insert ORDERS(Phone,Address,Status,OrderDate,CustomerID,SalesID) values(?,?,?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, phone);
                pst.setString(2, address);
                pst.setInt(3, 1);
                pst.setString(4, String.valueOf(t));
                pst.setString(5, customerID);
                pst.setInt(6, salesID);
                pst.executeUpdate();

                //get newly created OrderID
                sql = "select top 1 OrderID from ORDERS order by OrderID DESC";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderid = rs.getInt("OrderID");
                }

                //add order with the above orderid into OrderDetail
                Set<Integer> pids = cart.keySet();
                for (int pid : pids) {
                    sql = "insert ORDERDETAILS(Quantity,TotalMoney,OrderID,ProductID,VoucherID) values(?,?,?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, cart.get(pid));
                    pst.setFloat(2, totalMoney);
                    pst.setInt(3, orderid);
                    pst.setInt(4, pid);
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
}
