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
        <link rel="icon" type="image/x-icon" href="./image/favicon-32x32.png">

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
            <c:when test="${sessionScope.manager == null}">
                <c:set var="warning" value="You need to log in as Admin to access" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <!--HEADER-->
                <header>
                    <c:import url="header_managerDashboard.jsp" />
                </header>

                <div class="container-fluid">
                    <!-- menu -->
                    <div class="menu-btn">
                        <input type="checkbox" id="nav-toggle">
                    </div>

                    <div class="side-bar">
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
                                <a class="sub-btn" href="MainController?action=viewVouchers">
                                    <span><i class="fa-solid fa-tag mx-3"></i></span>
                                    <span>Voucher</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn" href="MainController?action=viewSchedule">
                                    <span><i class="fa-solid fa-clipboard-user mx-3"></i></span>
                                    <span>Schedule</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn active" href="MainController?action=viewAllOrders">
                                    <span><i class="fa-solid fa-cart-shopping mx-3"></i></span>
                                    <span>Order</span>
                                </a>
                            </div>

                        </div>
                    </div>



                    <!-- table -->
                    <div class="dashboard ">
                        <div class="mt-4 row group-form">
                            <div class="col">
                                <form class="search text-center d-flex align-items-center" action="MainController" metohd="post">
                                    <input name="txtsearch" type="text" placeholder="Search..." value="${param.txtsearch == null ? '' : param.txtsearch}">
                                    <button id="search-button" type="submit" name="action" value="searchByCustomerID" class="btn">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </form>

                            </div>

                        </div>   

                        <div class="mt-4 my-2 myOrder-menu viewOrder d-flex">

                        </div>
                        <c:choose>
                            <c:when test="${requestScope.orderList.isEmpty()}">
                                <h3>No result</h3>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-border text-center">
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
                                        <c:if test="${requestScope.oList == null}">
                                            <c:forEach var="order" items="${requestScope.orderList}" begin="0" end="5">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td>${order.orderID}</td>
                                                    <td>${order.customerID}</td>
                                                    <td>${order.customerName}</td>
                                                    <td>${order.phone}</td>
                                                    <td>${order.orderDate}</td>
                                                    <td>$${order.totalMoney}</td>
                                                    <td>${order.salesID}</td>
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
                                                    <button type="submit" name="action" value="viewOrderDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.oList != null}">
                                        <c:forEach var="order" items="${requestScope.oList}">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td>${order.orderID}</td>
                                                    <td>${order.customerID}</td>
                                                    <td>${order.customerName}</td>
                                                    <td>${order.phone}</td>
                                                    <td>${order.orderDate}</td>
                                                    <td>$${order.totalMoney}</td>
                                                    <td>${order.salesID}</td>
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
                                                    <button type="submit" name="action" value="viewOrderDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                                <nav aria-label="Page navigation example" style="margin: 10px 0;">
                                    <ul class="pagination justify-content-center">
                                        <c:if test="${requestScope.page == 1  || requestScope.page== null}">
                                            <li class="page-item">
                                                <a class="page-link" style="padding: 5px 10px !important;color: #1B9C85" href="MainController?action=showOrdersPage&page=1" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${requestScope.page > 1}">
                                            <li class="page-item">
                                                <a class="page-link" style="padding: 5px 10px !important;color: #1B9C85" href="MainController?action=showOrdersPage&page=${requestScope.page-1}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                        </c:if>

                                        <c:set var="orderList" value="${requestScope.orderList}"/>
                                        <c:set var="totalOrder" value="${orderList.size()}"/>
                                        <c:set var="numOfSearchPages" value="${Math.ceil(totalOrder / 6)}"/>
                                        <fmt:formatNumber value="${numOfSearchPages}" pattern="0" var="intLastPage" />

                                        <c:forEach var="i" begin="1" end="${numOfSearchPages}">
                                            <li class="page-item "><a class="page-link " style="padding:5px 10px !important;color: #1B9C85" 
                                                                      href="MainController?action=showOrdersPage&page=${i}">${i}</a></li>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${intLastPage > 1}">
                                                    <c:if test="${requestScope.page <  numOfSearchPages || requestScope.page == null}">
                                                    <li class="page-item">
                                                        <a class="page-link" style="padding:5px 10px !important;color: #1B9C85" href="MainController?action=showOrdersPage&page=${requestScope.page + 1}" aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </c:if>                          
                                                <c:if test="${requestScope.page >=  numOfSearchPages}">
                                                    <li class="page-item">
                                                        <a class="page-link" style="padding:5px 10px !important;color: #1B9C85" href="MainController?action=showOrdersPage&page=${intLastPage}" aria-label="Next">
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
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>
            </c:otherwise>
        </c:choose>



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