
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
            <div class="row align-items-center">

                <!-- menu -->
                <div class="col-2 menu">
                    <ul>
                        <li class="row">
                            <i class="fa-solid fa-user mx-3 col-2"></i>
                            <a href="" class="col-2">User</a>
                        </li>

                        <!-- class="collapse"-->

                        <li class="row active">
                            <i class="col-2 mx-3"></i>
                            <a href="" class="col-2">Customer</a>
                        </li>

                        <li class="row">
                            <i class="col-2 mx-3"></i>
                            <a href="" class="col-2">Sale</a>
                        </li>

                        <li class="row">
                            <i class="col-2 mx-3"></i>
                            <a href="" class="col-2">Guard</a>
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


                <!-- info -->
                <div class="col-lg-4 cus-info">
                    <form action="">
                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">ID</label>
                            </div>
                            <div class="col-9">
                                <input type="text" id="id" value="${requestScope.cus.userID}" disabled="">
                            </div>
                        </div>

                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Name</label>
                            </div>
                            <div class="col-9">
                                <input type="text" id="name" value="${requestScope.cus.name}" disabled="">
                            </div>
                        </div>

                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Phone</label>
                            </div>
                            <div class="col-9">
                                <input type="tel" id="phone" value="${requestScope.cus.phone}" disabled="">
                            </div>
                        </div>

                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Address</label>
                            </div>
                            <div class="col-9">
                                <input type="text" id="phone" value="${requestScope.cus.address}" disabled="">
                            </div>
                        </div>


                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Email</label>
                            </div>
                            <div class="col-9">
                                <input type="text" id="email" value="${requestScope.cus.email}" disabled="">
                            </div>
                        </div>
                    </form>
                </div>



                <!-- update status -->
                <div class="col update-cus">
                    <form>
                        <div class="my-5 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Role</label>
                            </div>
                            <div class="col-9">
                                <input type="text" id="email" disabled placeholder="Customer">
                            </div>
                        </div>   

                        <div class="order my-5 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Order</label>
                            </div>
                            <div class="col-9">
                                <a role="button">Customer's Orders</a>
                            </div>
                        </div>  

                        <div class="status my-5 d-flex align-items-center">
                            <div class="col-3">
                                <label for="">Status</label>
                            </div>
                            <div class="col status-btn">
                                <a role="button" id="active" style="background-color: #1B9C85">Active</a>
                                <a role="button" id="inactive" style="background-color: #F6F5DB">Inactive</a>
                                <input type="hidden" id="s" name="status" value="1"/>                               
                            </div>
                        </div>

                    </form>


                </div> 


            </div>

        </div>


        <script>
            var activeBtn = document.querySelector("#active");
            var inactiveBtn = document.querySelector("#inactive");

            activeBtn.addEventListener("click", function () {
                var status = document.getElementById("s");
                activeBtn.style.backgroundColor = "#1B9C85";
                inactiveBtn.style.backgroundColor = "#F6F5DB";
                status.value = "1";
                console.log(status.value);
            });
            inactiveBtn.addEventListener("click", function () {
                var status = document.getElementById("s");
                activeBtn.style.backgroundColor = "#F6F5DB";
                inactiveBtn.style.backgroundColor = "#FF5B5B";
                status.value = 0;
                console.log(status.value);
            });
        </script>
    </body>
</html>