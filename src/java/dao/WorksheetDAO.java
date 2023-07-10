/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import utils.DBUtils;
import dto.Worksheet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class WorksheetDAO {

    public static ArrayList<Worksheet> getAllWorksheets() throws Exception {
        ArrayList<Worksheet> list = new ArrayList<>();
        Connection cn = DBUtils.makeConnection();
        Worksheet worksheet;
        if (cn != null) {
            String sql = "Select WorksheetID,WorksheetName from WORKSHEETS";
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            while (rs.next() && rs != null) {
                String worksheetID = rs.getString("WorksheetID");
                String worksheetName = rs.getString("WorksheetName");
                worksheet = new Worksheet(worksheetID,worksheetName);
                list.add(worksheet);
            }

        }

        return list;
    }
}
