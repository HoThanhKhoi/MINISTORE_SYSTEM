<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/productInfo.css">

        <!-- font Inter -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">

        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>


        <!-- font icon cdn -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />


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
        <!--HEADER-->
        <header>
            <c:import url="header_unlogined.jsp" />
        </header>

        <!-- HEADER PATH -->
        <nav class="navbar navbar_path navbar-expand-lg header-path">
            <div class="container justify-content-start">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="MainController?action=backToHome">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="#">${requestScope.cateName}</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <a href="#">${requestScope.product.productName}</a>
                        </li>
                    </ol>
                </nav>
            </div>
        </nav>

        <!-- PRODUCT DETAIL -->
        <div class="container product-detail">
            <div class="row">

                <!-- left -->
                <div class="col-lg-4 col-md-6 product-detail-img">
                    <div class="product-detail-img-item">
                        <img src="./image/Item.png" alt="">
                    </div>
                    <div class="owl-carousel owl-theme mt-4">
                        <img src="./image/Item.png" alt="">
                        <img src="./image/Item.png" alt="">
                        <img src="./image/Item.png" alt="">
                    </div>
                </div>

                <!-- right -->
                <c:if test="${requestScope.product != null}">
                    <div class="col-lg-7 col-md-6 ">
                        <div class="title mb-4">${product.productName}</div>
                        <div class="description mb-5">
                            ${product.description}
                        </div>

                        <div class="d-flex group-price mb-5 ">
                            <div class="bricked-price">$${product.price}</div>
                            <div class="price">$0.81</div>
                        </div>

                        <div class="d-flex mb-5 align-items-center">
                            <div class="group-quantity ">
                                <button class="" onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                    <i class="fas fa-minus"></i>
                                </button>
                                <input class="quantity fw-bold text-black" min="0" name="quantity" value="1" type="number">
                                <button class="" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                    <i class="fas fa-plus"></i>
                                </button>
                            </div>

                            <div class="notification">
                                <p>Only <span><strong>${product.stockQuantity}</strong></span> items left!</p>
                            </div>
                        </div>

                        <form action="MainController">
                            <div class="cart-btn">
                                <button class="btn btn-primary mt-3 px-3 py-2 fw-bold" >Add To Cart</button>
                            </div>
                        </form>

                    </div>
                </c:if>

            </div>
        </div>

        <!-- RELATED PRODUCT -->
        <div class="container-fluid related-product my-5">
            <div class="title text-center mb-5">Related Products</div>
            <div class="item-list mx-5">
                <div class="row">

                    <c:forEach var="proCate" items="${requestScope.list}" begin="0" end="9">
                        <div class="col">
                            <div class="item mb-4 text-center">
                                <div class="card border-0 shadow">
                                    <img src="./image/Item.png" class="card-img-top" alt="">
                                    <div class="card-body">
                                        <h5 class="card-title mb-3 fw-bold">${proCate.productName}</h5>
                                        <span class="bricked-price mx-2">${proCate.price}</span>
                                        <span class="price fw-bold mx-2">${Math.round(proCate.price) -0.45}</span></br>
                                        <input type="hidden" name="pid" value="${product.productID}"/>
                                        <input type="hidden" name="cid" value="${requestScope.cateID}"/>
                                        <a href="MainController?action=addToCart&quantity=1&pid=${proCate.productID}&cid=${proCate.cateID}" class="btn btn-primary mt-2 px-3 py-2 fw-bold" name="action" value="addToCart">Add To Cart</a>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </c:forEach>

                </div>
            </div>
        </div>


        <!-- back to top -->
        <button type="button" class="btn btn-danger btn-floating btn-lg" id="btn-back-to-top">
            <i class="fas fa-arrow-up"></i>
        </button>

        <script src="./js/backToTop.js"></script>

        <!-- CDN jquery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
                integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <!-- CDN carousel -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"
                integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

        <script>
                                    var owl = $('.owl-carousel');
                                    owl.owlCarousel({
                                        items: 3,
                                        loop: true,
                                        margin: 10,
                                        autoplay: true,
                                        autoplayTimeout: 2000,
                                        autoplayHoverPause: true
                                    });
                                    $('.play').on('click', function () {
                                        owl.trigger('play.owl.autoplay', [1000]);
                                    });
                                    $('.stop').on('click', function () {
                                        owl.trigger('stop.owl.autoplay');
                                    });
        </script>

    </body>

</html>