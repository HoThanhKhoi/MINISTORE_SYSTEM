
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
        <link rel="stylesheet" href="./css/manageProductScreen.css" />

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
                    <div class="row">
                        <div class="col-5">
                            <form class="search text-center d-flex align-items-center" action="MainController" metohd="post">
                                <input name="keyword" type="text" placeholder="Search...">
                                <button id="search-button" type="submit" name="action" value="getSearchedProduct" class="btn">
                                    <i class="fas fa-search"></i>
                                </button>
                            </form>
                        </div>
                        <div class="filter col-5 mx-3"> 
                            <form>
                                <button type="submit" name="action" value="viewAllProducts">All</button>
                                <button type="submit" name="action" value="viewAlertProducts">Stock Alert</button>
                                <button type="submit" name="action" value="viewOutOfStockProducts">Out of stock</button>
                            </form>
                        </div>
                        <div class="col-1">
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
                        <form action="MainController" action="post">
                            <c:choose>
                                <c:when test="${requestScope.signal == 1}">
                                    <c:if test="${requestScope.ppList == null}">
                                        <c:forEach var="product" items="${requestScope.pList}" begin="0" end="6">
                                            <tr>
                                                <td>${product.productID}</td>
                                                <td>${product.productName}</td>
                                                <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                <td>${product.price}</td>
                                                <td>${product.stockQuantity}</td>
                                                <td>
                                                    <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                            <input type="hidden" value="${product.productID}"/>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.ppList != null}">
                                        <c:forEach var="product" items="${requestScope.ppList}" begin="0" end="6">
                                            <tr>
                                                <td>${product.productID}</td>
                                                <td>${product.productName}</td>
                                                <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                <td>${product.price}</td>
                                                <td>${product.stockQuantity}</td>
                                                <td>
                                                    <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                            <input type="hidden" value="${product.productID}"/>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </c:when>
                                <c:when test="${requestScope.signal == 2}">
                                    <c:if test="${requestScope.alList == null}">
                                        <c:forEach var="product" items="${requestScope.alertList}" begin="0" end="6">
                                            <tr>
                                                <td>${product.productID}</td>
                                                <td>${product.productName}</td>
                                                <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                <td>${product.price}</td>
                                                <td>${product.stockQuantity}</td>
                                                <td>
                                                    <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                            <input type="hidden" value="${product.productID}"/>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.alList != null}">
                                        <c:forEach var="product" items="${requestScope.alList}" begin="0" end="6">
                                            <tr>
                                                <td>${product.productID}</td>
                                                <td>${product.productName}</td>
                                                <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                <td>${product.price}</td>
                                                <td>${product.stockQuantity}</td>
                                                <td>
                                                    <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                            <input type="hidden" value="${product.productID}"/>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </c:when>
                                <c:when test="${requestScope.signal == 3}">
                                    <c:if test="${requestScope.oList == null}">
                                        <c:forEach var="product" items="${requestScope.outList}" begin="0" end="6">
                                            <tr>
                                                <td>${product.productID}</td>
                                                <td>${product.productName}</td>
                                                <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                <td>${product.price}</td>
                                                <td>${product.stockQuantity}</td>
                                                <td>
                                                    <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                            <input type="hidden" value="${product.productID}"/>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.oList != null}">
                                        <c:forEach var="product" items="${requestScope.oList}" begin="0" end="6">
                                            <tr>
                                                <td>${product.productID}</td>
                                                <td>${product.productName}</td>
                                                <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                <td>${product.price}</td>
                                                <td>${product.stockQuantity}</td>
                                                <td>
                                                    <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                            <input type="hidden" value="${product.productID}"/>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </c:when>
                                <c:when test="${requestScope.keyword != null}">
                                    <c:if test="${requestScope.mpplist == null}">
                                        <c:forEach var="product" items="${requestScope.mslist}" begin="0" end="6">
                                            <tr>
                                                <td>${product.productID}</td>
                                                <td>${product.productName}</td>
                                                <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                <td>${product.price}</td>
                                                <td>${product.stockQuantity}</td>
                                                <td>
                                                    <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                            <input type="hidden" value="${product.productID}"/>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.mpplist != null}">
                                        <c:forEach var="product" items="${requestScope.mpplist}" begin="0" end="6">
                                            <tr>
                                                <td>${product.productID}</td>
                                                <td>${product.productName}</td>
                                                <td>${CategoryDAO.getCategory(product.cateID).getCateName()}</td>                                 
                                                <td>${product.price}</td>
                                                <td>${product.stockQuantity}</td>
                                                <td>
                                                    <button type="submit" name="action" value="viewProductDetailsPage"><i class="update fa-solid fa-pen-to-square mx-2 "></i></button>
                                                </td>
                                            <input type="hidden" value="${product.productID}"/>
                                            </tr>
                                        </c:forEach>
                                    </c:if>

                                </c:when>
                            </c:choose>
                        </form>
                        </tbody>
                    </table>
                </div>
            </div>
            <c:choose>
                <c:when test="${requestScope.signal == 1}">
                    <nav aria-label="Page navigation example" style="margin-top: 50px ">
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
                    <nav aria-label="Page navigation example" style="margin-top: 50px ">
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
                    <nav aria-label="Page navigation example" style="margin-top: 50px ">
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
                    <nav aria-label="Page navigation example" style="margin-top: 50px ">
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
    </body>
</html>