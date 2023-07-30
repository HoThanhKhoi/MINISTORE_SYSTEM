<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/x-icon" href="./image/favicon-32x32.png">
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
        <c:choose>
            <c:when test="${sessionScope.customer == null}">
                <jsp:forward page="login.jsp" />
            </c:when>
            <c:otherwise>

                <!--HEADER-->
                <header>
                    <c:import url="header.jsp" />
                </header>

                <div class="container">
                    <div class="row">


                        <!-- menu -->
                        <div class="myOrder-menu">
                            <div class="title mt-5">
                                <h4 class="mb-3 text-center">My Order</h4>
                            </div>

                            <ul id="myDiv" class="order">
                                <c:choose>
                                    <c:when test="${param.status == 1}">
                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrders">All</a>
                                        </li>

                                        <li class="btn active">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=1">Processing</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=2">Delivering</a>
                                        </li>
                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=3">Completed</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=4">Canceled</a>
                                        </li>
                                    </c:when>
                                    <c:when test="${param.status == 2}">
                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrders">All</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=1">Processing</a>
                                        </li>

                                        <li class="btn active">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=2">Delivering</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=3">Completed</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=4">Canceled</a>
                                        </li>
                                    </c:when>
                                    <c:when test="${param.status == 3}">
                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrders">All</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=1">Processing</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=2">Delivering</a>
                                        </li>

                                        <li class="btn active">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=3">Completed</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=4">Canceled</a>
                                        </li>
                                    </c:when>
                                    <c:when test="${param.status == 4}">
                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrders">All</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=1">Processing</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=2">Delivering</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=3">Completed</a>
                                        </li>

                                        <li class="btn active">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=4">Canceled</a>
                                        </li>
                                    </c:when> 
                                    <c:otherwise>
                                        <li class="btn active">
                                            <a href="MainController?action=viewMyOrders">All</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=1">Processing</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=2">Delivering</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=3">Completed</a>
                                        </li>

                                        <li class="btn">
                                            <a href="MainController?action=viewMyOrdersByStatus&status=4">Canceled</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                            </ul>
                        </div>



                        <!-- table -->
                        <div class="dashboard myOrder-dashboard ">
                            <c:choose>
                                <c:when test="${requestScope.ordersList != null}">
                                    <table class="table table-order  text-center table-hover">
                                        <thead>
                                            <tr>
                                                <th class="text-center" scope="col">ID</th>
                                                <th class="text-center" scope="col">Recipient</th>
                                                <th class="text-center" scope="col">Phone</th>
                                                <th class="text-center" scope="col">Address</th>
                                                <th class="text-center" scope="col">Status</th>
                                                <th class="text-center" scope="col">Total</th>
                                                <th class="text-center" scope="col">Details</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:if test="${requestScope.opList == null}">
                                                <c:forEach var="order" items="${requestScope.ordersList}" begin="0" end="7">
                                                    <tr>
                                                        <td scope="row" class="fw-bold">${order.orderID}</td>
                                                        <td>${order.customerName}</td>
                                                        <td>${order.phone}</td>
                                                        <td>${order.address}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${order.status eq 2}">
                                                                    <span  class="status_btn status_delivering">Delivering</span> 
                                                                </c:when>
                                                                <c:when test="${order.status eq 3}">
                                                                    <span  class="status_btn status_completed">Completed</span>
                                                                </c:when>
                                                                <c:when test="${order.status eq 4}">
                                                                    <span class="status_btn status_cancel">Canceled</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="status_btn status_processing">Processing</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>$${order.totalMoney}</td>
                                                        <td><a href="MainController?action=viewOrderInformation&orderID=${order.orderID}" >Order Details</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${requestScope.opList != null}">
                                                <c:forEach var="order" items="${requestScope.opList}">
                                                    <tr>
                                                        <td scope="row" class="fw-bold">${order.orderID}</td>
                                                        <td>${order.customerName}</td>
                                                        <td>${order.phone}</td>
                                                        <td>${order.address}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${order.status eq 2}">
                                                                    <span  class="status_btn status_delivering">Delivering</span> 
                                                                </c:when>
                                                                <c:when test="${order.status eq 3}">
                                                                    <span  class="status_btn status_completed">Completed</span>
                                                                </c:when>
                                                                <c:when test="${order.status eq 4}">
                                                                    <span class="status_btn status_cancel">Canceled</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="status_btn status_processing">Processing</span>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>$${order.totalMoney}</td>
                                                        <td><a href="MainController?action=viewOrderInformation&orderID=${order.orderID}" >Order Details</a></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>

                                        </tbody>

                                    </table>

                                </c:when>
                                <c:otherwise>
                                    <c:if test="${requestScope.noti != null}">
                                        <div class="alert alert-danger alert-dismissible fade show notification" role="alert" style="padding: 15px 45px;text-align: center;width:430px;opacity: 100%;margin: 20px auto 0;">
                                            <strong class="error">${requestScope.noti}</strong>
                                        </div>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${requestScope.ordersList != null}">
                                <nav aria-label="Page navigation example" style="margin: 10px 0;">
                                    <ul class="pagination justify-content-center">
                                        <c:if test="${requestScope.page == 1  || requestScope.page== null}">
                                            <li class="page-item">
                                                <a class="page-link" style="padding: 5px 10px !important;color: #1B9C85" href="MainController?action=showMyOrdersPage&page=1&status=${status}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${requestScope.page > 1}">
                                            <li class="page-item">
                                                <a class="page-link" style="padding: 5px 10px !important;color: #1B9C85" href="MainController?action=showMyOrdersPage&page=${requestScope.page-1}&status=${status}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:set var="orderList" value="${requestScope.ordersList}"/>
                                        <c:set var="totalOrder" value="${orderList.size()}"/>
                                        <c:set var="numOfPages" value="${Math.ceil(totalOrder / 8)}"/>
                                        <c:set var="status" value = "${requestScope.status}"/>
                                        <fmt:formatNumber value="${numOfPages}" pattern="0" var="intLastPage" />

                                        <c:forEach var="i" begin="1" end="${numOfPages}">
                                            <li class="page-item "><a class="page-link " style="padding:5px 10px !important;color: #1B9C85" 
                                                                      href="MainController?action=showMyOrdersPage&page=${i}&status=${status}">${i}</a></li>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${intLastPage > 1}">
                                                    <c:if test="${requestScope.page <  numOfSearchPages || requestScope.page == null}">
                                                    <li class="page-item">
                                                        <a class="page-link" style="padding:5px 10px !important;color: #1B9C85" href="MainController?action=showMyOrdersPage&page=${requestScope.page + 1}&status=${status}" aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </c:if>                          
                                                <c:if test="${requestScope.page >=  numOfPages}">
                                                    <li class="page-item">
                                                        <a class="page-link" style="padding:5px 10px !important;color: #1B9C85" href="MainController?action=showMyOrdersPage&page=${intLastPage}&status=${status}" aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </c:if> 
                                            </c:when>
                                            <c:when test="${intLastPage <= 1}">
                                                <c:if test="${requestScope.page == 1 || requestScope.page ==null}">
                                                    <li class="page-item">
                                                        <a class="page-link" style="padding:5px 10px !important;color: #1B9C85" href="#" aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </c:if>
                                            </c:when>
                                        </c:choose>                            
                                    </ul>
                                </nav>
                            </c:if>


                            <div class="container mt-3 dashboard-footer">
                                <div class="col-lg-12 d-flex justify-content-center">
                                    <a href="homePage.jsp" class="button align-items-center">Explore more products
                                        <i class="fa-solid fa-angles-right "></i>   
                                    </a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <footer><c:import url="footer_loginedCustomer.jsp"/></footer>
                </c:otherwise>
            </c:choose>
    </body>
</html>