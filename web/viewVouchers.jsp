<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                <jsp:forward page="login.jsp" />
            </c:when>
            <c:otherwise>

                <!--HEADER-->
                <header>
                    <c:import url="header_managerDashboard.jsp" />
                </header>

                <div class="container-fluid">
                    <div class="row">

                        <!-- menu -->
                        <div class="col-2 menu">
                            <ul>
                                <li class="row">
                                    <i class="fa-solid fa-user mx-3 col-2"></i>
                                    <a href="" class="col-2">User</a>
                                </li>

                                <!-- class="collapse"-->

                                <li class="row ">
                                    <i class="col-2 mx-3"></i>
                                    <a href="viewCustomers.jsp" class="col-2">Customer</a>
                                </li>
                                <li class="row">
                                    <i class="col-2 mx-3"></i>
                                    <a href="" class="col-2">Sale</a>
                                </li>

                                <li class="row">
                                    <i class="col-2 mx-3"></i>
                                    <a href="" class="col-2">Guard</a>
                                </li>

                                <li class="row active">
                                    <i class="fa-solid fa-bars-staggered mx-3 col-2"></i>
                                    <a href="" class="col-2">Category</a>
                                </li>

                                <li class="row">
                                    <i class="fa-solid fa-box mx-3 col-2"></i>
                                    <a href="" class="col-2">Product</a>
                                </li>

                                <li class="row">
                                    <i class="fa-solid fa-tag mx-3 col-2"></i>
                                    <a href="MainController?action=viewVouchers" class="col-2">Voucher</a>
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


                        <!-- table -->
                        <div class="col dashboard">

                            <a href="MainController?action=viewVouchers">All</a>
                            <a href="MainController?action=viewUnexpiredVouchers">Unexpired</a>
                            <a href="MainController?action=viewExpiredVouchers">Expired</a>
                            <a role="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addModal">Add</a>


                            <c:choose>
                                <c:when test="${requestScope.error != null}">
                                    <h1>${requestScope.error}</h1>
                                </c:when>
                                <c:otherwise>
                                    <table class="table mt-5 text-center">
                                        <thead>
                                            <tr>
                                                <th scope="col">ID</th>
                                                <th scope="col">Voucher Code</th>
                                                <th scope="col">Discount</th>
                                                <th scope="col">Expired Date</th>
                                                <th scope="col">Limit Price</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <c:forEach var="voucher" items="${requestScope.vouchersList}" varStatus="status">
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
                                        </tbody>
                                    </table>
                                </c:otherwise>
                            </c:choose>

                        </div>
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
    </body>
</html>