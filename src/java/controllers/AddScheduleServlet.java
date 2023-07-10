/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AddScheduleServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String[] eIDs = request.getParameterValues("eID");

            ArrayList<String> wID = new ArrayList<>();
            ArrayList<String> eID = new ArrayList<>();
            ArrayList<String> sDate = new ArrayList<>();
            int result = 0;
//            for (String wid : wIDs) {
//                wID.add(wid);
//            }
//            for (String eid : eIDs) {
//                eID.add(eid);
//            }
//            for (String sdate : sDates) {
//                sdate += "/2023";
//                sDate.add(sdate);
//            }
            String[] parts = null;
            for (int i = 0; i < eIDs.length; i++) {
                parts = eIDs[i].split("\\|");
                for (int j = 0; j < parts.length; j += 3) {
                    eID.add(parts[j]);
                }
            }
            for (int i = 0; i < eIDs.length; i++) {
                parts = eIDs[i].split("\\|");
                for (int j = 1; j < parts.length; j += 3) {
                    wID.add(parts[j]);
                }
            }
            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("d/M/yyyy");

            for (int i = 0; i < eIDs.length; i++) {
                parts = eIDs[i].split("\\|");
                for (int j = 2; j < parts.length; j += 3) {
                    sDate.add(parts[j]);
                }
            }
            for (int i = 0; i < eID.size(); i++) {
                result = ScheduleDAO.addSchedule(sDate.get(i), wID.get(i), eID.get(i));
            }
            request.setAttribute("wID", wID);
            request.setAttribute("eID", eID);
            request.setAttribute("sDate", sDate);
            request.getRequestDispatcher("ViewScheduleServlet").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddScheduleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AddScheduleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
