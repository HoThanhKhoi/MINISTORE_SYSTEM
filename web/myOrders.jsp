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

                        <c:if test="${requestScope.noti != null}">
                            <h1>${requestScope.noti}</h1>
                        </c:if>


                        <!-- menu -->
                        <div class="myOrder-menu">
                            <div class="title mt-5 mb-2">
                                <h4 class="mb-3 text-center">My Order</h4>
                            </div>

                            <ul id="myDiv">
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
                        <div class="dashboard myOrder-dashboard">
                            <table class="table table-order mt-2 text-center">
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
                                    <c:forEach var="order" items="${requestScope.ordersList}">
                                        <tr>
                                            <td scope="row" class="fw-bold">${order.orderID}</td>
                                            <td>${order.customerName}</td>
                                            <td>${order.phone}</td>
                                            <td>${order.address}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${order.status eq 2}">
                                                        Delivering
                                                    </c:when>
                                                    <c:when test="${order.status eq 3}">
                                                        Completed
                                                    </c:when>
                                                    <c:when test="${order.status eq 4}">
                                                        Canceled
                                                    </c:when>
                                                    <c:otherwise>
                                                        Processing
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>$${order.totalMoney}</td>
                                            <td><a href="MainController?action=viewOrderInformation&orderID=${order.orderID}" >Order Details</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                            <div class="container mt-5 dashboard-footer">
                                <div class="col-lg-12 d-flex justify-content-center">
                                    <a href="homePage.jsp" class="button align-items-center">Explore more products
                                        <i class="fa-solid fa-angles-right "></i>   
                                    </a>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <footer><c:import url="footer.jsp"/></footer>
                </c:otherwise>
            </c:choose>

        <!--        <script>
                    var btnContainer = document.getElementById("myDiv");
        
                    var btns = btnContainer.getElementsByClassName("btn");
        
                    for (var i = 0; i < btns.length; i++) {
                        btns[i].addEventListener("click", function () {
                            var current = document.getElementsByClassName("active");
                            current[0].className = current[0].className.replace(" active", "");
                            this.className += " active";
                        });
                    }
                </script>-->
    </body>
</html>