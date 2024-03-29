/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import utils.DBUtils;
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
                String sql = "SELECT TOP 1 EmployeeID\n"
                        + "FROM SCHEDULES inner join USERS on SCHEDULES.EmployeeID = USERS.UserID \n"
                        + "where RoleID = 1 and Status = 1 and CONVERT(date, GETDATE()) = SCHEDULES.ScheduleDate\n"
                        + "and  WorksheetID = \n"
                        + "CASE \n"
                        + "	WHEN 18 <= DATEPART(hour, CONVERT(time, GETDATE())) and DATEPART(hour, CONVERT(time, GETDATE())) <= 24 THEN 'WS-0003'\n"
                        + "	WHEN 12 <= DATEPART(hour, CONVERT(time, GETDATE())) and DATEPART(hour, CONVERT(time, GETDATE())) < 18  THEN 'WS-0002'\n"
                        + "	WHEN 6 <= DATEPART(hour, CONVERT(time, GETDATE())) and DATEPART(hour, CONVERT(time, GETDATE())) < 12  THEN 'WS-0001' \n"
                        + "	 ELSE ''\n"
                        + "        END\n"
                        + "ORDER BY NEWID()";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    salesID = rs.getString("EmployeeID");
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

    public static ArrayList<Order> getSaleOrdersByStatus(String userID, int status) {
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select OrderID,CustomerName,Phone,Address,PostalCode,"
                        + "TotalMoney,Status,OrderDate,ShipDate,CustomerID,SalesID,VoucherID\n"
                        + "from ORDERS where SalesID=? and Status=? order by OrderID desc";
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
        Connection cn = null;
        boolean flag = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update ORDERS\n"
                        + "set status=?\n"
                        + "where OrderID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setString(2, orderID);
                flag = pst.executeUpdate() == 1;
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

    public static ArrayList<Order> getOrderBySaleId(String saleid) throws Exception {
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();
        Order order = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select OrderID,CustomerName,Phone,Address,PostalCode,TotalMoney,"
                        + "Status,OrderDate,ShipDate,CustomerID,SalesID,VoucherID\n"
                        + "from ORDERS where SalesID=?";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, saleid);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
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

    public static ArrayList<Order> getPaginatedOrders(int pageNumber, int ordersPerPage, ArrayList<Order> orderList) throws Exception {
        ArrayList<Order> pList = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        int start = (pageNumber - 1) * ordersPerPage;
        int end = start + ordersPerPage - 1;
        if (end > orderList.size() || end == orderList.size()) {
            end = orderList.size() - 1;
        }
        for (int i = start; i <= end; i++) {
            pList.add(orderList.get(i));
        }
        return pList;
    }

    public static ArrayList<Order> getOrders() throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select OrderID,CustomerID,CustomerName,Phone,OrderDate,TotalMoney,SalesID,status from ORDERS";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    String orderID = table.getString("OrderID");
                    String customerID = table.getString("CustomerID");
                    String customerName = table.getString("CustomerName");
                    String phone = table.getString("Phone");
                    Timestamp orderDate = table.getTimestamp("OrderDate");
                    float totalMoney = table.getFloat("TotalMoney");
                    String salesID = table.getString("SalesID");
                    int status = table.getInt("status");
                    Order order = new Order(orderID, customerID, customerName, phone, orderDate, totalMoney, salesID, status);
                    list.add(order);
                }
            }
            cn.close();
        }
        return list;
    }

    public static ArrayList<Order> getSearchedOrdersByID(String cusid) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select OrderID,CustomerID,CustomerName,Phone,OrderDate,TotalMoney,SalesID,Status\n"
                    + "from ORDERS where CustomerID like ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + cusid + "%");
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    String orderID = table.getString("OrderID");
                    String customerID = table.getString("CustomerID");
                    String customerName = table.getString("CustomerName");
                    String phone = table.getString("Phone");
                    Timestamp orderDate = table.getTimestamp("OrderDate");
                    float totalMoney = table.getFloat("TotalMoney");
                    String salesID = table.getString("SalesID");
                    int status = table.getInt("status");
                    Order order = new Order(orderID, customerID, customerName, phone, orderDate, totalMoney, salesID, status);
                    list.add(order);
                }
            }
            cn.close();
        }
        return list;
    }
    
    public static ArrayList<Order> saleGetSearchedOrdersByID(String cusid, String saleID) throws Exception {
        ArrayList<Order> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "select OrderID,CustomerID,CustomerName,Phone,OrderDate,TotalMoney,SalesID,Status\n"
                    + "from ORDERS where CustomerID LIKE ? AND SalesID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, "%" + cusid + "%");
            pst.setString(2, saleID);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    String orderID = table.getString("OrderID");
                    String customerID = table.getString("CustomerID");
                    String customerName = table.getString("CustomerName");
                    String phone = table.getString("Phone");
                    Timestamp orderDate = table.getTimestamp("OrderDate");
                    float totalMoney = table.getFloat("TotalMoney");
                    String salesID = table.getString("SalesID");
                    int status = table.getInt("status");
                    Order order = new Order(orderID, customerID, customerName, phone, orderDate, totalMoney, salesID, status);
                    list.add(order);
                }
            }
            cn.close();
        }
        return list;
    }
    
    public static int countSaleOrders(String id) throws Exception{
    int total = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "Select COUNT(*) from ORDERS where SalesID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, id);
            ResultSet table = pst.executeQuery();
            if (table.next()) {
                total = table.getInt(1);
            }
            cn.close();
        }
        return total;
    }

    public static int countOrdersByStatus(int status) throws Exception {
        int count = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select count(OrderID) as Total from ORDERS where Status=?";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setInt(1, status);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        count = rs.getInt("Total");
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
        return count;
    }

    public static int countOrders() throws Exception {
        int count = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select count(OrderID) as Total from ORDERS";
                PreparedStatement pst = cn.prepareStatement(s);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        count = table.getInt("Total");
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
        return count;
    }
    
    public static float calculateRevenue(int status) throws Exception {
        float sum = 0;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select SUM(case when Status=? then TotalMoney else 0 end) as Total from ORDERS";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setInt(1, status);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        sum = table.getFloat("Total");
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
        return sum;
    }
}
