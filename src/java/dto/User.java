/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Admin
 */
public class User {

    private String userID;
    private String name;
    private String phone;
    private String address;
    private String email;
    private String password;
    private int status;
    private int role;
    private String worksheetID;

    public User(String userID, String name, String phone, String address, String email, String password, int status, int role, String worksheetID) {
        this.userID = userID;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.password = password;
        this.status = status;
        this.role = role;
        this.worksheetID = worksheetID;
    }

   public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getWorksheetID() {
        return worksheetID;
    }

    public void setWorksheetID(String worksheetID) {
        this.worksheetID = worksheetID;
    }

}