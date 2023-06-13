<%-- 
    Document   : orderSuccesful
    Created on : Jun 9, 2023, 8:35:05 AM
    Author     : Asus TUF
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Successful</title>
        <link rel="stylesheet" href="css/orderSuccessful.css">
        

        <!-- Icon CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


        <!-- 1. cdn min.css carousel-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
              integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- 2. own carousel theme min.css -->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
              integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        
        <header>
            <c:import url="header.jsp" />
        </header>
        
        <div class="best-selling" id="best-selling">
            <div class="container">

                <div class="best-selling-title">
                    <h2 class="pt-5 pb-5 text-center" style="color: #333"><em>Order successfully. Your order is now processing!</em></h2>
                    <h5> Check&nbsp;<a href="#" class="card-title mb-3 fw-bold">my orders</a></h5>
                </div>

                <div class="item-list mx-5">
                    <div class="row ">
                        <c:if test="${ProductDAO.getProducts() != null}">
                            <c:if test="${requestScope.list == null}">
                                <c:forEach var="product" items="${ProductDAO.getProducts()}" begin="0" end="19">
                                    <div class="col">
                                        <!-- begin item -->
                                        <div class="item mb-4 text-center">
                                            <div class="card border-0 shadow">
                                                <img src="./image/Item.png" class="card-img-top" alt="">
                                                <div class="card-body">
                                                    <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProduct&pid=${product.productID}&cateID=${product.cateID}">${product.productName}</a></h5>
                                                    <span class="bricked-price mx-2">${product.price}</span>
                                                    <span class="price fw-bold mx-2">$1.19</span></br>
                                                    <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end item -->
                                    </div>

                                </c:forEach>
                            </c:if>
                            <c:if test="${requestScope.list != null}">
                                <c:forEach var="product" items="${requestScope.list}">
                                    <div class="col">
                                        <!-- begin item -->
                                        <div class="item mb-4 text-center">
                                            <div class="card border-0 shadow">
                                                <img src="./image/Item.png" class="card-img-top" alt="">
                                                <div class="card-body">
                                                    <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProduct&pid=${product.productID}&cateID=${product.cateID}">${product.productName}</a></h5>
                                                    <span class="bricked-price mx-2">${product.price}</span>
                                                    <span class="price fw-bold mx-2">$1.19</span></br>
                                                    <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- end item -->
                                    </div>

                                </c:forEach>
                            </c:if>

                        </c:if>
                    </div>
                </div>

                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item">
                            <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showPage&page=${requestScope.page-1}"><</a>
                        </li>
                        <% int totalProduct = ProductDAO.getTotalProduct();
                            int element = 20;
                        %>
                        <%for (int i = 1; i <= (int) Math.ceil(totalProduct / element); i++) {%>
                        <li class="page-item "><a class="page-link " style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showPage&page=<%=i%>"><%=i%></a></li>
                            <% }%>
                        <li class="page-item">
                            <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showPage&page=${requestScope.page+1}">></a>
                        </li>
                    </ul>
                </nav>
            </div>

        </div>
        
    </body>
</html>
