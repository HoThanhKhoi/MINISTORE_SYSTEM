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
        <link rel="stylesheet" href="./css/manageProductScreen.css" />
        <link rel="stylesheet" href="./css/productDetail.css" />



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
        <header>
            <c:import url="header_managerDashboard.jsp" />
        </header>

        <div class="container product-detail">
            <div class="row">
                <div class="col-5 product-detail-img">
                    <img src="${requestScope.product.imgPath}" alt="">
                </div>

                <c:if test="${requestScope.product != null}">
                    <div class="col-lg-4 cus-info">
                        <form action="MainController">
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
                                    <label for="">Description</label>
                                </div>
                                <div class="col-9">
                                    <input name="pDes" type="text" id="phone" value="${requestScope.product.description}">
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
                                    <label for="">Stock Quantity</label>
                                </div>
                                <div class="col-9">
                                    <input name="pStock" type="text" id="email" value="${requestScope.product.stockQuantity}">
                                </div>
                            </div> 
                            <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                <div class="col-3">
                                    <label for="">Category</label>
                                </div>
                                <div class="col-9">
                                    <select class="form-select" aria-label="Default select example" name="cateid">
                                        <c:set var="cateid" value="${requestScope.product.cateID}"/>
                                        <option value="${cateid}" selected>${CategoryDAO.getCategory(cateid).cateName}</option>
                                        <c:forEach var="cate" items="${CategoryDAO.getCategories()}">
                                            <option value="${cate.cateID}">${cate.cateName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div> 
                            <input name="pid" type="hidden" value="${requestScope.product.productID}">
                            <button type="submit" name="action" value="updateProduct">Update</button>
                        </form>
                    </div>
                </c:if>

            </div>
        </div>
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
    </body>
</html>
