<%-- 
    Document   : addProduct
    Created on : Jun 29, 2023, 11:44:34 AM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.CategoryDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/managerScreen.css" />
        <link rel="icon" type="image/x-icon" href="./image/favicon-32x32.png">
        <!-- Icon CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />


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
        <c:choose>

            <c:when test="${sessionScope.manager == null}">
                <c:set var="warning" value="You need to log in as Admin to access" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>

                <!-- HEADER -->
                <header>
                    <c:import url="header_managerDashboard.jsp" />
                </header>


                <div class="container-fluid">
                    <div class="menu-btn">
                        <input type="checkbox" id="nav-toggle"/>
                    </div>
                    <div class="side-bar">
                        <div class="menu">
                            <div class="item">
                                <a class="sub-btn">
                                    <i class="fa-solid fa-user mx-3"></i>
                                    User
                                    <i class="fa-solid fa-angle-right dropdown"></i>
                                </a>
                                <div class="sub-menu">
                                    <a href="MainController?action=viewCustomers" class="sub-item">Customers</a>
                                    <a href="MainController?action=viewSales" class="sub-item">Sales</a>
                                    <a href="MainController?action=viewGuards" class="sub-item">Guards</a>
                                </div>
                            </div>

                            <div class="item">
                                <a href="MainController?action=viewAllCategories" class="sub-btn">
                                    <span><i class="fa-solid fa-bars-staggered mx-3"></i></span>
                                    <span>Category</span>
                                </a>
                            </div>

                            <div class="item">
                                <a  href="MainController?action=viewAllProducts" class="sub-btn active">
                                    <span><i class="fa-solid fa-box mx-3"></i></span>
                                    <span>Product</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn" href="MainController?action=viewVouchers">
                                    <span><i class="fa-solid fa-tag mx-3"></i></span>
                                    <span>Voucher</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn">
                                    <span><i class="fa-solid fa-clipboard-user mx-3"></i></span>
                                    <span>Attendance</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn" href="MainController?action=viewAllOrders">
                                    <span><i class="fa-solid fa-cart-shopping mx-3"></i></span>
                                    <span>Order</span>
                                </a>
                            </div>

                        </div>
                    </div>


                    <div class="dashboard cus-dashboard">
                        <form action="AddNewProductServlet" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>

                            <div class="row align-items-center mx-5">

                                <!--right-->
                                <div class="col mx-5 ">

                                    <div class="title text-center mb-5">
                                        <h5>Product Manager - Create New Product</h5>
                                    </div>

                                    <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Name</label>
                                        </div>
                                        <div class="col-9">
                                            <input name="pName" type="text" id="name" value="" id="validationCustom03" required>
                                            <div class="invalid-feedback">
                                                Please provide a valid name.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Price</label>
                                        </div>
                                        <div class="col-9">
                                            <input name="pPrice" type="text" id="phone" value="" id="validationCustom03" required>
                                            <div class="invalid-feedback">
                                                Please provide a valid price.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Stock</label>
                                        </div>
                                        <div class="col-9">
                                            <input name="pStock" type="text" id="email" value="" id="validationCustom03" required>
                                            <div class="invalid-feedback">
                                                Please provide a valid stock.
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-item my-5">
                                        <label class="mb-2" for="exampleFormControlTextarea1" >Description</label>
                                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="4" name="pDes" id="validationCustom03" required></textarea>
                                        <div class="invalid-feedback">
                                            Please provide a valid description.
                                        </div>
                                    </div>
                                </div>


                                <!--left-->
                                <div class="col mx-5 cus-update">

                                    <div class="form-item  product">
                                        <div class="mb-2 text-center">
                                            <label for="" >Category</label>
                                        </div>
                                        <select class="form-select" aria-label="Default select example" name="cateid">
                                            <c:forEach var="cate" items="${CategoryDAO.getCategories()}">
                                                <option value="${cate.cateID}">${cate.cateName}</option>
                                            </c:forEach>
                                        </select>
                                    </div> 

                                    <div class="form-item  product">
                                        <div class="mb-2 text-center">
                                            <label for="">Image</label>
                                        </div>
                                        <div class="mb-2">
                                            <input class="no-border" type="file" name="file" size="60" />
                                        </div>
                                    </div>    

                                    <div class="form-item my-5 d-flex justify-content-center">
                                        <button type="submit" class="button" value="add">Add </button>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>


                </div>
            </c:otherwise>
        </c:choose>



        <script type="text/javascript">
            $(document).ready(function () {
                //jquery for toggle sub menus
                $('.sub-btn').click(function () {
                    $(this).next('.sub-menu').slideToggle();
                    $(this).find('.dropdown').toggleClass('rotate');
                });

                //jquery for expand and collapse the sidebar
                $('.menu-btn').click(function () {
                    $('.side-bar').addClass('active');
                    $('.menu-btn').css("visibility", "hidden");
                });

                $('.close-btn').click(function () {
                    $('.side-bar').removeClass('active');
                    $('.menu-btn').css("visibility", "visible");
                });
            });
        </script>
        <script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, "MainController?action=viewAllProducts");
            }
        </script>
        <script src="./js/validation_input.js"></script>

    </body>
</html>
