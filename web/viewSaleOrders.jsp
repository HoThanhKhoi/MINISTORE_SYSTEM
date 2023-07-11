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
                    <div class="dashboard mt">
                        <div class="row group-form">
                            <div class="col">
                                <form class="search text-center d-flex align-items-center" action="MainController" metohd="post">
                                    <input name="keyword" type="text" placeholder="Search..." value="${param.keyword == null ? '' : param.keyword}">
                                    <button id="search-button" type="submit" name="action" value="getSearchedProduct" class="btn">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </form>
                            </div>

                        </div>   

                        <div class="mt-2 myOrder-menu d-flex">
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
                        <c:choose>
                            <c:when test="${requestScope.orderList.isEmpty()}">
                                <h3>No result</h3>
                            </c:when>
                            <c:otherwise>
                                <table class="table text-center">
                                    <thead>
                                        <tr>
                                            <th scope="col">OrderID</th>
                                            <th scope="col">CustomerID</th>
                                            <th scope="col">Customer Name</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Order Date</th>
                                            <th scope="col">Total Money</th>
                                            <th scope="col">SalesID</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Details</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${requestScope.orderList}">
                                        <form action="MainController" action="post">
                                            <tr>
                                                <td>${order.orderID}</td>
                                                <td>${order.customerID}</td>
                                                <td>${order.customerName}</td>
                                                <td>${order.phone}</td>
                                                <td>${order.orderDate}</td>
                                                <td>${order.totalMoney}</td>
                                                <td>${order.salesID}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${order.status eq 1}">Processing</c:when>
                                                        <c:when test="${order.status eq 2}">Delivering</c:when>
                                                        <c:when test="${order.status eq 3}">Completed</c:when>
                                                        <c:when test="${order.status eq 4}">Canceled</c:when>
                                                    </c:choose>
                                                </td>   
                                            <input type="hidden" name="orderID" value="${order.orderID}"/>
                                            <td>
                                                <button type="submit" name="action" value="saleViewOrderDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                            </td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            



        <script type="text/javascript">
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