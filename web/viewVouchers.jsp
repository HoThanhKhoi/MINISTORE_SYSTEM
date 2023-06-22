
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
            <c:import url="header_managerDashboard.jsp" />
        </header>

        <div class="container-fluid">
            <div class="row">

                <!-- menu -->
                <div class="col-2 menu">
                    <ul>
                        <li class="row">
                            <i class="fa-solid fa-user mx-3 col-2"></i>
                            <a href="" class="col-2">User</a>
                        </li>

                        <!-- class="collapse"-->

                        <li class="row ">
                            <i class="col-2 mx-3"></i>
                            <a href="viewCustomers.jsp" class="col-2">Customer</a>
                        </li>

                        <li class="row">
                            <i class="col-2 mx-3"></i>
                            <a href="" class="col-2">Sale</a>
                        </li>

                        <li class="row">
                            <i class="col-2 mx-3"></i>
                            <a href="" class="col-2">Guard</a>
                        </li>

                        <li class="row active">
                            <i class="fa-solid fa-bars-staggered mx-3 col-2"></i>
                            <a href="" class="col-2">Category</a>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-box mx-3 col-2"></i>
                            <a href="" class="col-2">Product</a>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-tag mx-3 col-2"></i>
                            <a href="MainController?action=viewVouchers" class="col-2">Voucher</a>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-clipboard-user mx-3 col-2"></i>
                            <a href="" class="col-2">Attendance</a>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-cart-shopping mx-3 col-2"></i>
                            <a href="" class="col-2">Order</a>
                        </li>

                    </ul>
                </div>


                <!-- table -->
                <div class="col dashboard">
                    <form class="search text-center d-flex align-items-center">
                        <input type="text" placeholder="Search...">
                        <button id="search-button" type="button" class="btn">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>

                    <a href="MainController?action=viewVouchers">All</a>
                    <a href="MainController?action=viewUnexpiredVouchers">Unexpired</a>
                    <a href="MainController?action=viewExpiredVouchers">Expired</a>

                    <c:choose>
                        <c:when test="${requestScope.error != null}">
                            <h1>${requestScope.error}</h1>
                        </c:when>
                        <c:otherwise>
                            <table class="table mt-5 text-center">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Voucher Code</th>
                                        <th scope="col">Discount</th>
                                        <th scope="col">Expired Date</th>
                                        <th scope="col">Limit Price</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <c:forEach var="voucher" items="${requestScope.vouchersList}">
                                    <form>
                                        <tr>
                                            <td>${voucher.voucherID}</td>
                                            <td>${voucher.voucherCode}</td>
                                            <td>$${voucher.discount}</td>
                                            <td>${voucher.expiredDate}</td>
                                            <td>$${voucher.limitPrice}</td>
                                            <td>
                                                <input type="hidden" name="voucherid" value="${voucher.voucherID}">
                                                <button type="submit" name="action" value="viewVoucherDetailsPage">
                                                    <i class="update fa-solid fa-pen-to-square mx-2"></i>
                                                </button>
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
        </div>
    </body>
</html>