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

        <!-- toastr -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    </head>

    <body>
        <!--HEADER-->
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
                    <div class="col-6">
                        <div class="title mb-4">${product.productName}</div>
                        <div class="description mb-4">
                            ${product.description}
                        </div>

                        <div class="d-flex group-price mb-4">
                            <div class="bricked-price">$${product.price}</div>
                            <div class="price">$0.81</div>
                        </div>
                        <form action="MainController" method="get">
                            <div class="d-flex">
                                <div class="group-quantity">
                                    <a role="button" class="btn btn-link px-2" onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                        <i class="fas fa-minus"></i>
                                    </a>
                                    <input class="quantity fw-bold text-black" min="1" max="${product.stockQuantity}" name="quantity" value="1" type="number">
                                    <a role="button" class="btn btn-link px-2" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                        <i class="fas fa-plus"></i>
                                    </a>
                                </div>

                                <div class="notification">
                                    <p>Only <span>${product.stockQuantity}</span> items left!</p>
                                </div>
                            </div>
                            <div class="cart-btn">
                                <input type="hidden" name="pid" value="${product.productID}">
                                <input type="hidden" name="cid" value="${requestScope.cate.cateID}">
                                <!--<input type="hidden" name="quantity" id="quantity">-->
                                <button class="btn btn-primary mt-3 px-3 py-2 fw-bold" type="submit" value="addToCart" name="action">Add To Cart</button>
                            </div>
                        </form>
                    </div>
                </c:if>

            </div>
        </div>
        <!-- RELATED PRODUCT -->
        <!--        <div class="container-fluid related-product my-5">
                    <div class="title text-center mb-5">Related Products</div>
                    <div class="item-list mx-5">
                        <div class="row ">
                            <div class="col">
                                 begin item 
                                <div class="item mb-4 text-center">
                                    <div class="card border-0 shadow">
                                        <img src="./image/Item.png" class="card-img-top" alt="">
                                        <div class="card-body">
                                            <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                            <span class="bricked-price mx-2">$1.36</span>
                                            <span class="price fw-bold mx-2">$1.19</span></br>
                                            <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                        </div>
                                    </div>
                                </div>
                                 end item 
                            </div>
        
                            
                        </div>
                    </div>
                </div>-->

        <!-- back to top -->
        <button type="button" class="btn btn-danger btn-floating btn-lg" id="btn-back-to-top">
            <i class="fas fa-arrow-up"></i>
        </button>
        <c:if test="${requestScope.noti != null}">
            <script>
                $(function () {
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-center",
                        "preventDuplicates": false,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    };
                    toastr.success("Product is added to cart.");
                });
            </script>
        </c:if>
        <script src="./js/backToTop.js"></script>
    </body>

</html>