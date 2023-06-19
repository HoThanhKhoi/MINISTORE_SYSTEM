/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Utils.DBUtils;
import dto.Order;
import dto.OrderDetail;
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
                String salesID = "", orderID = "";
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
                sql = "insert ORDERS(CustomerName,Phone,Address,PostalCode,TotalMoney,Status,"
                        + "OrderDate,CustomerID,SalesID,VoucherID) values(?,?,?,?,?,?,?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, customerName);
                pst.setString(2, phone);
                pst.setString(3, address);
                pst.setString(4, postalCode);
                pst.setFloat(5, totalMoney);
                pst.setInt(6, 1);
                pst.setString(7, String.valueOf(t));
                pst.setString(8, customerID);
                pst.setString(9, salesID);
                if (voucherID == null) {
                    pst.setNull(10, Types.NULL);
                } else {
                    pst.setString(10, voucherID);
                }
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
                    sql = "insert ORDERDETAILS(Quantity,TotalMoney,OrderID,ProductID) values(?,?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, cart.get(pid));
                    pst.setFloat(2, ProductDAO.getProductInfo(pid).getPrice() * cart.get(pid));
                    pst.setString(3, orderID);
                    pst.setString(4, pid);
                    
                    pst.executeUpdate();
                    
                    int newStockQuantity = ProductDAO.getProductInfo(pid).getStockQuantity() - cart.get(pid);
                    sql = "update PRODUCTS set StockQuantity=? where ProductID=?";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, newStockQuantity);
                    pst.setString(2, pid);
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

    public static ArrayList<Order> getMyOrders(String userID) {
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,CustomerName,Phone,Address,PostalCode,TotalMoney,"
                        + "Status,OrderDate,ShipDate,CustomerID,SalesID,VoucherID\n"
                        + "from ORDERS where CustomerID=? order by OrderID desc";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, userID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String orderID = rs.getString("OrderID");
                        String customerName = rs.getString("CustomerName");
                        String phone = rs.getString("Phone");
                        String address = rs.getString("Address");
                        String postalCode = rs.getString("PostalCode");
                        float totalMoney = rs.getFloat("TotalMoney");
                        int orderStatus = rs.getInt("Status");
                        Timestamp orderDate = rs.getTimestamp("OrderDate");
                        Timestamp shipdate = rs.getTimestamp("ShipDate");
//                        if (rs.wasNull()) {
//                            shipDate = "N/A";
//                        } else {
//                            shipDate = shipdate.toString();
//                        }
                        String customerID = rs.getString("CustomerID");
                        String salesID = rs.getString("SalesID");
                        String voucherID = rs.getString("VoucherID");
                        Order order = new Order(orderID, customerName, phone, address, postalCode, totalMoney,
                                orderStatus, orderDate, shipdate, customerID, salesID, voucherID);
                        list.add(order);
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

    public static ArrayList<Order> getMyOrdersByStatus(String userID, int status) {
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,CustomerName,Phone,Address,PostalCode,"
                        + "TotalMoney,Status,OrderDate,ShipDate,CustomerID,SalesID,VoucherID\n"
                        + "from ORDERS where CustomerID=? and Status=? order by OrderID desc";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, userID);
                pst.setInt(2, status);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String orderID = rs.getString("OrderID");
                        String customerName = rs.getString("CustomerName");
                        String phone = rs.getString("Phone");
                        String address = rs.getString("Address");
                        String postalCode = rs.getString("PostalCode");
                        float totalMoney = rs.getFloat("TotalMoney");
                        int orderStatus = rs.getInt("Status");
                        Timestamp orderDate = rs.getTimestamp("OrderDate");
                        Timestamp shipdate = rs.getTimestamp("ShipDate");
//                        if (rs.wasNull()) {
//                            shipDate = "N/A";
//                        } else {
//                            shipDate = shipdate.toString();
//                        }
                        String customerID = rs.getString("CustomerID");
                        String salesID = rs.getString("SalesID");
                        String voucherID = rs.getString("VoucherID");
                        Order order = new Order(orderID, customerName, phone, address, postalCode,
                                totalMoney, status, orderDate, shipdate, customerID, salesID, voucherID);
                        list.add(order);
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

    public static Order getOrderById(String id) throws Exception {
        Connection cn = null;
        Order order = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select OrderID,CustomerName,Phone,Address,PostalCode,TotalMoney,"
                        + "Status,OrderDate,ShipDate,CustomerID,SalesID,VoucherID\n"
                        + "from ORDERS where OrderID=?";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String userID = rs.getString("OrderID");
                    String userName = rs.getString("CustomerName");
                    String userPhone = rs.getString("Phone");
                    String userAddress = rs.getString("Address");
                    String userPostalCode = rs.getString("PostalCode");
                    float totalMoney = rs.getFloat("TotalMoney");
                    int status = rs.getInt("Status");
                    Timestamp orderDate = rs.getTimestamp("OrderDate");
                    Timestamp shipDate = rs.getTimestamp("ShipDate");
                    String customerID = rs.getString("CustomerID");
                    String salesID = rs.getString("SalesID");
                    String voucherID = rs.getString("VoucherID");
                    order = new Order(userID, userName, userPhone, userAddress, userPostalCode,
                            totalMoney, status, orderDate, shipDate, customerID, salesID, voucherID);
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
        return order;
    }

    public static ArrayList<OrderDetail> getOrderDetail(String orderID) {
        Connection cn = null;
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderDetailsID,ProductName,ImgPath,Quantity,TotalMoney,OrderID,ORDERDETAILS.ProductID\n"
                        + "from ORDERDETAILS,PRODUCTS where OrderID=? and ORDERDETAILS.ProductID = PRODUCTS.ProductID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, orderID);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        String orderDetailID = rs.getString("OrderDetailsID");
                        String productName = rs.getString("ProductName");
                        String imgPath = rs.getString("ImgPath");
                        int quantity = rs.getInt("quantity");
                        float money = rs.getFloat("TotalMoney");
                        String productID = rs.getString("ProductID");
                        OrderDetail orderDetail = new OrderDetail(orderDetailID, productName, imgPath, quantity, money, orderID, productID);
                        list.add(orderDetail);
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
    
    public static boolean changeOrderStatus(String orderID, int status) throws Exception {
        Connection cn = DBUtils.makeConnection();
        boolean flag = false;
        if (cn != null) {
            String sql = "update ORDERS\n"
                    + "set status=?\n"
                    + "where OrderID=?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setString(2, orderID);
            flag = pst.executeUpdate() == 1;
            cn.close();
        }
        return flag;
    }
}
