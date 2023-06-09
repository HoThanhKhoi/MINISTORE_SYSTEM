<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/viewCart.css">

        <!-- Icon CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />


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
        <header>
            <c:choose>
                <c:when test="${sessionScope.customer == null}">
                    <c:import url="header_unlogined.jsp" />
                </c:when>
                <c:otherwise>
                    <c:import url="header_cart.jsp" />
                </c:otherwise>
            </c:choose>
        </header>

        <c:choose>
            <c:when test="${sessionScope.cart == null}">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 empty-content">
                            <div class="mb-4">
                                <img src="./image/Icon_1.png" class="card-img-top" alt="" style="width: 250px;">
                            </div>
                            <div class="mb-2">
                                <h4>Hey, The cart feels light!</h4>
                            </div>
                            <div class="mb-4">
                                <p>Explore products and add your favorite items</p>
                            </div>
                            <div>
                                <a role="button" href="homePage.jsp" class="button check">Explore more
                                    <i class="fa-solid fa-angles-right"></i>   
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <!-- HEADER PATH -->
                <nav class="navbar navbar-expand-lg header-path mt-3 ">
                    <div class="container justify-content-start">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="homePage.jsp">Home</a>
                                </li>
                                <li class="breadcrumb-item active">
                                    <a href="#">Your Cart</a>
                                </li>
                            </ol>
                        </nav>
                    </div>
                </nav>


                <!-- Cart Table-->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="cart-table ">
                                <table class="table-fixed text-center">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th class="cart-img">Product</th>
                                            <th></th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Total</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>


                                    <tbody>
                                    <form action="MainController" method="get"> 
                                        <tr>
                                            <td>
                                                <input type="checkbox" class="text-center">
                                            </td>

                                            <td class="cart-item-img">
                                                <img src="./image/Item.png" alt="">
                                            </td>

                                            <td class="cart-item-title">
                                                <h5>Tomato</h5>
                                            </td>

                                            <td class="cart-price">$2</td>

                                            <td class="cart-quantity">
                                                <div class="group-quantity">
                                                    <button class=""
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                    <input class="quantity fw-bold text-black" min="0" name="quantity" value="1"
                                                           type="number">
                                                    <button class=""
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                        <i class="fas fa-plus"></i>
                                                    </button>
                                                </div>
                                            </td>

                                            <td class="cart-total">$10</td>

                                            <td class="cart-item-btn">
                                                <a class="button" href="">Update</a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <input type="checkbox" class="text-center">
                                            </td>

                                            <td class="cart-item-img">
                                                <img src="./image/Item.png" alt="">
                                            </td>

                                            <td class="cart-item-title">
                                                <h5>Tomato</h5>
                                            </td>

                                            <td class="cart-price">$2</td>

                                            <td class="cart-quantity">
                                                <div class="group-quantity">
                                                    <button class=""
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                    <input class="quantity fw-bold text-black" min="0" name="quantity" value="1"
                                                           type="number">
                                                    <button class=""
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                        <i class="fas fa-plus"></i>
                                                    </button>
                                                </div>
                                            </td>

                                            <td class="cart-total">$10</td>

                                            <td class="cart-item-btn">
                                                <a class="button" href="">Update</a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <input type="checkbox" class="text-center">
                                            </td>

                                            <td class="cart-item-img">
                                                <img src="./image/Item.png" alt="">
                                            </td>

                                            <td class="cart-item-title">
                                                <h5>Tomato</h5>
                                            </td>

                                            <td class="cart-price">$2</td>

                                            <td class="cart-quantity">
                                                <div class="group-quantity">
                                                    <button class=""
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                    <input class="quantity fw-bold text-black" min="0" name="quantity" value="1"
                                                           type="number">
                                                    <button class=""
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                        <i class="fas fa-plus"></i>
                                                    </button>
                                                </div>
                                            </td>

                                            <td class="cart-total">$10</td>

                                            <td class="cart-item-btn">
                                                <a class="button" href="">Update</a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <input type="checkbox" class="text-center">
                                            </td>

                                            <td class="cart-item-img">
                                                <img src="./image/Item.png" alt="">
                                            </td>

                                            <td class="cart-item-title">
                                                <h5>Tomato</h5>
                                            </td>

                                            <td class="cart-price">$2</td>

                                            <td class="cart-quantity">
                                                <div class="group-quantity">
                                                    <button class=""
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                    <input class="quantity fw-bold text-black" min="0" name="quantity" value="1"
                                                           type="number">
                                                    <button class=""
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                        <i class="fas fa-plus"></i>
                                                    </button>
                                                </div>
                                            </td>

                                            <td class="cart-total">$10</td>

                                            <td class="cart-item-btn">
                                                <a class="button" href="">Update</a>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <input type="checkbox" class="text-center">
                                            </td>

                                            <td class="cart-item-img">
                                                <img src="./image/Item.png" alt="">
                                            </td>

                                            <td class="cart-item-title">
                                                <h5>Tomato</h5>
                                            </td>

                                            <td class="cart-price">$2</td>

                                            <td class="cart-quantity">
                                                <div class="group-quantity">
                                                    <button class=""
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                        <i class="fas fa-minus"></i>
                                                    </button>
                                                    <input class="quantity fw-bold text-black" min="0" name="quantity" value="1"
                                                           type="number">
                                                    <button class=""
                                                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                        <i class="fas fa-plus"></i>
                                                    </button>
                                                </div>
                                            </td>

                                            <td class="cart-total">$10</td>

                                            <td class="cart-item-btn">
                                                <a class="button" href="">Update</a>
                                            </td>
                                        </tr>
                                    </form>
                                    </tbody>
                                </table>


                                <div class="table-footer d-flex justify-content-between mt-4 align-items-center">
                                    <div class="voucher">
                                        <button class="button del">Delete</button>
                                    </div>

                                    <div class="d-flex justify-content-between mx-5 ">
                                        <div class="voucher d-flex justify-content-between ">
                                            <select class="form-select" aria-label="Default select example">
                                                <option selected>Voucher</option>
                                                <option value="1">One</option>
                                                <option value="2">Two</option>
                                                <option value="3">Three</option>
                                            </select>
                                            <button class="button apply mx-2" type="submit" name="action" value="applyVoucher">Apply</button>
                                        </div>

                                        <div class="total">
                                            <p>Total <span>$10</span></p>
                                        </div>                            
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="container mt-4">
                    <div class="col-lg-12 d-flex justify-content-end">
                        <a role="button" class="button check">Next
                            <i class="fa-solid fa-angles-right"></i>   
                        </a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </body>
</html>