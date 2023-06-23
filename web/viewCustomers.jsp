
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
        <c:choose>
            <c:when test="${sessionScope.manager == null}">
                <c:set var="warning" value="You need to log in as Admin to access" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <!-- HEADER -->
                <header>
                    <c:import url="header_managerDashboard.jsp" />
                </header>


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
                                    <a href="MainController?action=viewCustomers" class="sub-item active">Customers</a>
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
                                <a class="sub-btn">
                                    <span><i class="fa-solid fa-tag mx-3"></i></span>
                                    <span>Voucher</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn">
                                    <span><i class="fa-solid fa-clipboard-user mx-3"></i></span>
                                    <span>Attendance</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn">
                                    <span><i class="fa-solid fa-cart-shopping mx-3"></i></span>
                                    <span>Order</span>
                                </a>
                            </div>

                        </div>
                    </div>



                    <!-- table -->
                    <div class="dashboard mt-5">
                        <form class="search text-center d-flex align-items-center" action="MainController" method="get">
                            <input type="text" placeholder="Search here..." name="keyword">
                            <button id="search-button" type="submit" class="btn" name="action" value="searchUsers">
                                <i class="fas fa-search"></i>
                            </button>
                            <input type="hidden" name="roleid" value="3"/>
                        </form>


                        <table class="table mt-4 text-center">
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
                                <c:choose>
                                    <c:when test="${keyword == null}">
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
                                                        <c:when test="${customer.status == 0}"><td><span class="status_btn status_cancel">Inactive</span></td></c:when>
                                                        <c:otherwise><td><span class="status_btn status_completed">Active</span></td></c:otherwise>
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
                                                        <c:when test="${customer.status == 0}"><td><span class="status_btn status_cancel">Inactive</span></td></c:when>
                                                        <c:otherwise><td><span class="status_btn status_completed">Active</span></td></c:otherwise>
                                                    </c:choose>
                                                <input type="hidden" name="userid" value="${customer.userID}"/>
                                                <td>
                                                    <button type="submit" name="action" value="viewCustomerDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                </c:when>
                                <c:when test="${keyword !=null}">
                                    <c:if test="${requestScope.cslist == null}">
                                        <c:forEach var="customer" items="${requestScope.searchedCusList}" begin="0" end ="6">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td scope="row">${customer.userID}</td>
                                                    <td>${customer.name}</td>
                                                    <td>${customer.email}</td>
                                                    <td>${customer.phone}</td>
                                                    <td>${customer.address}</td>
                                                    <c:choose>
                                                        <c:when test="${customer.status == 0}"><td><span class="status_btn status_cancel">Inactive</span></td></c:when>
                                                        <c:otherwise><td><span class="status_btn status_completed">Active</span></td></c:otherwise>
                                                    </c:choose>
                                                <input type="hidden" name="userid" value="${customer.userID}"/>
                                                <td>
                                                    <button type="submit" name="action" value="viewCustomerDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${requestScope.cslist != null}">
                                        <c:forEach var="customer" items="${requestScope.cslist}" begin="0" end ="6">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td scope="row">${customer.userID}</td>
                                                    <td>${customer.name}</td>
                                                    <td>${customer.email}</td>
                                                    <td>${customer.phone}</td>
                                                    <td>${customer.address}</td>
                                                    <c:choose>
                                                        <c:when test="${customer.status == 0}"><td><span class="status_btn status_cancel">Inactive</span></td></c:when>
                                                        <c:otherwise><td><span class="status_btn status_completed">Active</span></td></c:otherwise>
                                                    </c:choose>
                                                <input type="hidden" name="userid" value="${customer.userID}"/>
                                                <td>
                                                    <button type="submit" name="action" value="viewCustomerDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                </c:when>
                            </c:choose>    
                            </tbody>
                        </table>
                        <c:choose>
                            <c:when test="${requestScope.keyword == null}">
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showUserPage&page=${requestScope.page-1}&roleid=3"><</a>
                                        </li>
                                        <% int totalProduct = UserDAO.getUsersByRole(3).size();
                                            int element = 7;
                                            float numOfPages = (float) totalProduct / element;
                                        %>
                                        <%for (int i = 1; i <= (int) Math.ceil(numOfPages); i++) {%>
                                        <li class="page-item "><a class="page-link " style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showUserPage&page=<%=i%>&roleid=3"><%=i%></a></li>
                                            <% }%>
                                        <li class="page-item">
                                            <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showUserPage&page=${requestScope.page+1}&roleid=3">></a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:when>
                            <c:otherwise>
                                <nav aria-label="Page navigation example">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showUserPage&page=${requestScope.page-1}&roleid=3&keyword=${requestScope.keyword}""><</a>
                                        </li>
                                        <%
                                            String keyword = request.getParameter("keyword");
                                            int totalSearchProduct = UserDAO.searchUsers(3, keyword).size();
                                            int elementPerPage = 7;
                                            float numOfSSearrchPages = (float) totalSearchProduct / elementPerPage;
                                        %>
                                        <%for (int i = 1; i <= (int) Math.ceil(numOfSSearrchPages); i++) {%>
                                        <li class="page-item "><a class="page-link " style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showPaginatedUserPage&page=<%=i%>&roleid=3&keyword=${requestScope.keyword}"><%=i%></a></li>
                                            <% }%>
                                        <li class="page-item">
                                            <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showPaginatedUserPage&page=${requestScope.page+1}&roleid=3&keyword=${requestScope.keyword}">></a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>
            </c:otherwise>
        </c:choose>
        <!-- FOOTER -->
        <footer>
            <c:import url="footer.jsp" />
        </footer>

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