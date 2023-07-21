<%@page import="dto.Voucher"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/x-icon" href="./image/favicon-32x32.png">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/managerScreen.css" />
        <link rel="stylesheet" href="./css/popupModal.css"/>

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

        <!-- toastr -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
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

                    <!-- menu -->
                    <div class="menu-btn">
                        <input type="checkbox" id="nav-toggle">
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
                                <a  href="MainController?action=viewAllProducts" class="sub-btn ">
                                    <span><i class="fa-solid fa-box mx-3"></i></span>
                                    <span>Product</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn active " href="MainController?action=viewVouchers">
                                    <span><i class="fa-solid fa-tag mx-3"></i></span>
                                    <span>Voucher</span>
                                </a>
                            </div>

                            <div class="item">
                                <a class="sub-btn" href="MainController?action=viewSchedule">
                                    <span><i class="fa-solid fa-clipboard-user mx-3"></i></span>
                                    <span>Schedule</span>
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


                    <!-- table -->
                    <div class="dashboard">
                        <div class=" mt-4 group-form d-flex justify-content-between">
                            <div>
                                <form action="MainController" method="get" class="search text-center d-flex align-items-center">
                                    <input type="text"  placeholder="Search..." name="keyword" value="${param.keyword == null ? "" : param.keyword}">
                                    <button id="search-button" type="submit" class="btn" name="action" value="searchVoucher">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </form>
                            </div>
                            <div class="add">                    
                                <a role="button" class="btn btn_add btn-success" data-bs-toggle="modal" data-bs-target="#addModal">Add</a>
                            </div>
                        </div>

                        <div class="mt-3 myOrder-menu ">
                            <form>
                                <ul id="myDiv">
                                    <li class="btn">
                                        <a href="MainController?action=viewVouchers">All</a>
                                    </li>
                                    <li class="btn">
                                        <a href="MainController?action=viewUnexpiredVouchers">Unexpired</a>
                                    </li>
                                    <li class="btn">
                                        <a href="MainController?action=viewExpiredVouchers">Expired</a>
                                    </li>
                                </ul>
                            </form>
                        </div>

                        <c:choose>
                            <c:when test="${requestScope.error != null}">
                                <div class="alert alert-danger alert-dismissible fade show notification" role="alert" style="padding: 15px 45px;text-align: center;width:430px;opacity: 100%;margin: 20px auto 0;">
                                    <strong class="error">${requestScope.error}</strong>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <table class="table text-center">
                                    <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Voucher Code</th>
                                            <th scope="col">Discount</th>
                                            <th scope="col">Expired Date</th>
                                            <th scope="col">Limit Price</th>
                                            <th scope="col">Details</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:if test="${requestScope.vlist == null}">
                                            <c:forEach var="voucher" items="${requestScope.vouchersList}" varStatus="status" begin="0" end="5">
                                                <tr>
                                                    <td>${voucher.voucherID}</td>
                                                    <td>${voucher.voucherCode}</td>
                                                    <td>$${voucher.discount}</td>
                                                    <td>${voucher.expiredDate}</td>
                                                    <td>$${voucher.limitPrice}</td>
                                                    <td>
                                                        <a href="" data-bs-toggle="modal" data-bs-target="#myModal${status.index}">
                                                            <i class="update fa-solid fa-pen-to-square mx-2"></i>
                                                        </a>
                                                    </td>
                                                </tr>


                                                <!--/*------------------POP UP SCREEN VOUCHER DETAIL------------------*/-->
                                            <div class="modal" id="myModal${status.index}">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">

                                                        <form action="MainController" method="post">
                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Update Voucher</h4>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                            </div>

                                                            <!-- Modal body -->
                                                            <div class="modal-body">
                                                                <div class="mb-3 mt-3">
                                                                    <label for="vid" class="form-label">ID</label>
                                                                    <input type="text" class="form-control" id="vid" name="voucherID" value="${voucher.voucherID}" readonly="">
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="vcode" class="form-label">Voucher Code</label>
                                                                    <input type="text" class="form-control" id="vcode" name="voucherCode" value="${voucher.voucherCode}">
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="vdiscount" class="form-label">Discount</label>
                                                                    <input type="number" step="0.01" class="form-control" id="vdiscount" name="discount" value="${voucher.discount}">
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="vdate" class="form-label">Expired Date</label>
                                                                    <input type="datetime-local" class="form-control" id="vdate" name="expiredDate" value="${voucher.expiredDate}">
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="vprice" class="form-label">Limit Price</label>
                                                                    <input type="number" step="0.01" class="form-control" id="vprice" name="limitPrice" value="${voucher.limitPrice}">
                                                                </div>
                                                            </div>

                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-success" name="action" value="updateVoucher">Update</button>
                                                            </div>
                                                        </form>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/*--------------------------------------------------------------*/-->
                                        </c:forEach>
                                    </c:if>

                                    <c:if test="${requestScope.vlist != null}">
                                        <c:forEach var="voucher" items="${requestScope.vlist}" varStatus="status">
                                            <tr>
                                                <td>${voucher.voucherID}</td>
                                                <td>${voucher.voucherCode}</td>
                                                <td>$${voucher.discount}</td>
                                                <td>${voucher.expiredDate}</td>
                                                <td>$${voucher.limitPrice}</td>
                                                <td>
                                                    <a href="" data-bs-toggle="modal" data-bs-target="#myModal${status.index}">
                                                        <i class="update fa-solid fa-pen-to-square mx-2"></i>
                                                    </a>
                                                </td>
                                            </tr>


                                            <!--/*------------------POP UP SCREEN VOUCHER DETAIL------------------*/-->
                                            <div class="modal" id="myModal${status.index}">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">

                                                        <form action="MainController" method="post">
                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">Update Voucher</h4>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                            </div>

                                                            <!-- Modal body -->
                                                            <div class="modal-body">
                                                                <div class="mb-3 mt-3">
                                                                    <label for="vid" class="form-label">ID</label>
                                                                    <input type="text" class="form-control" id="vid" name="voucherID" value="${voucher.voucherID}" readonly="">
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="vcode" class="form-label">Voucher Code</label>
                                                                    <input type="text" class="form-control" id="vcode" name="voucherCode" value="${voucher.voucherCode}">
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="vdiscount" class="form-label">Discount</label>
                                                                    <input type="number" step="0.01" class="form-control" id="vdiscount" name="discount" value="${voucher.discount}">
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="vdate" class="form-label">Expired Date</label>
                                                                    <input type="datetime-local" class="form-control" id="vdate" name="expiredDate" value="${voucher.expiredDate}">
                                                                </div>
                                                                <div class="mb-3">
                                                                    <label for="vprice" class="form-label">Limit Price</label>
                                                                    <input type="number" step="0.01" class="form-control" id="vprice" name="limitPrice" value="${voucher.limitPrice}">
                                                                </div>
                                                            </div>

                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="submit" class="btn btn-success" name="action" value="updateVoucher">Update</button>
                                                            </div>
                                                        </form>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/*--------------------------------------------------------------*/-->
                                        </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                            </c:otherwise>
                        </c:choose>

                        <nav aria-label="Page navigation example" style="margin: 10px 0;">
                            <ul class="pagination justify-content-center">
                                <c:if test="${requestScope.page == 1  || requestScope.page== null}">
                                    <li class="page-item">
                                        <a class="page-link" style="padding: 5px 10px !important;color: #1B9C85" href="MainController?action=showVouchersPage&page=1&signal=${requestScope.signal}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${requestScope.page > 1}">
                                    <li class="page-item">
                                        <a class="page-link" style="padding: 5px 10px !important;color: #1B9C85" href="MainController?action=showVouchersPage&page=${requestScope.page-1}&signal=${requestScope.signal}&keyword=${keyword}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                </c:if>

                                <c:set var="voucherList" value="${requestScope.vouchersList}"/>
                                <c:set var="totalVoucher" value="${voucherList.size()}"/>
                                <c:set var="numOfSearchPages" value="${Math.ceil(totalVoucher / 6)}"/>
                                <c:set var="keyword" value="${requestScope.keyword}"/>
                                <fmt:formatNumber value="${numOfSearchPages}" pattern="0" var="intLastPage" />

                                <c:forEach var="i" begin="1" end="${numOfSearchPages}">
                                    <li class="page-item "><a class="page-link " style="padding:5px 10px !important;color: #1B9C85" 
                                                              href="MainController?action=showVouchersPage&page=${i}&signal=${requestScope.signal}&keyword=${keyword}">${i}</a></li>
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test="${intLastPage > 1}">
                                            <c:if test="${requestScope.page <  numOfSearchPages || requestScope.page == null}">
                                            <li class="page-item">
                                                <a class="page-link" style="padding:5px 10px !important;color: #1B9C85" href="MainController?action=showVouchersPage&page=${requestScope.page + 1}&signal=${requestScope.signal}&keyword=${keyword}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>                          
                                        <c:if test="${requestScope.page >=  numOfSearchPages}">
                                            <li class="page-item">
                                                <a class="page-link" style="padding:5px 10px !important;color: #1B9C85" href="MainController?action=showVouchersPage&page=${intLastPage}&signal=${requestScope.signal}&keyword=${keyword}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if> 
                                    </c:when>
                                    <c:when test="${intLastPage <= 1}">
                                        <c:if test="${requestScope.page == 1 || requestScope.page ==null}">
                                            <li class="page-item">
                                                <a class="page-link" style="padding:5px 10px !important;color: #1B9C85" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </c:if>
                                    </c:when>
                                </c:choose>                            


                            </ul>
                        </nav>


                    </div>

                    <!--POP UP SCREEN ADD VOUCHER-->
                    <div class="modal" id="addModal">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <form action="MainController" method="post">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">Add New Voucher</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>

                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label for="vcode" class="form-label">Voucher Code</label>
                                            <input type="text" class="form-control" id="vcode" name="voucherCode" required="">
                                        </div>
                                        <div class="mb-3">
                                            <label for="vdiscount" class="form-label">Discount</label>
                                            <input type="number" step="0.01" class="form-control" id="vdiscount" name="discount" required="">
                                        </div>
                                        <div class="mb-3">
                                            <label for="vdate" class="form-label">Expired Date</label>
                                            <input type="datetime-local" class="form-control" id="vdate" name="expiredDate" required="">
                                        </div>
                                        <div class="mb-3">
                                            <label for="vprice" class="form-label">Limit Price</label>
                                            <input type="number" step="0.01" class="form-control" id="vprice" name="limitPrice" required="">
                                        </div>
                                    </div>

                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success" name="action" value="addVoucher">Add</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                    <!--------------------------------------------------------->
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
                            toastr.success('${requestScope.noti}');
                        });
                    </script>
                </c:if>

                <script>
                    if (window.history.replaceState) {
                        window.history.replaceState(null, null, "MainController?action=viewVouchers");
                    }
                </script>
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
    </body>
</html>