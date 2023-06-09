<%-- 
    Document   : searchProduct
    Created on : Jun 2, 2023, 2:16:52 PM
    Author     : Admin
--%>
<%@page import="dao.ProductDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/productDetail.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <header>
            <c:choose>
                <c:when test="${sessionScope.customer != null}">
                    <c:import url="header.jsp" />
                </c:when>
                <c:otherwise>
                    <c:import url="header_unlogined.jsp" />
                </c:otherwise>
            </c:choose>
        </header>
        <form class="banner-search text-center d-flex align-items-center" action="MainController" method="post">
            <input type="text" placeholder="Search..." name="keyword">
            <button id="search-button" type="submit" class="btn" name="action" value="searchProduct">
                <i class="fas fa-search"></i>
            </button>
        </form>
        <div class="noti-key">Search result for <strong>'${sessionScope.keyword}'</strong></div>
        <div class="container-fluid product-detail">
            <div class="item-list mx-5">
                <div class="row">

                    <c:if test="${requestScope.slist == null}">
                        <c:forEach var="searchItem" items="${requestScope.list}" begin="0" end="19">
                            <div class="col">
                                <div class="item mb-4 text-center">
                                    <div class="card border-0 shadow">
                                        <img src="./image/Item.png" class="card-img-top" alt="">
                                        <div class="card-body">
                                            <h5 class="card-title mb-3 fw-bold">${searchItem.productName}</h5>
                                            <span class="bricked-price mx-2">${searchItem.price}</span>
                                            <span class="price fw-bold mx-2">${Math.round(searchItem.price) -0.45}</span></br>
                                            <a href="MainController?action=addToCart&pid=${searchItem.productID}&cid=${searchItem.productID}&quantity=1" class="btn btn-primary mt-2 px-3 py-2 fw-bold">Add To Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.slist != null}">
                        <c:forEach var="searchItem" items="${requestScope.slist}">
                            <div class="col">
                                <div class="item mb-4 text-center">
                                    <div class="card border-0 shadow">
                                        <img src="./image/Item.png" class="card-img-top" alt="">
                                        <div class="card-body">
                                            <h5 class="card-title mb-3 fw-bold">${searchItem.productName}</h5>
                                            <span class="bricked-price mx-2">${searchItem.price}</span>
                                            <span class="price fw-bold mx-2">${Math.round(searchItem.price) -0.45}</span></br>
                                            <a href="MainController?action=addToCart&pid=${searchItem.productID}&cid=${searchItem.productID}&quantity=1" class="btn btn-primary mt-2 px-3 py-2 fw-bold">Add To Cart</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showSearchedPage&page=${requestScope.page-1}&keyword=${requestScope.keyword}"><</a>
                    </li>
                    <% String keyword = request.getParameter("keyword");
                        int totalProduct = ProductDAO.getSearchedProducts(keyword).size();
                        int element = 20;
                        float numOfPages = (float) totalProduct / element;
                    %>
                    <%for (int i = 1; i <= (int) Math.ceil(numOfPages); i++) {%>
                    <li class="page-item "><a class="page-link " style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showSearchedPage&page=<%=i%>&keyword=${requestScope.keyword}"><%=i%></a></li>
                        <% }%>
                    <li class="page-item">
                        <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showSearchedPage&page=${requestScope.page+1}&keyword=${requestScope.keyword}">></a>
                    </li>
                </ul>
            </nav>
        </div>

    </body>
</html>
