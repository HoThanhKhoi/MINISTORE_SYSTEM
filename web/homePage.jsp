<%-- 
    Document   : homepage
    Created on : May 27, 2023, 7:22:27 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.Product"%>
<%@page import="DTO.Product"%>
<%@page import="DAO.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/homepage.css">


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

        <!-- Banner -->
        <div class="container-fluid ">
            <!-- Header -->
            <div class="header">
                <nav>
                    <ul>
                        <li>
                            <a href="">Home</a>
                        </li>
                        <li>
                            <a href="#hot-deal">Hot Deals</a>
                        </li>
                        <li>
                            <a href="#best-selling">Best Sellers</a>
                        </li>
                        <li>
                            <a href="#category">Category</a>
                        </li>
                        <li>
                            <a href="">Register</a>
                        </li>
                        <li>
                            <a href="">Login</a>
                        </li>
                    </ul>
                </nav>
            </div>

            <!-- Banner -->
            <div class="banner">
                <video class="w-100" autoplay loop muted>
                    <source src="./image/mixkit-surface-covered-with-many-fruits-and-vegetables-seen-in-detail-10433-medium.mp4" type="video/mp4" />
                </video>
                <!-- <img src="./image/banner_homepage.png" alt=""> -->
                <div class="overlay"></div>
                <div class="banner-title text-center d-flex align-items-center">
                    <h1>Ministore </br>
                        Shop <u><em>Everything!</em></u>
                    </h1>
                </div>
            </div>
        </div>
        <c:if test="${requestScope.page == 1 || requestScope.list == null}">
            <!-- Hot Deal -->
            <div class="container-fluid hot-deal" id="hot-deal">
                <div class="hot-deal-title ">
                    <img src="./image/logo-1_hot-deal.png" alt="">
                    <h1 class="pt-5 pb-5 text-center">Hot <u class="fw-bold"><em>deal</em></u> right now!</h1>
                    <img src="./image/logo-2_hot-deal.png" alt="">
                </div>

                <div class="item-list mx-5">
                    <div class="row mx-5">
                        <div class="owl-carousel owl-theme">
                            <%
                                ArrayList<Product> list = ProductDAO.getProducts();
                                for (int i = 0; i <= 6; i++) {%>
                            <div class="item mb-4 text-center">
                                <div class="card border-0 shadow">
                                    <img src="./image/Item.png" class="card-img-top" alt="">
                                    <div class="card-body">
                                        <h5 class="card-title mb-3 fw-bold">
                                            <a href="MainController?action=viewProduct&pid=<%= list.get(i).getProductID()%>&cateID=<%= list.get(i).getCateID()%>">
                                             <%= list.get(i).getProductName()%></a>
                                        </h5>
                                        <span class="bricked-price mx-2"><%= list.get(i).getPrice()%></span>
                                        <span class="price fw-bold mx-2">$1.19</span></br>
                                        <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold" name="action">Add To Cart</a>
                                    </div>
                                </div>
                            </div>                        
                            <% }%>
                            <!-- begin item -->

                            <!-- end item -->
                        </div>
                    </div>
                </div>
                <div class="hot-deal-footer">
                    <h2 class="py-4 text-center"><em>Deals end in XX:XX</em></h2>
                </div>
                <div class="hot-deal-banner">
                    <img src="./image/image 21.png" alt="">
                </div>           
            </c:if>
        </div>


        <!-- Categories -->
        <div class="container-fluid category" id="category">
            <div class="row pt-5 mx-5">
                <div class="col ad-banner mx-3">
                    <img src="./image/Ad banner 1.png" alt="">
                </div>

                <div class="col row category-list mx-3 d-flex flex-wrap justify-content-between">
                    <div class="col-4 col-sm-4 " style="width: 30%">
                            <div class="item mb-4 text-center">
                                <div class="card border-0 shadow">
                                    <img src="./image/category-1.png" class="card-img-top" alt="">
                                    <div class="overlay"></div>
                                    <div class="card-content">
                                        <h5 class="card-title mb-3 fw-bold"></h5>
                                    </div>
                                </div>
                            </div>
                       
                    </div>

                    <div class="col-4 col-sm-4 " style="width: 30%">
                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/category-2.png" class="card-img-top" alt="">
                                <div class="overlay"></div>
                                <div class="card-content">
                                    <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                </div>
                            </div>
                        </div>
                        <!-- begin item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item image.png" class="card-img-top" alt="">
                                <div class="overlay"></div>
                                <div class="card-content">
                                    <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                </div>
                            </div>
                        </div>
                        <!-- begin item -->
                    </div>

                    <div class="col-4 col-sm-4 " style="width: 30%">
                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item image.png" class="card-img-top" alt="">
                                <div class="overlay"></div>
                                <div class="card-content">
                                    <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                </div>
                            </div>
                        </div>
                        <!-- begin item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item image.png" class="card-img-top" alt="">
                                <div class="overlay"></div>

                                <div class="card-content">
                                    <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                </div>
                            </div>
                        </div>
                        <!-- begin item -->
                    </div>
                </div>
            </div>

            <div class="row pb-3 mx-5">
                <div class="col row category-list mx-3 d-flex flex-wrap justify-content-between">
                    <div class="col-4 col-sm-4" style="width: 30%">
                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/category-1.png" class="card-img-top" alt="">
                                <div class="overlay"></div>
                                <div class="card-content">
                                    <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/category-2.png" class="card-img-top" alt="">
                                <div class="overlay"></div>
                                <div class="card-content">
                                    <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->
                    </div>

                    <div class="col-4 col-sm-4 " style="width: 30%">
                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/category-2.png" class="card-img-top" alt="">
                                <div class="overlay"></div>
                                <div class="card-content">
                                    <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item image.png" class="card-img-top" alt="">
                                <div class="overlay"></div>
                                <div class="card-content">
                                    <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->
                    </div>

                    <div class="col-4 col-sm-4 " style="width: 30%">
                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item image.png" class="card-img-top" alt="">
                                <div class="overlay"></div>
                                <div class="card-content">
                                    <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item image.png" class="card-img-top" alt="">
                                <div class="overlay"></div>
                                <div class="card-content">
                                    <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->
                    </div>
                </div>

                <div class="col ad-banner mx-3">
                    <img src="./image/Ad banner 1.png" alt="">
                </div>
            </div>
        </div>

        <!-- BEST SELLING -->
        <div class="best-selling" id="best-selling">
            <div class="container">

                <div class="best-selling-title ">
                    <h1 class="pt-5 pb-5 text-center fw-bold"><em>Best selling</em></h1>
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
                            <a class="page-link" href="MainController?action=showPage&page=${requestScope.page-1}">Previous</a>
                        </li>
                        <% int totalProduct = ProductDAO.getTotalProduct();
                            int element = 20;
                        %>
                        <%for (int i = 1; i <= (int) Math.ceil(totalProduct / element); i++) {%>
                        <li class="page-item"><a class="page-link" href="MainController?action=showPage&page=<%=i%>"><%=i%></a></li>
                            <% }%>
                        <li class="page-item">
                            <a class="page-link" href="MainController?action=showPage&page=${requestScope.page+1}">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>

        </div>




        <!-- CDN jquery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
                integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- CDN carousel -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
                integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- Init Own Carousel -->
        <script>
            $('.owl-carousel').owlCarousel({
                loop: true, //loop the carousel from the last item -> first item 
                margin: 10,
                nav: true, //make reference to the nav controls button (prev and next button)
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 3
                    },
                    1000: {
                        items: 5
                    }
                }
            })


        </script>

    </body>

</html>