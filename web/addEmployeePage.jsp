
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

            <div class="row align-items-center">
                <!-- menu -->
                <div class="col-2 menu">
                    <ul>
                        <li class="row">
                            <i class="fa-solid fa-user mx-3 col-2"></i>
                            <a href="" class="col-2">User</a>
                        </li>


                        <li class="row ">
                            <i class="col-2 mx-3"></i>
                            <a href="MainController?action=viewCustomers" class="col-2">Customer</a>
                        </li>

                        <li class="row active">
                            <i class="col-2 mx-3"></i>
                            <a href="MainController?action=viewSales" class="col-2">Sale</a>
                        </li>

                        <li class="row">
                            <i class="col-2 mx-3"></i>
                            <a href="MainController?action=viewGuards" class="col-2">Guard</a>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-bars-staggered mx-3 col-2"></i>
                            <a href="" class="col-2 ms-1 d-none d-sm-inline">Category</a>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-box mx-3 col-2"></i>
                            <a href="" class="col-2">Product</a>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-tag mx-3 col-2"></i>
                            <a href="" class="col-2">Voucher</a>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-clipboard-user mx-3 col-2"></i>
                            <a href="" class="col-2">Attendance</a>
                        </li>

                        <li class="row">
                            <i class="fa-solid fa-cart-shopping mx-3 col-2"></i>
                            <a href="" class="col-2">Order</a>
                        </li>
                    </ul>
                </div>

                <c:choose>
                    <c:when test="${requestScope.roleID == 2}">
                        <div class="col" style="overflow: hidden">
                            <form action="MainController" method="post">
                                <div class="col d-flex">
                                    <div class="col-5 cus-info">
                                        <div class="form">
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
                                    <div class="col-4 update-cus">
                                        <div class="form">
                                            <div class="my-5 d-flex align-items-center justify-content-center">
                                                <div class="col-3">
                                                    <label for="">Role</label>
                                                </div>
                                                <div class="col-9">
                                                    <input type="text" disabled placeholder="Guard">
                                                </div>
                                            </div>
                                            <div class="order my-5 d-flex align-items-center justify-content-center">
                                                <div class="col-3">
                                                    <label for="">Schedule</label>
                                                </div>
                                                <div class="col-9 mx-3" style="width:200px ">
                                                    <select class="form-select" aria-label="Default select example" name="wid">
                                                        <c:forEach var="worksheet" items="${WorksheetDAO.getAllWorksheets()}">
                                                            <option value="${worksheet.worksheetID}">${worksheet.worksheetName}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                            </div>  

                                            <div class="status my-5 d-flex align-items-center">
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
                                    <input type="hidden"  value="2" name="roleid"/>
                                    <button id="addBtn" name="action" value="addEmployee">Add</button>
                                </div>
                            </form>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col" style="overflow: hidden">
                            <form action="MainController" method="post">
                                <div class="col d-flex">
                                    <div class="col-5 cus-info">
                                        <div class="form">
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
                                    <div class="col-4 update-cus">
                                        <div class="form">
                                            <div class="my-5 d-flex align-items-center justify-content-center">
                                                <div class="col-3">
                                                    <label for="">Role</label>
                                                </div>
                                                <div class="col-9">
                                                    <input type="text" disabled placeholder="Sale">
                                                </div>
                                            </div>
                                            <div class="order my-5 d-flex align-items-center justify-content-center">
                                                <div class="col-3">
                                                    <label for="">Schedule</label>
                                                </div>
                                                <div class="col-6 mx-3" style="width:200px ">
                                                    <select class="form-select" aria-label="Default select example" name="wid">
                                                        <c:forEach var="worksheet" items="${WorksheetDAO.getAllWorksheets()}">
                                                            <option value="${worksheet.worksheetID}">${worksheet.worksheetName}</option>
                                                        </c:forEach>

                                                    </select>
                                                </div>
                                            </div>  

                                            <div class="status my-5 d-flex align-items-center">
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
                                    <input type="hidden"  value="1" name="roleid"/>
                                    <button id="addBtn" name="action" value="addEmployee">Add</button>
                                </div>
                            </form>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <!-- FOOTER -->
        <footer>
            <c:import url="footer.jsp" />
        </footer>

    </body>
</html>