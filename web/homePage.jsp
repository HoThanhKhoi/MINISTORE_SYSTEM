

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/homePage.css">
        <link rel="stylesheet" href="./js/backToTop.js">


        <!-- Icon CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />


        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- font Inter -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;800&display=swap" rel="stylesheet" />

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
                    <source
                        src="./image/mixkit-surface-covered-with-many-fruits-and-vegetables-seen-in-detail-10433-medium.mp4"
                        type="video/mp4" />
                </video>

                <div class="overlay"></div>
                <div class="banner-title text-center d-flex align-items-center">
                    <h1>Ministore </br>
                        Shop <em>Everything!</em>
                    </h1>
                </div>

                <form class="banner-search text-center d-flex align-items-center">
                    <input type="text" placeholder="Search product...">
                    <button id="search-button" type="button" class="btn">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
            </div>
        </div>

        <!-- Hot Deal -->
        <div class="container-fluid hot-deal" id="hot-deal">
            <div class= "hot-deal-title" >
                <img src="./image/logo-1_hot-deal.png" alt="">
                <h1 class="pt-5 pb-5 text-center">Hot <u class="fw-bold"><em>deal</em></u> right now!</h1>
                <img src="./image/logo-2_hot-deal.png" alt="">
            </div>

            <div class="item-list mx-5">
                <div class="row mx-5">
                    <div class="owl-carousel owl-theme">

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item.png" class="card-img-top" alt="">
                                <div class="card-body">
                                    <a href="">
                                        <h5 class="card-title fw-bold">Chicken Egg</h5>
                                    </a>
                                    <span class="bricked-price mx-2">$1.36</span>
                                    <span class="price fw-bold mx-2">$1.19</span></br>
                                    <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item.png" class="card-img-top" alt="">
                                <div class="card-body">
                                    <a href="">
                                        <h5 class="card-title fw-bold">Chicken Egg</h5>
                                    </a>
                                    <span class="bricked-price mx-2">$1.36</span>
                                    <span class="price fw-bold mx-2">$1.19</span></br>
                                    <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item.png" class="card-img-top" alt="">
                                <div class="card-body">
                                    <a href="">
                                        <h5 class="card-title fw-bold">Chicken Egg</h5>
                                    </a>
                                    <span class="bricked-price mx-2">$1.36</span>
                                    <span class="price fw-bold mx-2">$1.19</span></br>
                                    <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item.png" class="card-img-top" alt="">
                                <div class="card-body">
                                    <a href="">
                                        <h5 class="card-title fw-bold">Chicken Egg</h5>
                                    </a>
                                    <span class="bricked-price mx-2">$1.36</span>
                                    <span class="price fw-bold mx-2">$1.19</span></br>
                                    <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item.png" class="card-img-top" alt="">
                                <div class="card-body">
                                    <a href="">
                                        <h5 class="card-title fw-bold">Chicken Egg</h5>
                                    </a>
                                    <span class="bricked-price mx-2">$1.36</span>
                                    <span class="price fw-bold mx-2">$1.19</span></br>
                                    <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item.png" class="card-img-top" alt="">
                                <div class="card-body">
                                    <a href="">
                                        <h5 class="card-title fw-bold">Chicken Egg</h5>
                                    </a>
                                    <span class="bricked-price mx-2">$1.36</span>
                                    <span class="price fw-bold mx-2">$1.19</span></br>
                                    <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item.png" class="card-img-top" alt="">
                                <div class="card-body">
                                    <a href="">
                                        <h5 class="card-title fw-bold">Chicken Egg</h5>
                                    </a>
                                    <span class="bricked-price mx-2">$1.36</span>
                                    <span class="price fw-bold mx-2">$1.19</span></br>
                                    <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item.png" class="card-img-top" alt="">
                                <div class="card-body">
                                    <a href="">
                                        <h5 class="card-title fw-bold">Chicken Egg</h5>
                                    </a>
                                    <span class="bricked-price mx-2">$1.36</span>
                                    <span class="price fw-bold mx-2">$1.19</span></br>
                                    <a href="#" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Add To Cart</a>
                                </div>
                            </div>
                        </div>
                        <!-- end item -->

                        <!-- begin item -->
                        <div class="item mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item.png" class="card-img-top" alt="">
                                <div class="card-body">
                                    <a href="">
                                        <h5 class="card-title fw-bold">Chicken Egg</h5>
                                    </a>
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

            <div class="hot-deal-footer">
                <h2 class="py-4 text-center"><em>Deals end in XX:XX</em></h2>
            </div>

            <div class="hot-deal-banner">
                <img src="./image/image 21.png" alt="">
            </div>
        </div>


        <!-- Categories -->
        <div class="container-fluid category" id="category">
            <div class="row pt-5 mx-5">
                <div class="col ad-banner mx-3">
                    <img src="./image/Ad banner 1.png" alt="">
                </div>

                <div class="col row category-list mx-3 d-flex flex-wrap justify-content-between">
                    <div class="col-4 col-sm-4 " style="width: 30%">
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
                        <!-- begin item -->

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

                <div class="row row-cols-md-4 d-flex justify-content-between" style="width: 100%;">

                    <div class="col col-sm-6" style="width: 15rem;">
                        <!-- begin item -->
                        <div class="item item-card mb-4 text-center">
                            <div class="card border-0 shadow">
                                <img src="./image/Item.png" class="card-img-top" alt="">
                                <div class="card-body">
                                    <h5 class="card-title fw-bold">Chicken Egg</h5>
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
                                    <h5 class="card-title fw-bold">Chicken Egg</h5>
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
                                    <h5 class="card-title fw-bold">Chicken Egg</h5>
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
                                    <h5 class="card-title fw-bold">Chicken Egg</h5>
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
                                    <h5 class="card-title fw-bold">Chicken Egg</h5>
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
        <button type="button" class="btn btn-floating btn-lg" id="btn-back-to-top">
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
            });
        </script>




    </body>

</html>
