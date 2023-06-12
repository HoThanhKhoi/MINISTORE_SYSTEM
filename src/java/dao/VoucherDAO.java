/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Utils.DBUtils;
import dto.User;
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
        if (cn != null) {
            String sql = "select VoucherID,VoucherCode,VoucherDiscount,VoucherExpiredDate from VOUCHERS";
            Statement st = cn.createStatement();
            ResultSet table = st.executeQuery(sql);
            if (table != null) {
                while (table.next()) {
                    String voucherID = table.getString("VoucherID");
                    String voucherCode = table.getString("VoucherCode");
                    float discount = table.getFloat("VoucherDiscount");
                    Timestamp expiredDate = table.getTimestamp("VoucherExpiredDate");
                    Voucher voucher = new Voucher(voucherID, voucherCode, discount, expiredDate);
                    list.add(voucher);
                }
            }
        }
        cn.close();
        return list;
    }

    public static Voucher getVoucher(String vid) {
        Connection cn = null;
        Voucher voucher = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "select VoucherID,VoucherCode,VoucherDiscount,VoucherExpiredDate from VOUCHERS where VoucherID=?";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, vid);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String voucherID = rs.getString("VoucherID");
                    String voucherCode = rs.getString("VoucherCode");
                    float discount = rs.getFloat("VoucherDiscount");
                    Timestamp expiredDate = rs.getTimestamp("VoucherExpiredDate");
                    voucher = new Voucher(voucherID, voucherCode, discount, expiredDate);
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
}
