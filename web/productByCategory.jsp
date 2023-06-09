<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/productInfo.css">

        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- font Inter -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">

        <!-- font icon cdn -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>

    <body>
        <!--HEADER-->
        <header>
            <c:import url="header.jsp" />
        </header>

        <!-- HEADER PATH -->
        <nav class="navbar navbar-expand-lg header-path mb-4">
            <div class="container">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="MainController?action=backToHome">Home</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <a href="#">Fresh Vegetables</a>
                        </li>
                    </ol>
                </nav>
            </div>
        </nav>


        <!-- RELATED PRODUCT -->
        <div class="container related-product my-5">

            <div class="row row-cols-md-4 d-flex justify-content-between" style="width: 100%;">

                <div class="col col-sm-6" style="width: 15rem;">
                    <!-- begin item -->
                    <div class="item item-card mb-4 text-center">
                        <div class="card border-0 shadow">
                            <img src="./image/Item.png" class="card-img-top" alt="">
                            <div class="card-body">
                                <h5 class="card-title mb-3 fw-bold">${product.productName}</h5>
                                <span class="bricked-price mx-2">$${product.price}</span>
                                <span class="price fw-bold mx-2">$1.19</span></br>
                                <button class="btn btn-primary mt-3 px-3 py-2 fw-bold" >Add To Cart</button>
                            </div>
                        </div>
                    </div>
                    <!-- end item -->
                </div>

                <div class="col col-sm-6" style="width: 15rem;">
                    <!-- begin item -->
                    <div class="item item-card mb-4 text-center">
                        <div class="card border-0 shadow">
                            <img src="./image/Item.png" class="card-img-top" alt="">
                            <div class="card-body">
                                <h5 class="card-title mb-3 fw-bold">Chicken Egg</h5>
                                <span class="bricked-price mx-2">$1.36</span>
                                <span class="price fw-bold mx-2">$1.19</span></br>
                                <button class="btn btn-primary mt-3 px-3 py-2 fw-bold" >Add To Cart</button>
                            </div>
                        </div>
                    </div>
                    <!-- end item -->
                </div>

                <div class="col col-sm-6" style="width: 15rem;">
                    <!-- begin item -->
                    <div class="item item-card mb-4 text-center">
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
                    <!-- end item -->
                </div>

                <div class="col col-sm-6" style="width: 15rem;">
                    <!-- begin item -->
                    <div class="item item-card mb-4 text-center">
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
                    <!-- end item -->
                </div>

                <div class="col col-sm-6" style="width: 15rem;">
                    <!-- begin item -->
                    <div class="item item-card mb-4 text-center">
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
                    <!-- end item -->
                </div>

            </div>
        </div>
    </div>

    <!-- back to top -->
    <button type="button" class="btn btn-danger btn-floating btn-lg" id="btn-back-to-top">
        <i class="fas fa-arrow-up"></i>
    </button>

    <script src="./js/backToTop.js"></script>

</body>

</html>