<%@page import="dao.OrderDAO"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <!--HEADER-->
        <header>
            <c:import url="header_saleDashboard.jsp" />
        </header>
        <div class="container-fluid">

            <!-- table -->
            <div class="dashboard mt-2" style='margin-left: 0px!important'>
                <div class="mt-4 row group-form">
                    <div class="col">
                        <form class="search text-center d-flex align-items-center" action="MainController" metohd="post">
                            <input name="txtsearch" type="text" placeholder="Search (by customer's ID)" value="${param.txtsearch == null ? '' : param.txtsearch}">
                            <input type="hidden" name="saleid" value="${sessionScope.sale.userID}"/>
                            <button id="search-button" type="submit" name="action" value="saleSearchByCustomerID" class="btn">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>

                <div class=" mt-4 my-2 d-flex">
                    <div class="total-order">Total orders: ${totalSaleOrders}</div>
                </div>                

                </div>
                <div class="myOrder-menu">
                    <ul id="myDiv" class="order">
                        <c:choose>
                            <c:when test="${param.status == 1}">
                                <li class="btn">
                                    <a href="MainController?action=manageSaleOrders">All</a>
                                </li>

                                <li class="btn active">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=1">Processing</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=2">Delivering</a>
                                </li>
                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=3">Completed</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=4">Canceled</a>
                                </li>
                            </c:when>
                            <c:when test="${param.status == 2}">
                                <li class="btn">
                                    <a href="MainController?action=manageSaleOrders">All</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=1">Processing</a>
                                </li>

                                <li class="btn active">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=2">Delivering</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=3">Completed</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=4">Canceled</a>
                                </li>
                            </c:when>
                            <c:when test="${param.status == 3}">
                                <li class="btn">
                                    <a href="MainController?action=manageSaleOrders">All</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=1">Processing</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=2">Delivering</a>
                                </li>

                                <li class="btn active">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=3">Completed</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=4">Canceled</a>
                                </li>
                            </c:when>
                            <c:when test="${param.status == 4}">
                                <li class="btn">
                                    <a href="MainController?action=manageSaleOrders">All</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=1">Processing</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=2">Delivering</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=3">Completed</a>
                                </li>

                                <li class="btn active">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=4">Canceled</a>
                                </li>
                            </c:when> 
                            <c:otherwise>
                                <li class="btn active">
                                    <a href="MainController?action=manageSaleOrders">All</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=1">Processing</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=2">Delivering</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=3">Completed</a>
                                </li>

                                <li class="btn">
                                    <a href="MainController?action=viewSaleOrdersByStatus&status=4">Canceled</a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                    </ul>
                </div>

                <div class=" mt-4 my-2 d-flex">
                    <div class="total-order">Total Orders: ${totalSaleOrders}</div>
                </div>

                <c:choose>
                    <c:when test="${requestScope.orderList.isEmpty()}">
                        <h3>No result</h3>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-border text-center">
                            <thead>
                                <tr>
                                    <th scope="col">Order ID</th>
                                    <th scope="col">Customer ID</th>
                                    <th scope="col">Customer Name</th>
                                    <th scope="col">Phone</th>
                                    <th scope="col">Order Date</th>
                                    <th scope="col">Total Money</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Details</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${requestScope.orderList != null}">
                                        <c:forEach var="order" items="${requestScope.orderList}">
                                        <form action="MainController" action="post">
                                            <tr>
                                                <td>${order.orderID}</td>
                                                <td>${order.customerID}</td>
                                                <td>${order.customerName}</td>
                                                <td>${order.phone}</td>
                                                <td>${order.orderDate}</td>
                                                <td>$${order.totalMoney}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${order.status eq 1}"><span class="status_btn status_processing">Processing</span></c:when>
                                                        <c:when test="${order.status eq 2}"><span  class="status_btn status_delivering">Delivering</span></c:when>
                                                        <c:when test="${order.status eq 3}"><span  class="status_btn status_completed">Completed</span></c:when>
                                                        <c:when test="${order.status eq 4}"><span class="status_btn status_cancel">Canceled</span></c:when>
                                                    </c:choose>
                                                </td>   
                                            <input type="hidden" name="orderID" value="${order.orderID}"/>
                                            <td>
                                                <button type="submit" name="action" value="saleViewOrderDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                            </td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <c:if test="${requestScope.noti != null}">
                                        <div class="alert alert-danger alert-dismissible fade show notification" role="alert" style="padding: 15px 45px;text-align: center;width:430px;opacity: 100%;margin: 20px auto 0;">
                                            <strong class="error">${requestScope.noti}</strong>
                                        </div>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                        <c:if test="${requestScope.orderList != null}">
                            <nav aria-label="Page navigation example" style="margin: 10px 0;">
                                <ul class="pagination justify-content-center">
                                    <c:if test="${requestScope.page == 1  || requestScope.page== null}">
                                        <li class="page-item">
                                            <a class="page-link" style="padding: 5px 10px !important;color: #1B9C85" href="MainController?action=showSaleOrdersPage&page=1&status=${status}" aria-label="Previous&status=${status}" ">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${requestScope.page > 1}">
                                        <li class="page-item">
                                            <a class="page-link" style="padding: 5px 10px !important;color: #1B9C85" href="MainController?action=showSaleOrdersPage&page=${requestScope.page-1}&status=${status}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <c:set var="orderList" value="${requestScope.orderList}"/>
                                    <c:set var="totalOrder" value="${orderList.size()}"/>
                                    <c:set var="status" value = "${requestScope.status}"/>
                                    <c:set var="numOfPages" value="${Math.ceil(totalOrder / 6)}"/>

                                    <fmt:formatNumber value="${numOfPages}" pattern="0" var="intLastPage" />

                                    <c:forEach var="i" begin="1" end="${numOfPages}">
                                        <li class="page-item "><a class="page-link " style="padding:5px 10px !important;color: #1B9C85" 
                                                                  href="MainController?action=showSaleOrdersPage&page=${i}&status=${status}">${i}</a></li>
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
                                                    <a class="page-link" style="padding:5px 10px !important;color: #1B9C85" href="MainController?action=showSaleOrdersPage&page=${intLastPage}&status=${status}" aria-label="Next">
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

                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>
</html>