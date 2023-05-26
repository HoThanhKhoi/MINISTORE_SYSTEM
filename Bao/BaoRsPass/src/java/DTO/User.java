/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Admin
 */
public class User {
    int userID;
    String userName;
    String password;
    String phone;
    String address;
    String email;
    int roleID;
    int worksheetID;

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public int getWorksheetID() {
        return worksheetID;
    }

    public void setWorksheetID(int worksheetID) {
        this.worksheetID = worksheetID;
    }

    public User(int userID, String userName, String password, String phone, String address, String email, int roleID, int worksheetID) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.roleID = roleID;
        this.worksheetID = worksheetID;
    }
            
}
