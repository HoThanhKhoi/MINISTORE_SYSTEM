
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/x-icon" href="./image/favicon-32x32.png">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/homePage.css">
        <link rel="stylesheet" href="./js/backToTop.js">
        <link rel="stylesheet" href="./js/countDown.js">

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

        <!-- Banner -->
        <div class="container-fluid ">
            <!-- Header -->
            <div class="header">
                <nav>
                    <ul>

                        <li>
                            <a href="homePage.jsp">Home</a>
                        </li>

                        <li>
                            <a href="#category">Category</a>
                        </li>

                        <li>
                            <c:choose>
                                <c:when test="${sessionScope.customer != null}">
                                    <a href="customerProfile.jsp?id=${sessionScope.customer.userID}">Profile</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="MainController?action=register">Register</a>
                                </c:otherwise>
                            </c:choose>
                        </li>

                        <li>
                            <c:choose>
                                <c:when test="${sessionScope.customer != null}">
                                    <a href="MainController?action=logout">Logout</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="login.jsp">Login</a>
                                </c:otherwise>
                            </c:choose>

                        </li>
                    </ul>
                </nav>
            </div>


            <!-- Banner -->
            <div class="banner">
                <video class="w-100" autoplay loop muted>
                    <source src="./image/mixkit-surface-covered-with-many-fruits-and-vegetables-seen-in-detail-10433-medium.mp4" type="video/mp4" />
                </video>
                <div class="overlay"></div>

                <div class="banner-title text-center d-flex align-items-center">

                    <h1>Ministore </br>
                        Shop <em>Everything!</em>
                    </h1>
                </div>

                <form class="banner-search text-center d-flex align-items-center" action="MainController" method="post">
                    <input type="text" placeholder="Search..." name="keyword">
                    <button id="search-button" type="submit" class="btn" name="action" value="searchProduct" style="width:60px; left:1000px"> 
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </div>
        </div>


        <!-- Hot Deal -->
        <c:if test="${requestScope.page == 1 || requestScope.list == null}">
            <div class="container-fluid hot-deal" id="hot-deal">
                <div class="hot-deal-title ">
                    <h1 class="pt-5 pb-5 text-center">Hot <u class="fw-bold"><em class="animate-text">deal</em></u> right now!</h1>
                </div>

                <div class="item-list mx-5">
                    <div class="row mx-5">
                        <div class="owl-carousel owl-theme">

                            <c:forEach var="product" items="${ProductDAO.getProducts()}" begin="0" end="6">
                                <div class="item mb-4 text-center">
                                    <div class="card border-0 shadow align-items-center">
                                        <a href="MainController?action=viewProduct&pid=${product.productID}&cateID=${product.cateID}"><img src="${product.imgPath}" class="card-img-top" alt=""></a>
                                        <div class="card-body">
                                            <h5 class="card-title fw-bold">
                                                <a href="MainController?action=viewProduct&pid=${product.productID}&cateID=${product.cateID}">
                                                    ${product.productName}</a>
                                            </h5>
                                            <fmt:formatNumber value="${product.price + 0.5}" pattern="#,##0.00" var="formattedNumber" />
                                            <span class="bricked-price mx-2">$${formattedNumber}</span>                                          
                                            <span class="price fw-bold mx-2">$${product.price}</span></br>
                                            <a href="MainController?action=addToCart&quantity=1&pid=${product.productID}&cid=${product.cateID}" class="btn btn-primary mt-3 px-3 py-2 fw-bold" name="action">Add To Cart</a>
                                        </div>
                                    </div>
                                </div>  
                            </c:forEach>

                        </div>
                    </div>
                </div>

                <div class="hot-deal-footer">
                    <div class="container">

                        <div id="countdown">
                            <h2 class="py-4 text-center"><em>Deals end in</em></h2>
                            <ul>
                                <li><span id="days"></span>Days</li>
                                <li><span>:</span>&nbsp;</li>
                                <li><span id="hours"></span>Hours</li>
                                <li><span>:</span>&nbsp;</li>
                                <li><span id="minutes"></span>Minutes</li>
                                <li><span>:</span>&nbsp;</li>
                                <li><span id="seconds"></span>Seconds</li>
                            </ul>
                        </div>
                    </div>
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
                        <c:forEach var="cate" items="${CategoryDAO.getCategories()}" begin="0" end="1">                                
                            <div class="item mb-4 text-center">
                                <div class="card border-0 shadow align-items-center ">
                                    <a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">                                   
                                        <img src="${cate.imgPath}" class="card-img-top" alt="">
                                    </a>
                                    <div class="overlay"></div>
                                    <div class="card-content">
                                        <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">${cate.cateName}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>

                    <div class="col-4 col-sm-4 " style="width: 30%">
                        <!-- begin item -->
                        <c:forEach var="cate" items="${CategoryDAO.getCategories()}" begin="2" end="3">                                
                            <div class="item mb-4 text-center">
                                <div class="card border-0 shadow align-items-center ">
                                    <a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">                                   
                                        <img src="${cate.imgPath}" class="card-img-top" alt="">
                                    </a>                                    <div class="overlay"></div>
                                    <div class="card-content">
                                        <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">${cate.cateName}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- begin item -->

                    </div>

                    <div class="col-4 col-sm-4 " style="width: 30%">
                        <!-- begin item -->
                        <c:forEach var="cate" items="${CategoryDAO.getCategories()}" begin="4" end="5">                                
                            <div class="item mb-4 text-center">
                                <div class="card border-0 shadow align-items-center ">
                                    <a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">                                   
                                        <img src="${cate.imgPath}" class="card-img-top" alt="">
                                    </a>                                    <div class="overlay"></div>
                                    <div class="card-content">
                                        <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">${cate.cateName}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                </div>
            </div>

            <div class="row pb-3 mx-5">
                <div class="col row category-list mx-3 d-flex flex-wrap justify-content-between">
                    <div class="col-4 col-sm-4" style="width: 30%">
                        <!-- begin item -->
                        <c:forEach var="cate" items="${CategoryDAO.getCategories()}" begin="6" end="7">                                
                            <div class="item mb-4 text-center">
                                <div class="card border-0 shadow align-items-center ">
                                    <a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">                                   
                                        <img src="${cate.imgPath}" class="card-img-top" alt="">
                                    </a>                                   
                                    <div class="overlay"></div>
                                    <div class="card-content">
                                        <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">${cate.cateName}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="col-4 col-sm-4 " style="width: 30%">
                        <!-- begin item -->
                        <c:forEach var="cate" items="${CategoryDAO.getCategories()}" begin="8" end="9">                                
                            <div class="item mb-4 text-center">
                                <div class="card border-0 shadow align-items-center ">
                                    <a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">                                   
                                        <img src="${cate.imgPath}" class="card-img-top" alt="">
                                    </a>
                                    <div class="overlay"></div>
                                    <div class="card-content">
                                        <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">${cate.cateName}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="col-4 col-sm-4 " style="width: 30%">
                        <!-- begin item -->
                        <c:forEach var="cate" items="${CategoryDAO.getCategories()}" begin="10" end="11">                                
                            <div class="item mb-4 text-center">
                                <div class="card border-0 shadow align-items-center ">
                                    <a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">                                   
                                        <img src="${cate.imgPath}" class="card-img-top" alt="">
                                    </a>
                                    <div class="overlay"></div>
                                    <div class="card-content">
                                        <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProductByCategory&cateID=${cate.cateID}">${cate.cateName}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="col ad-banner mx-3">
                    <img src="./image/Ad banner 1.png" alt="">
                </div>
            </div>
        </div>



        <!-- BEST SELLING -->
        <div class="best-selling pb-3" id="best-selling">
            <div class="container">

                <div class="best-selling-title ">
                    <h1 class="pt-5 pb-5 text-center fw-bold"><em>All products</em></h1>
                </div>

                <div class="item-list mx-5">
                    <div class="row row-cols-md-5">
                        <c:if test="${ProductDAO.getProducts() != null}">
                            <c:if test="${requestScope.list == null}">
                                <c:forEach var="product" items="${ProductDAO.getProducts()}" begin="0" end="19">
                                    <div class="col">
                                        <!-- begin item -->
                                        <div class="item mb-4 text-center">
                                            <div class="card border-0 shadow align-items-center">
                                                <a href="MainController?action=viewProduct&pid=${product.productID}&cateID=${product.cateID}">
                                                    <img src="${product.imgPath}" class="card-img-top" alt="">
                                                </a>
                                                <div class="card-body">
                                                    <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProduct&pid=${product.productID}&cateID=${product.cateID}">${product.productName}</a></h5>
                                                        <fmt:formatNumber value="${product.price + 0.5}" pattern="#,##0.00" var="formattedNumber" />
                                                    <span class="bricked-price mx-2">$${formattedNumber}</span>
                                                    <span class="price fw-bold mx-2">$${product.price}</span></br>                                                  
                                                    <a href="MainController?action=addToCart&pid=${product.productID}&cid=${product.cateID}&quantity=1" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
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
                                            <div class="card border-0 shadow align-items-center">
                                                <a href="MainController?action=viewProduct&pid=${product.productID}&cateID=${product.cateID}">
                                                    <img src="${product.imgPath}" class="card-img-top" alt="">
                                                </a>                                                <div class="card-body">
                                                    <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProduct&pid=${product.productID}&cateID=${product.cateID}">${product.productName}</a></h5>

                                                    <fmt:formatNumber value="${product.price + 0.5}" pattern="#,##0.00" var="formattedNumber" />
                                                    <span class="bricked-price mx-2">$${formattedNumber}</span>
                                                    <span class="price fw-bold mx-2">$${product.price}</span></br>
                                                    <a href="MainController?action=addToCart&pid=${product.productID}&cid=${product.cateID}&quantity=1" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
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
                    <ul class="pagination justify-content-center ">
                        <c:if test="${requestScope.page == 1 || requestScope.page == null}">
                            <li class="page-item previous disabled">
                                <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showPage&page=1" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${requestScope.page > 1}">
                            <li class="page-item">
                                <a class="page-link" style="padding: 8px 14px !important;color: #1B9C85" href="MainController?action=showPage&page=${requestScope.page-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:set var="totalProducts" value="${ProductDAO.getTotalProduct()}"/>
                        <c:set var="numOfPages" value="${Math.ceil(totalProducts / 20)}"/>
                        <fmt:formatNumber value="${numOfPages}" pattern="0" var="intNumPage" />
                        <c:forEach var="i" begin="1" end="${numOfPages}" step="1">
                            <li class="page-item "><a class="page-link " style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showPage&page=${i}">${i}</a></li>
                            </c:forEach>
                            <c:if test="${requestScope.page >= numOfPages  }">
                            <li class="page-item">
                                <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showPage&page=${intNumPage}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${requestScope.page <  numOfPages || requestScope.page == null}">
                            <li class="page-item">
                                <a class="page-link" style="padding:8px 14px !important;color: #1B9C85" href="MainController?action=showPage&page=${requestScope.page + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                    </ul>
                </nav>
            </div>

        </div>

        <form action="MainController" action="post">                
            <button type="submit" name="action" value="backToHome" class="btn btn-floating btn-lg" id="btn-home-page">
                <img style="length:33px; height:33px"src="image/favicon-32x32.png" alt="Ministore">
            </button>
        </form>
        <form action="MainController" action="post">                
            <button type="submit" name="action" value="viewCart" class="btn btn-floating btn-lg" id="btn-floating-cart">
                <i class="fa-solid fa-cart-shopping"></i>
            </button>
        </form>
        <button type="button" class="btn btn-floating btn-lg" id="btn-back-to-top">
            <i class="fas fa-arrow-up"></i>
        </button>



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
            var owl = $('.owl-carousel');
            owl.owlCarousel({
                items: 5,
                loop: true,
                margin: 10,
                autoplay: true,
                autoplayTimeout: 1000,
                autoplayHoverPause: true
            });
            $('.play').on('click', function () {
                owl.trigger('play.owl.autoplay', [1000]);
            });
            $('.stop').on('click', function () {
                owl.trigger('stop.owl.autoplay');
            });
        </script>

        <script src="./js/backToTop.js"></script>

        <script src="./js/countDown.js"></script>

    </body>

</html>