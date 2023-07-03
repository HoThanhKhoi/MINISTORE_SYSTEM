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
                    <div class="dashboard">
                        <form action="AddNewProductServlet" method="post" enctype="multipart/form-data">
                            <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                <div class="col-3">
                                    <label for="">Name</label>
                                </div>
                                <div class="col-9">
                                    <input name="pName" type="text" id="name" value="">
                                </div>
                            </div>

                            <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                <div class="col-3">
                                    <label for="">Description</label>
                                </div>
                                <div class="col-9">
                                    <input name="pDes" type="text" id="phone" value="">
                                </div>
                            </div>

                            <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                <div class="col-3">
                                    <label for="">Price</label>
                                </div>
                                <div class="col-9">
                                    <input name="pPrice" type="text" id="phone" value="">
                                </div>
                            </div>


                            <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                <div class="col-3">
                                    <label for="">Stock Quantity</label>
                                </div>
                                <div class="col-9">
                                    <input name="pStock" type="text" id="email" value="">
                                </div>
                            </div> 
                            <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                <div class="col-3">
                                    <label for="">Category</label>
                                </div>
                                <div class="col">
                                    <select class="form-select" aria-label="Default select example" name="cateid">
                                        <c:forEach var="cate" items="${CategoryDAO.getCategories()}">
                                            <option value="${cate.cateID}">${cate.cateName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div> 
                            <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                <div class="col-3">
                                    <label for="">Image</label>
                                </div>
                                <div class="col-9">
                                    <input type="file" name="file" size="60" />
                                </div>
                                
                            </div>
                            <div class="d-flex justify-content-center">
                                <input type="submit" class="button" value="add"/>Add
                            </div>
                        </form>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </body>
</html>
