<%-- 
    Document   : index
    Created on : Jul 4, 2023, 1:47:04 PM
    Author     : Admin
--%>
<%@page import="dto.User"%>
<%@page import="java.sql.Date"%>
<%@page import="dao.UserDAO"%>
<%@page import="dao.ScheduleDAO"%>
<%@page import="dto.Schedule"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.temporal.WeekFields"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/managerScreen.css" />

        <!-- Icon CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />


        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- font Inter -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
    </head>
    <body>

        <!--HEADER-->
        <header>
            <c:import url="header_saleDashboard.jsp" />
        </header>

        <%
            User sale = (User) session.getAttribute("sale");
            String userID = sale.getUserID();
            String[] weekDays = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};

            ArrayList<LocalDate> dates = new ArrayList<>();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/YYYY");
            Calendar calendar = Calendar.getInstance();
            int weekYear = calendar.get(Calendar.YEAR);
            int noOfWeek = calendar.get(Calendar.WEEK_OF_YEAR);

            LocalDate startday = LocalDate.parse(String.format("%04d-W%02d-1", weekYear, noOfWeek), DateTimeFormatter.ISO_WEEK_DATE);
            if (LocalDate.now().equals(startday.minusDays(1))) {
                noOfWeek -= 1;
                startday = startday.minusDays(7);
            }
            if (request.getAttribute("startday") != null) {
                startday = (LocalDate) request.getAttribute("startday");
            }
            if (request.getAttribute("noOfWeek") != null) {
                noOfWeek = (Integer) request.getAttribute("noOfWeek");
            }

            ArrayList<Schedule> scheduleList = ScheduleDAO.getMyWeeklySchedules(userID, Date.valueOf(startday), Date.valueOf(startday.plusDays(6)));
        %>

        <div class="container-fluid">

            <!-- HEADER PATH -->
            <nav class="navbar navbar-expand-lg header-path mt-5">
                <div class="container-fluid justify-content-start ">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="saleDashboard.jsp">Home</a>
                            </li>
                            <li class="breadcrumb-item item-active">
                                <a href="viewMySchedule.jsp">My Schedule</a>
                            </li>
                        </ol>
                    </nav>
                </div>
            </nav>

            <div class="dashboard schedule d-flex flex-column ">

                <form class="mt-5 mb-1" action="SwitchCalendarServlet" method="post">
                    <div class="select-container mt-2" data-bs-theme="dark" style="width: 260px">
                        <select class="select-box" name="noOfWeek" onchange="this.form.submit()">
                            <%
                                for (int i = 1; i <= 52; i++) {
                                    LocalDate monday = LocalDate.parse(String.format("%04d-W%02d-1", weekYear, i), DateTimeFormatter.ISO_WEEK_DATE);
                                    LocalDate sunday = monday.plusDays(6);
                                    if (i == noOfWeek) {
                            %>

                            <option style="background: #5cb85c; color: #fff;" selected="" value="<%= i%>">
                                <%= formatter.format(monday)%> - <%= formatter.format(sunday)%>
                            </option>
                            <%
                            } else {
                            %>
                            <option value="<%= i%>">
                                <%= formatter.format(monday)%> - <%= formatter.format(sunday)%>
                            </option>
                            <% }
                                }
                            %>
                        </select>
                        <div class="icon-container">
                            <i class="fa-solid fa-caret-down"></i>
                        </div>
                    </div>

                    <input type="hidden" name="goto" value="mySchedule">
                    <input type="hidden" name="weekYear" value="<%= weekYear%>">
                </form>

                <table class="mt-3 table table-order text-center border">
                    <thead>
                        <tr>
                            <th></th>
                                <% for (int i = 0; i < 7; i++) {%>   
                            <th><%= weekDays[i]%> <br> <%= startday.plusDays(i).getDayOfMonth() + "/" + startday.plusDays(i).getMonthValue()%></th>
                                <% dates.add(startday.plusDays(i));
                                    } %>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <th>Shift 1</th>
                                <%
                                    for (int i = 0; i < 7; i++) {
                                %>
                            <td>
                                <%
                                    for (Schedule schedule : scheduleList) {
                                        if (schedule.getScheduleDate().toLocalDate().equals(dates.get(i))
                                                && (schedule.getWorksheetID().equals("WS-0001") || schedule.getWorksheetID().equals("WS-0004"))) { %>
                                <div style="background-color: #68B984; width: 100%; height: 50px"></div>
                                <%      }
                                    }
                                %>
                            </td>
                            <%
                                }
                            %>
                        </tr>
                        <tr>
                            <th>Shift 2</th>
                                <%
                                    for (int i = 0; i < 7; i++) {
                                %>
                            <td>
                                <%
                                    for (Schedule schedule : scheduleList) {
                                        if (schedule.getScheduleDate().toLocalDate().equals(dates.get(i))
                                                && (schedule.getWorksheetID().equals("WS-0002") || schedule.getWorksheetID().equals("WS-0005"))) {%>
                                <div style="background-color: #68B984; width: 100%; height: 50px"></div>
                                <%                        }
                                    }
                                %>
                            </td>
                            <%
                                }
                            %>
                        </tr>

                        <% if (UserDAO.getUser(userID).getRole() == 1) {  %>
                        <tr>
                            <th>Shift 3</th>
                                <%
                                    for (int i = 0; i < 7; i++) {
                                %>
                            <td>
                                <%
                                    for (Schedule schedule : scheduleList) {
                                        if (schedule.getScheduleDate().toLocalDate().equals(dates.get(i)) && schedule.getWorksheetID().equals("WS-0003")) {%>
                                <div style="background-color: #68B984; width: 100%; height: 50px"></div>
                                <%                        }
                                    }
                                %>
                            </td>
                            <%
                                }
                            %>
                        </tr>
                        <%    }
                        %>
                    </tbody>
                </table>

            </div>
        </div>

    </body>
</html>
