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
public class Order implements Serializable {
    private String orderID;
    private String customerName;
    private String phone;
    private String address;
    private String postalCode;
    private float totalMoney;
    private int status;
    private Timestamp orderDate;
    private Timestamp shipDate;
    private String customerID;
    private String salesID;
    private String voucherID;

    public Order() {
    }

    public Order(String orderID, String customerName, String phone, String address, String postalCode, float totalMoney, int status, Timestamp orderDate, Timestamp shipDate, String customerID, String salesID, String voucherID) {
        this.orderID = orderID;
        this.customerName = customerName;
        this.phone = phone;
        this.address = address;
        this.postalCode = postalCode;
        this.totalMoney = totalMoney;
        this.status = status;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.customerID = customerID;
        this.salesID = salesID;
        this.voucherID = voucherID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        this.totalMoney = totalMoney;
    }
    
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public Timestamp getShipDate() {
        return shipDate;
    }

    public void setShipDate(Timestamp shipDate) {
        this.shipDate = shipDate;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerID(String customerID) {
        this.customerID = customerID;
    }

    public String getSalesID() {
        return salesID;
    }

    public void setSalesID(String salesID) {
        this.salesID = salesID;
    }

    public String getVoucherID() {
        return voucherID;
    }

    public void setVoucherID(String voucherID) {
        this.voucherID = voucherID;
    }
    
}
