/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.Schedule;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import utils.DBUtils;

/**
 *
 * @author ACER
 */
public class ScheduleDAO {

    public static ArrayList<Schedule> getAllSchedules() throws Exception {
        ArrayList<Schedule> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select ScheduleID,ScheduleDate,WorksheetID,EmployeeID from SCHEDULES";
                Statement st = cn.createStatement();
                ResultSet table = st.executeQuery(sql);
                if (table != null) {
                    while (table.next()) {
                        String scheduleID = table.getString("ScheduleID");
                        Date scheduleDate = table.getDate("ScheduleDate");
                        String worksheetID = table.getString("WorksheetID");
                        String employeeID = table.getString("EmployeeID");
                        Schedule schedule = new Schedule(scheduleID, scheduleDate, worksheetID, employeeID);
                        list.add(schedule);
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

    public static ArrayList<Schedule> getWeeklySchedules(Date startDate, Date endDate) throws Exception {
        ArrayList<Schedule> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select ScheduleID,ScheduleDate,WorksheetID,EmployeeID "
                        + "from SCHEDULES where ScheduleDate >= ? and ScheduleDate <= ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setDate(1, startDate);
                pst.setDate(2, endDate);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        String scheduleID = table.getString("ScheduleID");
                        Date scheduleDate = table.getDate("ScheduleDate");
                        String worksheetID = table.getString("WorksheetID");
                        String employeeID = table.getString("EmployeeID");
                        Schedule schedule = new Schedule(scheduleID, scheduleDate, worksheetID, employeeID);
                        list.add(schedule);
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

    public static ArrayList<Schedule> getMyWeeklySchedules(String userID, Date startDate, Date endDate) throws Exception {
        ArrayList<Schedule> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select ScheduleID,ScheduleDate,WorksheetID,EmployeeID from SCHEDULES \n"
                        + "join USERS on EmployeeID = UserID where UserID=? and ScheduleDate >= ? and ScheduleDate <= ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, userID);
                pst.setDate(2, startDate);
                pst.setDate(3, endDate);
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        String scheduleID = table.getString("ScheduleID");
                        Date scheduleDate = table.getDate("ScheduleDate");
                        String worksheetID = table.getString("WorksheetID");
                        String employeeID = table.getString("EmployeeID");
                        Schedule schedule = new Schedule(scheduleID, scheduleDate, worksheetID, employeeID);
                        list.add(schedule);
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
    
    public static int addSchedule(String date, String worksheetID, String employeeID) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "INSERT INTO SCHEDULES(ScheduleDate,WorksheetID,EmployeeID) VALUES(?,?,?)";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, date);
            pst.setString(2, worksheetID);
            pst.setString(3, employeeID);
            result = pst.executeUpdate();
        }
        return result;
    }

    public static int updateSchedule(String eID, String sDate, String wID,String neID) throws Exception {
        int result = 0;
        Connection cn = DBUtils.makeConnection();
        if (cn != null) {
            String sql = "UPDATE SCHEDULES SET EmployeeID = ? WHERE EmployeeID = ? AND ScheduleDate = ? AND WorksheetID = ?";
             PreparedStatement pst = cn.prepareStatement(sql);
             pst.setString(1,neID);
             pst.setString(2,eID);
             pst.setString(3,sDate);
             pst.setString(4,wID);
             result = pst.executeUpdate();
        }
        return result;
    }
}

