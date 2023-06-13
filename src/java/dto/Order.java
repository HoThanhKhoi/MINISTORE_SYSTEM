/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Timestamp;

/**
 *
 * @author ACER
 */
public class Order {
    private String orderID;
    private String phone;
    private String address;
    private int status;
    private Timestamp orderDate;
    private Timestamp shipDate;
    private String customerID;
    private String salesID;

    public Order() {
    }

    public Order(String orderID, String phone, String address, int status, Timestamp orderDate, Timestamp shipDate, String customerID, String salesID) {
        this.orderID = orderID;
        this.phone = phone;
        this.address = address;
        this.status = status;
        this.orderDate = orderDate;
        this.shipDate = shipDate;
        this.customerID = customerID;
        this.salesID = salesID;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
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
    
}