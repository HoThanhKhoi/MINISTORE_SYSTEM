/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import utils.DBUtils;
import dto.Voucher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author ACER
 */
public class VoucherDAO {

    public static ArrayList<Voucher> getVouchers() throws Exception {
        ArrayList<Voucher> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select VoucherID,VoucherCode,VoucherDiscount,VoucherExpiredDate,LimitPrice from VOUCHERS";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        String voucherID = table.getString("VoucherID");
                        String voucherCode = table.getString("VoucherCode");
                        float discount = table.getFloat("VoucherDiscount");
                        Timestamp expiredDate = table.getTimestamp("VoucherExpiredDate");
                        float limitPrice = table.getFloat("LimitPrice");
                        Timestamp now = new Timestamp(System.currentTimeMillis());
                        if (now.before(expiredDate)) {
                            Voucher voucher = new Voucher(voucherID, voucherCode, discount, expiredDate, limitPrice);
                            list.add(voucher);
                        }

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

    public static ArrayList<Voucher> getAllVouchers() throws Exception {
        ArrayList<Voucher> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select VoucherID,VoucherCode,VoucherDiscount,VoucherExpiredDate,LimitPrice from VOUCHERS";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        String voucherID = table.getString("VoucherID");
                        String voucherCode = table.getString("VoucherCode");
                        float discount = table.getFloat("VoucherDiscount");
                        Timestamp expiredDate = table.getTimestamp("VoucherExpiredDate");
                        float limitPrice = table.getFloat("LimitPrice");
                        Voucher voucher = new Voucher(voucherID, voucherCode, discount, expiredDate, limitPrice);
                        list.add(voucher);
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

    public static ArrayList<Voucher> getExpiredVouchers() throws Exception {
        ArrayList<Voucher> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select VoucherID,VoucherCode,VoucherDiscount,VoucherExpiredDate,LimitPrice from VOUCHERS";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        String voucherID = table.getString("VoucherID");
                        String voucherCode = table.getString("VoucherCode");
                        float discount = table.getFloat("VoucherDiscount");
                        Timestamp expiredDate = table.getTimestamp("VoucherExpiredDate");
                        float limitPrice = table.getFloat("LimitPrice");
                        Timestamp now = new Timestamp(System.currentTimeMillis());
                        if (now.after(expiredDate)) {
                            Voucher voucher = new Voucher(voucherID, voucherCode, discount, expiredDate, limitPrice);
                            list.add(voucher);
                        }
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

    public static Voucher getVoucher(String vid) {
        Connection cn = null;
        Voucher voucher = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select VoucherID,VoucherCode,VoucherDiscount,VoucherExpiredDate,LimitPrice from VOUCHERS where VoucherID=?";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, vid);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String voucherID = rs.getString("VoucherID");
                    String voucherCode = rs.getString("VoucherCode");
                    float discount = rs.getFloat("VoucherDiscount");
                    Timestamp expiredDate = rs.getTimestamp("VoucherExpiredDate");
                    float limitPrice = rs.getFloat("LimitPrice");
                    voucher = new Voucher(voucherID, voucherCode, discount, expiredDate, limitPrice);
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
        return voucher;
    }

    public static int updateVoucher(String voucherID, String voucherCode, float discount, Timestamp expiredDate, float limitPrice) {
        Connection cn = null;
        int result = 0;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update VOUCHERS set VoucherCode=?,VoucherDiscount=?,VoucherExpiredDate=?,LimitPrice=? where VoucherID=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, voucherCode);
                pst.setFloat(2, discount);
                pst.setTimestamp(3, expiredDate);
                pst.setFloat(4, limitPrice);
                pst.setString(5, voucherID);
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

    public static int addVoucher(String voucherCode, float discount, Timestamp expiredDate, float limitPrice) {
        Connection cn = null;
        int result = 0;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert VOUCHERS(VoucherCode,VoucherDiscount,VoucherExpiredDate,LimitPrice) values(?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, voucherCode);
                pst.setFloat(2, discount);
                pst.setTimestamp(3, expiredDate);
                pst.setFloat(4, limitPrice);
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

    public static ArrayList<Voucher> getSearchedVouchers(String keyword) throws Exception {
        ArrayList<Voucher> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select VoucherID,VoucherCode,VoucherDiscount,VoucherExpiredDate,LimitPrice "
                        + "from VOUCHERS where VoucherCode like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        String voucherID = table.getString("VoucherID");
                        String voucherCode = table.getString("VoucherCode");
                        float discount = table.getFloat("VoucherDiscount");
                        Timestamp expiredDate = table.getTimestamp("VoucherExpiredDate");
                        float limitPrice = table.getFloat("LimitPrice");
                        Voucher voucher = new Voucher(voucherID, voucherCode, discount, expiredDate, limitPrice);
                        list.add(voucher);
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
    
    public static ArrayList<Voucher> getPaginatedVouchers(int pageNumber, int voucherPerPage,ArrayList<Voucher> voucherList) throws Exception{
        ArrayList<Voucher> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        int start = (pageNumber - 1) * voucherPerPage;
        int end = start + voucherPerPage - 1;
        if (end > voucherList.size() || end == voucherList.size()) {
            end = voucherList.size() - 1;
        }
        for (int i = start; i <= end; i++) {
            list.add(voucherList.get(i));
        }
        return list;
    }
}
