
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.WorksheetDAO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/addEmployeePage.css" />

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

        <!--HEADER-->
        <header>
            <c:import url="header_managerDashboard.jsp" />
        </header>

        <div class="container-fluid">
            <c:if test="${requestScope.error != null}">
                <div class="alert alert-warning alert-dismissible fade show" role="alert" style=" padding-top:15px;width:430px;padding-right:45px; margin: 0;position: absolute;right:0;top:10px">
                    <strong class="error" style="font-size: 15px">${error}!</strong> 
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="width:20px"></button>
                </div>
            </c:if> 


            <!-- menu -->
            <div class="menu-btn">
                <input type="checkbox" id="nav-toggle">
            </div>
            <div class=" side-bar">
                <div class="menu">
                    <div class="item">
                        <a class="sub-btn">
                            <i class="fa-solid fa-user mx-3"></i>
                            User
                            <i class="fa-solid fa-angle-right dropdown"></i>
                        </a>
                        <div class="sub-menu">
                            <a href="MainController?action=viewCustomers" class="sub-item active">Customers</a>
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
                        <a  href="MainController?action=viewAllProducts" class="sub-btn">
                            <span><i class="fa-solid fa-box mx-3"></i></span>
                            <span>Product</span>
                        </a>
                    </div>

                    <div class="item">
                        <a href="MainController?action=viewVouchers" class="sub-btn">
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

            <c:choose>
                <c:when test="${requestScope.roleID == 2}">
                    <div class="dashboard mt-5" style="overflow: hidden">
                        <form action="MainController" method="post">
                            <div class="row align-items-center mx-5">
                                <div class="col-5 cus-info">
                                    <div class="form-item my-5 d-flex align-items-center justify-content-center">

                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Name</label>
                                            </div>
                                            <div class="col-9">
                                                <input name="name" type="text" id="name" value="" required="">
                                            </div>
                                        </div>

                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Phone</label>
                                            </div>
                                            <div class="col-9">
                                                <input name="phone" type="tel" id="phone" value="" required="">
                                            </div>
                                        </div>

                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="" >Address</label>
                                            </div>
                                            <div class="col-9">
                                                <input name="address" type="text" id="phone" value="" >
                                            </div>
                                        </div>


                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Email</label>
                                            </div>
                                            <div class="col-9">
                                                <input name="email" type="text" id="email" value="${requestScope.cus.email}" required="" >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- update status -->
                                <div class="col-5 cus-update">
                                    <div class="form">
                                        <div class="my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Role</label>
                                            </div>
                                            <div class="col-9">
                                                <input type="text" disabled placeholder="Guard">
                                            </div>
                                        </div>
                                        <div class="my-5 d-flex align-items-center">
                                            <div class="col-3">
                                                <label for="">Schedule</label>
                                            </div>
                                            <div class="col-9">
                                                <select class="form-select" aria-label="Default select example" name="wid">
                                                    <c:forEach var="worksheet" items="${WorksheetDAO.getAllWorksheets()}">
                                                        <option value="${worksheet.worksheetID}">${worksheet.worksheetName}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                        </div>  

                                        <div class="status status-add my-5 d-flex align-items-center">
                                            <div class="col-3">
                                                <label for="">Status</label>
                                            </div>
                                            <div class="col-9 status-btn">
                                                <a role="button" id="active" style="background-color: #1B9C85;color:black;text-decoration: none;border-top-right-radius: 30px;
                                                   border-bottom-right-radius: 30px;">Active</a>
                                            </div>
                                        </div>
                                    </div>    
                                </div>
                                <div class="d-flex justify-content-center">
                                    <input type="hidden"  value="1" name="roleid"/>
                                    <button class="add" id="addBtn" name="action" value="addEmployee">Add</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="dashboard cus-dashboard" style="overflow: hidden">
                        <form action="MainController" method="post">
                            <div class="row align-items-center mx-5">
                                <div class="col-5 cus-info">
                                    <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Name</label>
                                        </div>
                                        <div class="col-9">
                                            <input name="name" type="text" id="name" value="" required="">
                                        </div>
                                    </div>

                                    <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Phone</label>
                                        </div>
                                        <div class="col-9">
                                            <input name="phone" type="tel" id="phone" value="" required="">
                                        </div>
                                    </div>

                                    <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="" >Address</label>
                                        </div>
                                        <div class="col-9">
                                            <input name="address" type="text" id="phone" value="" >
                                        </div>
                                    </div>


                                    <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                        <div class="col-3">
                                            <label for="">Email</label>
                                        </div>
                                        <div class="col-9">
                                            <input name="email" type="text" id="email" value="${requestScope.cus.email}" required="" >
                                        </div>
                                    </div>
                                </div>
                                <!-- update status -->
                                <div class="col-5 cus-update">
                                    <div class="form">
                                        <div class="my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Role</label>
                                            </div>
                                            <div class="col-9">
                                                <input type="text" disabled placeholder="Sale">
                                            </div>
                                        </div>
                                        <div class="my-5 d-flex align-items-center">
                                            <div class="col-3">
                                                <label for="">Schedule</label>
                                            </div>
                                            <div class="col-9">
                                                <select class="form-select" aria-label="Default select example" name="wid">
                                                    <c:forEach var="worksheet" items="${WorksheetDAO.getAllWorksheets()}">
                                                        <option value="${worksheet.worksheetID}">${worksheet.worksheetName}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                        </div>  

                                        <div class="status status-add my-5 d-flex align-items-center">
                                            <div class="col-3">
                                                <label for="">Status</label>
                                            </div>
                                            <div class="col status-btn">
                                                <a role="button" id="active" style="background-color: #1B9C85;color:black;text-decoration: none;border-top-right-radius: 30px;
                                                   border-bottom-right-radius: 30px;">Active</a>
                                            </div>
                                        </div>
                                    </div>    
                                </div>
                                <div class="d-flex justify-content-center">
                                    <input type="hidden"  value="1" name="roleid"/>
                                    <button class="add" id="addBtn" name="action" value="addEmployee">Add</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- FOOTER -->
        <footer>
            <c:import url="footer.jsp" />
        </footer>

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

    </body>
</html>