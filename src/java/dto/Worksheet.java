/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class Worksheet implements Serializable {
    private String worksheetID;
    private String worksheetName;

    public Worksheet(String worksheetID, String worksheetName) {
        this.worksheetID = worksheetID;
        this.worksheetName = worksheetName;
    }

    public String getWorksheetID() {
        return worksheetID;
    }

    public void setWorksheetID(String worksheetID) {
        this.worksheetID = worksheetID;
    }

    public String getWorksheetName() {
        return worksheetName;
    }

    public void setWorksheetName(String worksheetName) {
        this.worksheetName = worksheetName;
    }
    
    
}
