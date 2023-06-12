/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author ACER
 */
public class Voucher implements Serializable {
    private String voucherID;
    private String voucherCode;
    private float discount;
    private Timestamp expiredDate;

    public Voucher() {
    }

    public Voucher(String voucherID, String voucherCode, float discount, Timestamp expiredDate) {
        this.voucherID = voucherID;
        this.voucherCode = voucherCode;
        this.discount = discount;
        this.expiredDate = expiredDate;
    }

    public String getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(String voucherID) {
        this.voucherID = voucherID;
    }

    public String getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(String voucherCode) {
        this.voucherCode = voucherCode;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public Timestamp getExpiredDate() {
        return expiredDate;
    }

    public void setExpiredDate(Timestamp expiredDate) {
        this.expiredDate = expiredDate;
    }
    
}
