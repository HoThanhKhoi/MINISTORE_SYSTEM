
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
        <!-- HEADER -->
        <header>
            <c:import url="header_managerDashboard.jsp" />
        </header>


        <%
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

            ArrayList<Schedule> scheduleList = ScheduleDAO.getWeeklySchedules(Date.valueOf(startday), Date.valueOf(startday.plusDays(6)));
        %>

        <div class="container-fluid">

            <!-- menu -->
            <div class="menu-btn">
                <input type="checkbox" id="nav-toggle">
            </div>
            <div class=" side-bar">
                <div class="menu">
                    <div class="item">
                        <a class="sub-btn">
                            <i class="fa-solid fa-user mx-3"></i>
                            User
                            <i class="fa-solid fa-angle-right dropdown"></i>
                        </a>
                        <div class="sub-menu">
                            <a href="MainController?action=viewCustomers" class="sub-item ">Customers</a>
                            <a href="MainController?action=viewSales" class="sub-item">Sales</a>
                            <a href="MainController?action=viewGuards" class="sub-item">Guards</a>
                        </div>
                    </div>

                    <div class="item">
                        <a href="MainController?action=viewAllCategories" class="sub-btn">
                            <span><i class="fa-solid fa-bars-staggered mx-3"></i></span>
                            <span>Category</span>
                        </a>
                    </div>

                    <div class="item">
                        <a  href="MainController?action=viewAllProducts" class="sub-btn">
                            <span><i class="fa-solid fa-box mx-3"></i></span>
                            <span>Product</span>
                        </a>
                    </div>

                    <div class="item">
                        <a href="MainController?action=viewVouchers" class="sub-btn">
                            <span><i class="fa-solid fa-tag mx-3"></i></span>
                            <span>Voucher</span>
                        </a>
                    </div>

                    <div class="item">
                        <a class="sub-btn active">
                            <span><i class="fa-solid fa-clipboard-user mx-3"></i></span>
                            <span>Schedule</span>
                        </a>
                    </div>

                    <div class="item">
                        <a class="sub-btn" href="MainController?action=viewAllOrders">
                            <span><i class="fa-solid fa-cart-shopping mx-3"></i></span>
                            <span>Order</span>
                        </a>
                    </div>
                </div>
            </div>


            <!-- table -->
            <div class="dashboard dashboard-schedule">
                <form action="SwitchCalendarServlet" method="post">
                    <div class="select-container mt-4" style="width: 260px">
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

                    <input type="hidden" name="goto" value="employeeSchedule">
                    <input type="hidden" name="weekYear" value="<%= weekYear%>">
                </form> 


                <c:if test="<%=scheduleList.isEmpty()%>">
                    <form action="AddScheduleServlet" method="get">
                    </c:if>


                    <!--SALES-->
                    <table class="mt-4 mb-5 table table-order text-center border">
                        <caption>Sale employees</caption>
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
                                    <c:if test="<%=scheduleList != null%>">
                                        <%
                                            for (Schedule schedule : scheduleList) {

                                                if (schedule.getScheduleDate().toLocalDate().equals(dates.get(i)) && schedule.getWorksheetID().equals("WS-0001")) {%>
                                        <%= UserDAO.getUser(schedule.getUserID()).getName() + "<br>"%>
                                        <button type="button" style="width:20px;height: 20px" data-bs-toggle="modal" data-bs-target="#<%=schedule.getScheduleID()%>"><i  style="width:20px;height: 20px" class="update fa-solid fa-pen-to-square mx-2 "></i></button></br></br>


                                        <!--/*------------------POP UP SCREEN------------------*/-->
                                        <div class="modal" id="<%=schedule.getScheduleID()%>">
                                            <div class="modal-dialog">
                                                <div class="modal-content modal-update">
                                                    <div class="text-center my-3 fw-bold title">Update</div>
                                                    <form action="UpdateScheduleServlet" method="get">
                                                        <select class="form-select my-3" aria-label="Default select example" name="eid">
                                                            <option selected value="<%=schedule.getUserID()%>"><%= UserDAO.getUser(schedule.getUserID()).getName()%></option>
                                                            <c:forEach var="employee" items="${UserDAO.getUsersByRole(1)}" varStatus="status">
                                                                <c:if test="${employee.status == 1}">                                                    
                                                                    <option id="${employee.userID}"  value="${employee.userID}">${employee.name}</option>                                                    
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>

                                                        <input type="text" name="ueid" value="<%=schedule.getUserID()%> " hidden/>
                                                        <input class="my-3" type="text" name="wid" value="WS-0001" readonly=""/>
                                                        <input type="text" name="sdate" value="<%=dates.get(i)%>" hidden/>

                                                        <div>                                                   
                                                            <button class="button mt-5" type="submit">Update</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <%                        }

                                            }
                                        %>
                                    </c:if>
                                    <c:if test="<%=scheduleList.isEmpty()%>">
                                        <button type="button" data-bs-toggle="modal" data-bs-target="#myModals1<%= i%>"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                        <!--/*------------------POP UP SCREEN------------------*/-->
                                        <div class="modal" id="myModals1<%= i%>">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <c:forEach var="employee" items="${UserDAO.getUsersByRole(1)}" varStatus="status">
                                                        <c:if test="${employee.status == 1}">
                                                            <div class="modal-line">
                                                                <label for="${employee.userID}">   
                                                                    <input type="checkbox" id="${employee.userID}"  value="${employee.userID}|WS-0001|<%=dates.get(i)%>" name="eID"/>
                                                                    <span>${employee.name}</span>
                                                                    <input type="text" value="<%= dates.get(i)%>" hidden/>
                                                                </label>
                                                            </div>
                                                        </c:if>

                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
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
                                    <c:if test="<%=scheduleList != null%>">
                                        <%
                                            for (Schedule schedule : scheduleList) {

                                                if (schedule.getScheduleDate().toLocalDate().equals(dates.get(i)) && schedule.getWorksheetID().equals("WS-0002")) {%>
                                        <%= UserDAO.getUser(schedule.getUserID()).getName() + "</br>"%>
                                        <button type="button" style="width:20px;height: 20px" data-bs-toggle="modal" data-bs-target="#<%=schedule.getScheduleID()%>"><i  style="width:20px;height: 20px" class="update fa-solid fa-pen-to-square mx-2 "></i></button></br></br>

                                        <!--/*------------------POP UP SCREEN------------------*/-->
                                        <div class="modal" id="<%=schedule.getScheduleID()%>">
                                            <div class="modal-dialog">
                                                <div class="modal-content modal-update">
                                                    <div class="text-center my-3 fw-bold title">Update</div>
                                                    <form action="UpdateScheduleServlet" method="get">
                                                        <select class="form-select" aria-label="Default select example" name="eid">
                                                            <option selected value="<%=schedule.getUserID()%>"><%= UserDAO.getUser(schedule.getUserID()).getName()%></option>
                                                            <c:forEach var="employee" items="${UserDAO.getUsersByRole(1)}" varStatus="status">
                                                                <c:if test="${employee.status == 1}">                                                    
                                                                    <option id="${employee.userID}"  value="${employee.userID}">${employee.name}</option>                                                    
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <input type="text" name="ueid" value="<%=schedule.getUserID()%>" hidden/>
                                                        <input class="my-3" type="text" name="wid" value="WS-0002" readonly=""/>
                                                        <input type="text" name="sdate" value="<%=dates.get(i)%>" hidden/>
                                                        <div>                                                   
                                                            <button class="button mt-5" type="submit">Update</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <%                        }

                                            }
                                        %>
                                    </c:if>
                                    <c:if test="<%=scheduleList.isEmpty()%>">
                                        <button type="button" data-bs-toggle="modal" data-bs-target="#myModals2<%= i%>"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                        <!--/*------------------POP UP SCREEN------------------*/-->
                                        <div class="modal" id="myModals2<%= i%>">
                                            <div class="modal-dialog">
                                                <div class="modal-content ">
                                                    <c:forEach var="employee" items="${UserDAO.getUsersByRole(1)}" varStatus="status">
                                                        <c:if test="${employee.status == 1}">
                                                            <div class="modal-line">
                                                                <label for="${employee.userID}">   
                                                                    <input type="checkbox" id="${employee.userID}"  value="${employee.userID}|WS-0002|<%=dates.get(i)%>" name="eID"/>
                                                                    <span>${employee.name}</span>
                                                                </label>
                                                            </div>
                                                        </c:if>

                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </td>
                                <%
                                    }
                                %>
                            </tr>

                            <tr>
                                <th>Shift 3</th>
                                    <%
                                        for (int i = 0; i < 7; i++) {
                                    %>
                                <td>
                                    <c:if test="<%=scheduleList != null%>">
                                        <%
                                            for (Schedule schedule : scheduleList) {

                                                if (schedule.getScheduleDate().toLocalDate().equals(dates.get(i)) && schedule.getWorksheetID().equals("WS-0003")) {%>
                                        <%= UserDAO.getUser(schedule.getUserID()).getName() + "</br>"%>
                                        <button type="button" style="width:20px;height: 20px" data-bs-toggle="modal" data-bs-target="#<%=schedule.getScheduleID()%>"><i  style="width:20px;height: 20px" class="update fa-solid fa-pen-to-square mx-2 "></i></button></br></br>
                                        <!--/*------------------POP UP SCREEN------------------*/-->
                                        <div class="modal" id="<%=schedule.getScheduleID()%>">
                                            <div class="modal-dialog">
                                                <div class="modal-content modal-update">
                                                    <div class="text-center my-3 fw-bold title">Update</div>
                                                    <form action="UpdateScheduleServlet" method="get">
                                                        <select class="form-select" aria-label="Default select example" name="eid">
                                                            <option selected value="<%=schedule.getUserID()%>"><%= UserDAO.getUser(schedule.getUserID()).getName()%></option>
                                                            <c:forEach var="employee" items="${UserDAO.getUsersByRole(1)}" varStatus="status">
                                                                <c:if test="${employee.status == 1}">                                                    
                                                                    <option id="${employee.userID}"  value="${employee.userID}">${employee.name}</option>                                                    
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <input type="text" name="ueid" value="<%=schedule.getUserID()%>" hidden/>
                                                        <input class="my-3" type="text" name="wid" value="WS-0003" readonly=""/>
                                                        <input type="text" name="sdate" value="<%=dates.get(i)%>" hidden=""/>
                                                        <div>                                                   
                                                            <button class="button mt-5" type="submit">Update</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <%                        }

                                            }
                                        %>
                                    </c:if>
                                    <c:if test="<%=scheduleList.isEmpty()%>">
                                        <button type="button" data-bs-toggle="modal" data-bs-target="#myModals3<%= i%>"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                        <!--/*------------------POP UP SCREEN------------------*/-->
                                        <div class="modal" id="myModals3<%= i%>">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <c:forEach var="employee" items="${UserDAO.getUsersByRole(1)}" varStatus="status">
                                                        <c:if test="${employee.status == 1}">
                                                            <div class="modal-line">
                                                                <label for="${employee.userID}">   
                                                                    <input type="checkbox" id="${employee.userID}"  value="${employee.userID}|WS-0003|<%=dates.get(i)%>" name="eID"/>
                                                                    <span>${employee.name}</span>
                                                                </label>
                                                            </div>
                                                        </c:if>

                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </td>
                                <%
                                    }
                                %>
                            </tr>
                        </tbody>
                    </table>


                    <!--GUARD-->   
                    <table class="my-5 table table-order text-center border">
                        <caption>Guard employees</caption>
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
                                    <c:if test="<%=scheduleList != null%>">
                                        <%
                                            for (Schedule schedule : scheduleList) {

                                                if (schedule.getScheduleDate().toLocalDate().equals(dates.get(i)) && schedule.getWorksheetID().equals("WS-0004")) {%>
                                        <%= UserDAO.getUser(schedule.getUserID()).getName() + "<br>"%>
                                        <button type="button" style="width:20px;height: 20px" data-bs-toggle="modal" data-bs-target="#<%=schedule.getScheduleID()%>"><i  style="width:20px;height: 20px" class="update fa-solid fa-pen-to-square mx-2 "></i></button></br></br>

                                        <!--/*------------------POP UP SCREEN------------------*/-->
                                        <div class="modal" id="<%=schedule.getScheduleID()%>">
                                            <div class="modal-dialog">
                                                <div class="modal-content modal-update">
                                                    <div class="text-center my-3 fw-bold title">Update</div>
                                                    <form action="UpdateScheduleServlet" method="get">
                                                        <select class="form-select" aria-label="Default select example" name="eid">
                                                            <option selected value="<%=schedule.getUserID()%>"><%= UserDAO.getUser(schedule.getUserID()).getName()%></option>
                                                            <c:forEach var="employee" items="${UserDAO.getUsersByRole(2)}" varStatus="status">
                                                                <c:if test="${employee.status == 1}">                                                    
                                                                    <option id="${employee.userID}"  value="${employee.userID}">${employee.name}</option>                                                    
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <input type="text" name="ueid" value="<%=schedule.getUserID()%>" hidden/>
                                                        <input class="my-3" type="text" name="wid" value="WS-0004" readonly=""/>
                                                        <input type="text" name="sdate" value="<%=dates.get(i)%>" hidden/>
                                                        <div>                                                   
                                                            <button class="button mt-5" type="submit">Update</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <%                        }

                                            }
                                        %>
                                    </c:if>
                                    <c:if test="<%=scheduleList.isEmpty()%>">
                                        <button type="button" data-bs-toggle="modal" data-bs-target="#myModals4<%= i%>"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                        <!--/*------------------POP UP SCREEN------------------*/-->
                                        <div class="modal" id="myModals4<%= i%>">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <c:forEach var="employee" items="${UserDAO.getUsersByRole(2)}" varStatus="status">
                                                        <c:if test="${employee.status == 1}">
                                                            <div class="modal-line">
                                                                <label for="${employee.userID}">   
                                                                    <input type="checkbox" id="${employee.userID}"  value="${employee.userID}|WS-0004|<%=dates.get(i)%>" name="eID"/>
                                                                    <span>${employee.name}</span>
                                                                    <input type="text" value="<%= dates.get(i)%>" hidden/>
                                                                </label>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
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
                                    <c:if test="<%=scheduleList != null%>">
                                        <%
                                            for (Schedule schedule : scheduleList) {

                                                if (schedule.getScheduleDate().toLocalDate().equals(dates.get(i)) && schedule.getWorksheetID().equals("WS-0005")) {%>
                                        <%= UserDAO.getUser(schedule.getUserID()).getName()
                                                + "<br>"%>
                                        <button type="button" style="width:20px;height: 20px" data-bs-toggle="modal" data-bs-target="#<%=schedule.getScheduleID()%>"><i  style="width:20px;height: 20px" class="update fa-solid fa-pen-to-square mx-2 "></i></button></br></br>

                                        <!--/*------------------POP UP SCREEN------------------*/-->
                                        <div class="modal" id="<%=schedule.getScheduleID()%>">
                                            <div class="modal-dialog">
                                                <div class="modal-content modal-update">
                                                    <div class="text-center my-3 fw-bold title">Update</div>
                                                    <form action="UpdateScheduleServlet" method="get">
                                                        <select class="form-select" aria-label="Default select example" name="eid">
                                                            <option selected value="<%=schedule.getUserID()%>"><%= UserDAO.getUser(schedule.getUserID()).getName()%></option>
                                                            <c:forEach var="employee" items="${UserDAO.getUsersByRole(2)}" varStatus="status">
                                                                <c:if test="${employee.status == 1}">                                                    
                                                                    <option id="${employee.userID}"  value="${employee.userID}">${employee.name}</option>                                                    
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                        <input type="text" name="ueid" value="<%=schedule.getUserID()%>" hidden/>
                                                        <input class="my-3" type="text" name="wid" value="WS-0005" readonly=""/>
                                                        <input type="text" name="sdate" value="<%=dates.get(i)%>" hidden/>
                                                        <div>                                                   
                                                            <button class="button mt-5" type="submit">Update</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <%                        }

                                            }
                                        %>
                                    </c:if>
                                    <c:if test="<%=scheduleList.isEmpty()%>">
                                        <button type="button" data-bs-toggle="modal" data-bs-target="#myModals5<%= i%>"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>

                                        <!--/*------------------POP UP SCREEN------------------*/-->
                                        <div class="modal" id="myModals5<%= i%>">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <c:forEach var="employee" items="${UserDAO.getUsersByRole(2)}" varStatus="status">
                                                        <c:if test="${employee.status == 1}">
                                                            <div class="modal-line">
                                                                <label for="${employee.userID}">   
                                                                    <input type="checkbox" id="${employee.userID}"  value="${employee.userID}|WS-0005|<%=dates.get(i)%>" name="eID"/>
                                                                    <span>${employee.name}</span>
                                                                    <input type="text" value="<%= dates.get(i)%>" hidden/>
                                                                </label>                                                    
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </td>
                                <%
                                    }
                                %>
                            </tr>
                        </tbody>
                    </table>

                    <c:if test="<%=scheduleList.isEmpty()%>">
                        <div class="d-flex justify-content-center mb-5">
                            <button class="button" type="submit">Save</button>
                        </div>
                    </c:if>
                    <c:if test="<%=scheduleList.isEmpty()%>">
                    </form>
                </c:if>
            </div>
        </div>




        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, "viewEmployeeSchedule.jsp");
            }

            $(document).ready(function () {
                //jquery for toggle sub menus
                $('.sub-btn').click(function () {
                    $(this).next('.sub-menu').slideToggle();
                    $(this).find('.dropdown').toggleClass('rotate');
                });

                //jquery for expand and collapse the sidebar
                $('.menu-btn').click(function () {
                    $('.side-bar').addClass('active');
                    $('.menu-btn').css("visibility", "hidden");
                });

                $('.close-btn').click(function () {
                    $('.side-bar').removeClass('active');
                    $('.menu-btn').css("visibility", "visible");
                });
            });
        </script>

    </body>
</html>
