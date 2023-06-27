

<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/productDetail.css">

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
        <nav class="navbar navbar_path navbar-expand-lg header-path mt-5 mb-1">
            <div class="container-fluid">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="MainController?action=backToHome">Home</a>
                        </li>
                        <li class="breadcrumb-item" aria-current="page">
                            <a href="MainController?action=viewProductByCategory&cateID=${requestScope.cateID}">${requestScope.cateName}</a>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            <a href="#">${requestScope.product.getProductName()}</a>
                        </li>
                    </ol>
                </nav>
            </div>
        </nav>



        <!-- PRODUCT INFO -->
        <div class="container product-detail mb-5">
            <div class="row mx-5">
                <div class="col product-detail-img">
                    <img src="${product.imgPath}" alt="">
                </div>

                <c:if test="${requestScope.product != null}">
                    <div class="col">
                        <div class="title mb-3">${product.productName}</div>
                        <div class="description mb-5">
                            ${product.description}
                        </div>

                        <div class="d-flex group-price mb-5">
                            <div class="bricked-price">$${product.price}</div>
                            <div class="price">$${Math.round(product.price) - 0.45}</div>
                        </div>

                        <form action="MainController" method="get">
                            <div class="d-flex align-items-center mb-3">
                                <div class="group-quantity">
                                    <a role="button" class="quantity-button"
                                       onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                        <i class="fas fa-minus"></i>
                                    </a>
                                    <input class="quantity fw-bold text-black" min="0" name="quantity" value="1" max="${product.stockQuantity}" type="number">
                                    <a role="button" class="quantity-button"
                                       onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                        <i class="fas fa-plus"></i>
                                    </a> 
                                </div>

                                <div class="notification">
                                    <p>Only <span>${product.stockQuantity}</span> items left!</p>
                                </div>
                            </div>
                            <div class="cart-btn">
                                <input type="hidden" name="pid" value="${product.productID}"/>
                                <input type="hidden" name="cid" value="${requestScope.cateID}"/>
                                <button class="btn btn-primary mt-3 px-3 py-2 fw-bold" name="action" value="addToCart" type="submit">Add To Cart</button>
                            </div>
                        </form>
                    </div>
                </c:if>

            </div>
        </div>


        <!-- RELATED PRODUCT -->
        <div class="container-fluid related-product">
            <div class="title text-center my-5">Related Products</div>
            <div class="item-list mx-5">
                <div class="row row-cols-md-5">

                    <c:forEach var="proCate" items="${requestScope.list}" begin="0" end="4">
                        <div class="col">
                            <div class="item mb-4 text-center">
                                <div class="card border-0 shadow align-items-center">
                                    <img src="${proCate.imgPath}" class="card-img-top" alt="">
                                    <div class="card-body">
                                        <h5 class="card-title mb-3 fw-bold"><a href="MainController?action=viewProduct&pid=${proCate.productID}&cateID=${proCate.cateID}">${proCate.productName}</a></h5>
                                        <span class="bricked-price mx-2">$${proCate.price}</span>
                                        <span class="price fw-bold mx-2">$${Math.round(proCate.price) -0.45}</span></br>
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
        <button type="button" class="btn btn-danger btn-floating btn-lg buttonbtt" id="btn-back-to-top" >
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
                    toastr.success("${requestScope.noti}");
                });
            </script>
            <c:set scope="request" var="noti" value="${null}"/>
        </c:if>


        <script src="js/backToTop.js"></script>
        <script>
                if (window.history.replaceState) {
                    window.history.replaceState(null, null, "MainController?action=viewProduct&pid=${product.productID}&cateID=${product.cateID}");
                }
        </script>
    </body>

</html>
