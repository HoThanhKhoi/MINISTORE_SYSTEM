<%-- 
    Document   : viewProductDetail
    Created on : Jun 20, 2023, 1:25:27 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/managerScreen.css" />



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

                <!--HEADER-->
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
                                <a class="sub-btn">
                                    <span><i class="fa-solid fa-cart-shopping mx-3"></i></span>
                                    <span>Order</span>
                                </a>
                            </div>

                        </div>
                    </div>


                    <c:if test="${requestScope.product != null}">
                        <div class="dashboard cus-dashboard">
                            <div class="row align-items-center mx-5">

                                <!--right-->
                                <div class="col mx-5 ">
                                    <form action="MainController">

                                        <div class="title text-center mb-5">
                                            <h5>Product Manager - Update Product</h5>
                                        </div>

                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">ID</label>
                                            </div>
                                            <div class="col-9">
                                                <input name="pid" type="text" id="id" value="${requestScope.product.productID}" disabled="">
                                            </div>
                                        </div>

                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Name</label>
                                            </div>
                                            <div class="col-9">
                                                <input name="pName" type="text" id="name" value="${requestScope.product.productName}">
                                            </div>
                                        </div>

                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Price</label>
                                            </div>
                                            <div class="col-9">
                                                <input name="pPrice" type="text" id="phone" value="${requestScope.product.price}">
                                            </div>
                                        </div>

                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Stock</label>
                                            </div>
                                            <div class="col-9">
                                                <input name="pStock" type="text" id="email" value="${requestScope.product.stockQuantity}">
                                            </div>
                                        </div>

                                        <div class="form-item my-5">
                                            <label class="mb-2" for="exampleFormControlTextarea1" >Description</label>
                                            <textarea name="pDes" type="text" id="phone" value="" class="form-control" id="exampleFormControlTextarea1" rows="4">${requestScope.product.description}</textarea>
                                        </div>             
                                    </form>
                                </div>


                                <!--left-->
                                <div class="col mx-5 cus-update">

                                    <div class="form-item  product">
                                        <div class="mb-2 text-center">
                                            <label for="" >Category</label>
                                        </div>
                                        <select class="form-select" aria-label="Default select example" name="cateid">
                                            <c:set var="cateid" value="${requestScope.product.cateID}"/>
                                            <option value="${cateid}" selected>${CategoryDAO.getCategory(cateid).cateName}</option>
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

                                    <input name="pid" type="hidden" value="${requestScope.product.productID}">
                                    <div class="form-item my-5 d-flex justify-content-center">
                                        <button type="submit" name="action" value="updateProduct" class="button">Update</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </c:if>


                    <!--
                                        <div class="row">
                                            <div class="col-lg-5 product-detail-img">
                                                <img src="$/*{requestScope.product.imgPath}*/" alt="">
                                            </div>
                                        </div>-->

                </div>


                <!-- FOOTER -->
                <footer>
                    <c:import url="footer.jsp" />
                </footer>


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
            </c:otherwise>
        </c:choose>
    </body>
</html>
