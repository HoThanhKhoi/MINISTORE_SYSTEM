<%-- 
    Document   : testSchedule
    Created on : Jun 27, 2023, 1:26:13 PM
    Author     : Admin
--%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="containerr">
            <ul class="progressbar">
                <li class="actived">Scheduling</li>
                <li>Finish details</li>
                <li>Confirmation</li>
            </ul>
        </div>

        <div class="serviceSelectBox">
            <h5 style="font-weight: bold;">1. Select your desired services!</h5>
            <p>(Please note that you can only registered for a maximum of <span style="color: green; font-weight: bold;">two</span> services)</p>
            <div class="select-btn">
                <span class="btn-text">Select Services</span>
                <span class="arrow-dwn">
                    <i class="fa-solid fa-chevron-down"></i>
                </span>
            </div>

            <ul class="list-items">
                <div style="display: grid; grid-template-columns: 1fr 1fr 1fr;">
                    <li class="item">
                        <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                        </span>
                        <span class="item-text">Vaccination</span>
                    </li>
                    <li class="item">
                        <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                        </span>
                        <span class="item-text">Diagnose Examination</span>
                    </li>
                    <li class="item">
                        <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                        </span>
                        <span class="item-text">Veterinary Surgery</span>
                    </li>
                    <li class="item">
                        <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                        </span>
                        <span class="item-text">Hair Trimming</span>
                    </li>
                    <li class="item">
                        <span class="checkbox">
                            <i class="fa-solid fa-check check-icon"></i>
                        </span>
                        <span class="item-text">Nutrient Consultation</span>
                    </li>
                </div>
            </ul>
        </div>


        <div style="width: 1020px; margin: 50px auto 10px;">
            <h5 style="font-weight: bold;">2. Choose the most suitable time that accommodates your schedule.</h5>
        </div>

        <div class="scheduleForm">            
            <form action="MainController?action=finishSchedule" method="post" class="scheduleAppoint">
                <input id="services" type="hidden" name="services" value=""/>                
                <div class="calendar">        
                    <%
                        //get current calendar
                        Calendar current = Calendar.getInstance();
                        int currentDay = current.get(Calendar.DAY_OF_MONTH);
                        int currentMonth = current.get(Calendar.MONTH);
                        int currentYear = current.get(Calendar.YEAR);

                        if (request.getAttribute("day") != null) {
                            currentDay = Integer.parseInt(request.getParameter("day"));
                            currentMonth = Integer.parseInt(request.getParameter("month"));
                            currentYear = Integer.parseInt(request.getParameter("year"));

                        }
                        // set the displayed calendar
                        Calendar calendar = Calendar.getInstance();
                        calendar.set(currentYear, currentMonth, 1);

                        // get the number of days
                        int numDays = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
                        // get the start day (1 - 7)
                        int startDay = calendar.get(Calendar.DAY_OF_WEEK);

                        // get the previous month calendar
                        int previousMonth = (currentMonth == 0) ? 11 : currentMonth - 1;
                        int prevYear = (previousMonth == 11) ? currentYear - 1 : currentYear;
                        Calendar prevCalendar = Calendar.getInstance();
                        prevCalendar.set(prevYear, previousMonth, 1);

                        // get the following month calendar
                        int followingMonth = (currentMonth == 11) ? 0 : currentMonth + 1;
                        int followingYear = (followingMonth == 0) ? currentYear + 1 : currentYear;
                        Calendar followingCalendar = Calendar.getInstance();
                        followingCalendar.set(followingYear, followingMonth, 1);

                        String[] months = {"January", "February", "March", "April", "May",
                            "June", "July", "August", "September", "October", "November", "December"};
                        String[] weekDays = {"", "Sunday", "Monday", "TuesDay", "Wednesday", "Thursday", "Friday", "Saturday"};
                        int displayedStartDay = 0;
                    %>
                    <div class="displayed-month">
                        <p><%=months[currentMonth]%> <%=currentYear%></p>
                    </div>
                    <input type="hidden" name="date" value="<%=currentDay%>"/>
                    <input type="hidden" name="month" value="<%=currentMonth%>"/>
                    <input type="hidden" name="year" value="<%=currentYear%>"/>
                    <table>
                        <tr>
                            <th>Sun</th>
                            <th>Mon</th>
                            <th>Tue</th>
                            <th>Wed</th>
                            <th>Thu</th>
                            <th>Fri</th>
                            <th>Sat</th>
                        </tr>
                        <tr>
                            <%
                                for (int i = 1; i < startDay; i++) {
                                    int prevDay = prevCalendar.getActualMaximum(Calendar.DAY_OF_MONTH) - (startDay - i - 1);
                            %>
                            <td class="previous-month"><a href="MainController?action=switchCalendar&day=<%=prevDay%>&month=<%=previousMonth%>&year=<%=prevYear%>"><%= prevDay%></a></td>
                                <% } %>

                            <% for (int day = 1; day <= numDays; day++) {
                                    if (startDay == 1) { %>
                        </tr>
                        <tr>
                            <% } %>
                            <% if (calendar.get(Calendar.DAY_OF_MONTH) == currentDay) {%>
                            <td class="selected"><%= calendar.get(Calendar.DAY_OF_MONTH)%></td>
                            <% displayedStartDay = calendar.get(Calendar.DAY_OF_WEEK);
                            } else {%>
                            <td class="dates"><a href="MainController?action=switchCalendar&day=<%=calendar.get(Calendar.DAY_OF_MONTH)%>&month=<%=currentMonth%>&year=<%=currentYear%>"><%= calendar.get(Calendar.DAY_OF_MONTH)%></a></td>
                                <% } %>

                            <%-- Move to the next day --%>
                            <%
                                calendar.add(Calendar.DAY_OF_MONTH, 1);
                                startDay = calendar.get(Calendar.DAY_OF_WEEK);
                            %>
                            <% } %>

                            <%-- Insert empty cells for the remaining days of the last week --%>
                            <% while (startDay > 1 && startDay <= 7) {
                                    int nextDay = followingCalendar.get(Calendar.DAY_OF_MONTH);%>
                            <td class="following-month"><a href="MainController?action=switchCalendar&day=<%=nextDay%>&month=<%=followingMonth%>&year=<%=followingYear%>"><%=nextDay%></a></td>
                                <% followingCalendar.add(Calendar.DAY_OF_MONTH, 1);
                                    startDay = followingCalendar.get(Calendar.DAY_OF_WEEK);
                                %>
                                <% }%>
                        </tr>
                    </table>
                </div>

                <div class="vertical-divider"></div>

                <div>
                    <p><%=weekDays[displayedStartDay]%>, <%=months[currentMonth]%> <%=currentDay%></p>
                    <div class="slot">
                        <div id="slot1" class="time-slot">8:00 - 9:30</div>
                        <div id="slot2" class="time-slot">9:45 - 11:15</div>
                        <div id="slot3" class="time-slot">12:30 - 14:00</div>
                        <div id="slot4" class="time-slot">14:15 - 15:45</div>
                        <div id="slot5" class="time-slot">16:00 - 17:30</div>
                        <div id="slot6" class="time-slot">17:45 - 19:15</div>
                        <input type="hidden" name="slot" value="0" id="chosen-slot"/>
                    </div>
                </div>
                <input type="submit" value="Next" id="nextBtn" class="cannot-next"/>
            </form>
        </div>
    </body>
</html>
