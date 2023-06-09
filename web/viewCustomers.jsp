
<%@page import="dao.UserDAO"%>
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
                            <a class="col" data-bs-toggle="collapse" href="#collapseExample" role="button"
                               aria-expanded="false" aria-controls="collapseExample">User
                                <i class="fa-solid fa-caret-down mx-2 "></i>
                            </a>

                            <!-- class="collapse"-->

                        <li class="row active" id="collapseExample">
                            <i class="col-2 mx-3"></i>
                            <a href="" class="col-2">Customer</a>
                        </li>

                        <li class="row" id="collapseExample">
                            <i class="col-2 mx-3"></i>
                            <a href="" class="col-2">Sale</a>
                        </li>

                        <li class="row" id="collapseExample">
                            <i class="col-2 mx-3"></i>
                            <a href="" class="col-2">Guard</a>
                        </li>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-bars-staggered mx-3 col-2"></i>
                            <a href="" class="col-2 ms-1 d-none d-sm-inline">Category</a>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-box mx-3 col-2"></i>
                            <a href="" class="col-2">Product</a>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-tag mx-3 col-2"></i>
                            <a href="" class="col-2">Voucher</a>
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


                    <table class="table mt-5 text-center">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Email</th>
                                <th scope="col">Phone</th>
                                <th scope="col">Address</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${requestScope.clist == null}">
                                <c:forEach var="customer" items="${UserDAO.getUsersByRole(3)}" begin="0" end="6">
                                <form action="MainController" action="post">
                                    <tr>
                                        <td scope="row">${customer.userID}</td>
                                        <td>${customer.name}</td>
                                        <td>${customer.email}</td>
                                        <td>${customer.phone}</td>
                                        <td>${customer.address}</td>
                                        <c:choose>
                                            <c:when test="${customer.status == 0}"><td>Inactive</td></c:when>
                                            <c:otherwise><td>Active</td></c:otherwise>
                                        </c:choose>
                                    <input type="hidden" name="userid" value="${customer.userID}"/>
                                    <td>
                                        <button type="submit" name="action" value="viewCustomerDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                    </td>
                                    </tr>
                                </form>
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.clist !=null}">
                            <c:forEach var="customer" items="${requestScope.clist}">
                                <form action="MainController" action="post">
                                    <tr>
                                        <td scope="row">${customer.userID}</td>
                                        <td>${customer.name}</td>
                                        <td>${customer.email}</td>
                                        <td>${customer.phone}</td>
                                        <td>${customer.address}</td>
                                        <c:choose>
                                            <c:when test="${customer.status == 0}"><td>Inactive</td></c:when>
                                            <c:otherwise><td>Active</td></c:otherwise>
                                        </c:choose>
                                    <input type="hidden" name="userid" value="${customer.userID}"/>
                                    <td>
                                        <button type="submit" name="action" value="viewCustomerDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                    </td>
                                    </tr>
                                </form>
                            </c:forEach>
                        </c:if>

                        </tbody>
                    </table>
                </div>
            </div>


            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showUserPage&page=${requestScope.page-1}"><</a>
                    </li>
                    <% int totalProduct = UserDAO.getUsersByRole(3).size();
                        int element = 7;
                        float numOfPages = (float) totalProduct / element;
                    %>
                    <%for (int i = 1; i <= (int) Math.ceil(numOfPages); i++) {%>
                    <li class="page-item "><a class="page-link " style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showUserPage&page=<%=i%>&roleid=3"><%=i%></a></li>
                        <% }%>
                    <li class="page-item">
                        <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showUserPage&page=${requestScope.page+1}">></a>
                    </li>
                </ul>
            </nav>
        </div>

        <footer><c:import url="footer.jsp"/></footer>

    </body>
</html>
