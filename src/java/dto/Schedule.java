/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author ACER
 */
public class Schedule implements Serializable {
    private String scheduleID;
    private Date scheduleDate;
    private String worksheetID;
    private String userID;

    public Schedule() {
    }

    public Schedule(String scheduleID, Date scheduleDate, String worksheetID, String userID) {
        this.scheduleID = scheduleID;
        this.scheduleDate = scheduleDate;
        this.worksheetID = worksheetID;
        this.userID = userID;
    }

    public String getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(String scheduleID) {
        this.scheduleID = scheduleID;
    }

    public Date getScheduleDate() {
        return scheduleDate;
    }

    public void setScheduleDate(Date scheduleDate) {
        this.scheduleDate = scheduleDate;
    }

    public String getWorksheetID() {
        return worksheetID;
    }

    public void setWorksheetID(String worksheetID) {
        this.worksheetID = worksheetID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
    
}
