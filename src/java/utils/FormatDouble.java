/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;
import java.text.DecimalFormat;

/**
 *
 * @author Admin
 */
public class FormatDouble {
    public static String formatNumber(double number) {
    DecimalFormat decimalFormat = new DecimalFormat("#,##0.00");
    return decimalFormat.format(number);
  }
}
