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
public class Worksheet {
    private String worksheetID;
    private String worksheetName;
    private float coeffiecent;

    public Worksheet(String worksheetID, String worksheetName, float coeffiecent) {
        this.worksheetID = worksheetID;
        this.worksheetName = worksheetName;
        this.coeffiecent = coeffiecent;
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

    public float getCoeffiecent() {
        return coeffiecent;
    }

    public void setCoeffiecent(float coeffiecent) {
        this.coeffiecent = coeffiecent;
    }
    
    
}
