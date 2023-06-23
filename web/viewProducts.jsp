
<%@page import="dao.ProductDAO"%>
<%@page import="dao.CategoryDAO"%>
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
                                    <a href="MainController?action=viewCustomers" class="sub-item">Customers</a>
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
                                <a  href="MainController?action=viewAllProducts" class="sub-btn active">
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
                    <div class="dashboard">
                        <div class="row group-form">
                            <div class="col">
                                <form class="search text-center d-flex align-items-center" action="MainController" metohd="post">
                                    <input name="keyword" type="text" placeholder="Search...">
                                    <button id="search-button" type="submit" name="action" value="getSearchedProduct" class="btn">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </form>
                            </div>
                            <div class="filter col-4"> 
                                <form>
                                    <button type="submit" name="action" value="viewAllProducts">All</button>
                                    <button type="submit" name="action" value="viewAlertProducts">Stock Alert</button>
                                    <button type="submit" name="action" value="viewOutOfStockProducts">Out of stock</button>
                                </form>
                            </div>

                            <div class="add col-2">
                                <form>
                                    <button>Add</button>
                                </form>
                            </div>
                        </div>   

                        <table class="table mt-5 text-center">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Product Name</th>
                                    <th scope="col">Category Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:choose>
                                    <c:when test="${requestScope.signal == 1}">
                                        <c:if test="${requestScope.ppList == null}">
                                            <c:forEach var="product" items="${requestScope.pList}" begin="0" end="6">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td>${product.productID}</td>
                                                    <td>${product.productName}</td>
                                                    <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                    <td>${product.price}</td>
                                                    <td>${product.stockQuantity}</td>
                                                <input type="hidden" name="pid" value="${product.productID}"/>
                                                <td>
                                                    <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                            </form>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.ppList != null}">
                                        <c:forEach var="product" items="${requestScope.ppList}" begin="0" end="6">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td>${product.productID}</td>
                                                    <td>${product.productName}</td>
                                                    <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                    <td>${product.price}</td>
                                                    <td>${product.stockQuantity}</td>
                                                    <td>
                                                        <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                    </td>
                                                <input type="hidden" name="pid" value="${product.productID}"/>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                </c:when>
                                <c:when test="${requestScope.signal == 2}">
                                    <c:if test="${requestScope.alList == null}">
                                        <c:forEach var="product" items="${requestScope.alertList}" begin="0" end="6">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td>${product.productID}</td>
                                                    <td>${product.productName}</td>
                                                    <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                    <td>${product.price}</td>
                                                    <td>${product.stockQuantity}</td>
                                                    <td>
                                                        <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                    </td>
                                                <input type="hidden" name="pid" value="${product.productID}"/>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.alList != null}">
                                        <c:forEach var="product" items="${requestScope.alList}" begin="0" end="6">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td>${product.productID}</td>
                                                    <td>${product.productName}</td>
                                                    <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                    <td>${product.price}</td>
                                                    <td>${product.stockQuantity}</td>
                                                    <td>
                                                        <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                    </td>
                                                <input type="hidden" name="pid" value="${product.productID}"/>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                </c:when>
                                <c:when test="${requestScope.signal == 3}">
                                    <c:if test="${requestScope.oList == null}">
                                        <c:forEach var="product" items="${requestScope.outList}" begin="0" end="6">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td>${product.productID}</td>
                                                    <td>${product.productName}</td>
                                                    <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                    <td>${product.price}</td>
                                                    <td>${product.stockQuantity}</td>
                                                    <td>
                                                        <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                    </td>
                                                <input type="hidden" name="pid" value="${product.productID}"/>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.oList != null}">
                                        <c:forEach var="product" items="${requestScope.oList}" begin="0" end="6">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td>${product.productID}</td>
                                                    <td>${product.productName}</td>
                                                    <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                    <td>${product.price}</td>
                                                    <td>${product.stockQuantity}</td>
                                                    <td>
                                                        <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                    </td>
                                                <input type="hidden" name="pid" value="${product.productID}"/>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                </c:when>
                                <c:when test="${requestScope.keyword != null}">
                                    <c:if test="${requestScope.mpplist == null}">
                                        <c:forEach var="product" items="${requestScope.mslist}" begin="0" end="6">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td>${product.productID}</td>
                                                    <td>${product.productName}</td>
                                                    <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                    <td>${product.price}</td>
                                                    <td>${product.stockQuantity}</td>
                                                    <td>
                                                        <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                    </td>
                                                <input type="hidden" name="pid" value="${product.productID}"/>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.mpplist != null}">
                                        <c:forEach var="product" items="${requestScope.mpplist}" begin="0" end="6">
                                            <form action="MainController" action="post">
                                                <tr>
                                                    <td>${product.productID}</td>
                                                    <td>${product.productName}</td>
                                                    <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                    <td>${product.price}</td>
                                                    <td>${product.stockQuantity}</td>
                                                    <td>
                                                        <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                    </td>
                                                <input type="hidden" name="pid" value="${product.productID}"/>
                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </c:if>

                                </c:when>
                            </c:choose>

                            </tbody>
                        </table>

                        <c:choose>
                            <c:when test="${requestScope.signal == 1}">
                                <nav aria-label="Page navigation example" style="margin: 50px 0;">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showItemsPage&page=${requestScope.page-1}&items=product"><</a>
                                        </li>
                                        <% int totalProducts = ProductDAO.getProducts().size();
                                            int element = 7;
                                            float numOfPages = (float) totalProducts / element;
                                        %>
                                        <%for (int i = 1; i <= (int) Math.ceil(numOfPages); i++) {%>
                                        <li class="page-item "><a class="page-link " style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showItemsPage&page=<%=i%>&items=product"><%=i%></a></li>
                                            <% }%>
                                        <li class="page-item">
                                            <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showItemsPage&page=${requestScope.page+1}&items=product">></a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:when>
                            <c:when test="${requestScope.signal == 2}">
                                <nav aria-label="Page navigation example" style="margin: 50px 0; ">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showAlertItemsPage&page=${requestScope.page-1}&items=product&signal=2"><</a>
                                        </li>
                                        <% int totalAlertProducts = ProductDAO.getAlertProducts().size();
                                            int elementAlert = 7;
                                            float numOfAlertPages = (float) totalAlertProducts / elementAlert;
                                        %>
                                        <%for (int i = 1; i <= (int) Math.ceil(numOfAlertPages); i++) {%>
                                        <li class="page-item "><a class="page-link " style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showAlertItemsPage&page=<%=i%>&items=product&signal=2"><%=i%></a></li>
                                            <% }%>
                                        <li class="page-item">
                                            <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showAlertItemsPage&page=${requestScope.page+1}&items=product&signal=2">></a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:when>
                            <c:when test="${requestScope.signal == 3}">
                                <nav aria-label="Page navigation example" style="margin: 50px 0; ">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showAlertItemsPage&page=${requestScope.page-1}&items=product&signal=3"><</a>
                                        </li>
                                        <% int totalOuttProducts = ProductDAO.getOutOfStocktProducts().size();
                                            int elementOut = 7;
                                            float numOfOutPages = (float) totalOuttProducts / elementOut;
                                        %>
                                        <%for (int i = 1; i <= (int) Math.ceil(numOfOutPages); i++) {%>
                                        <li class="page-item "><a class="page-link " style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showAlertItemsPage&page=<%=i%>&items=product&signal=3"><%=i%></a></li>
                                            <% }%>
                                        <li class="page-item">
                                            <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showAlertItemsPage&page=${requestScope.page+1}&items=product&signal=3">></a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:when>
                            <c:when test="${requestScope.keyword != null || requestScope.keyword == null}">
                                <nav aria-label="Page navigation example" style="margin: 50px 0;">
                                    <ul class="pagination justify-content-center">
                                        <li class="page-item">
                                            <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showSearchedItemsPage&page=${requestScope.page-1}&items=product&keyword=${requestScope.keyword}"><</a>
                                        </li>
                                        <%
                                            String keyword = request.getParameter("keyword");
                                            int totalSearchProducts = ProductDAO.getSearchedProducts(keyword).size();
                                            int elementSearch = 7;
                                            float numOfSearchPages = (float) totalSearchProducts / elementSearch;
                                        %>
                                        <%for (int i = 1; i <= (int) Math.ceil(numOfSearchPages); i++) {%>
                                        <li class="page-item "><a class="page-link " style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showSearchedItemsPage&page=<%=i%>&items=product&keyword=${requestScope.keyword}"><%=i%></a></li>
                                            <% }%>
                                        <li class="page-item">
                                            <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showSearchedItemsPage&page=${requestScope.page+1}&items=product&keyword=${requestScope.keyword}">></a>
                                        </li>
                                    </ul>
                                </nav>
                            </c:when>
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