/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;

/**
 *
 * @author ACER
 */
public class OrderDetail implements Serializable {
    private String orderDetailID;
    private String productName;
    private String imgPath;
    private int quantity;
    private float money;
    private String orderID;
    private String productID;

    public OrderDetail() {
    }

    public OrderDetail(String orderDetailID, String productName, String imgPath, int quantity, float money, String orderID, String productID) {
        this.orderDetailID = orderDetailID;
        this.productName = productName;
        this.imgPath = imgPath;
        this.quantity = quantity;
        this.money = money;
        this.orderID = orderID;
        this.productID = productID;
    }

    public String getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(String orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
        this.money = money;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
}
