
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div class="align-items-center">

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
                                    <a class="sub-btn" href="MainController?action=viewVouchers">
                                        <span><i class="fa-solid fa-tag mx-3" ></i></span>
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


                        <!-- dashboard -->
                        <div class="dashboard cus-dashboard">
                            <div class="row align-items-center mx-5">

                                <!-- info -->
                                <div class="col cus-info ">
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
                                <div class="col cus-update">
                                    <form>
                                        <div class="my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Role</label>
                                            </div>
                                            <div class="col-9">
                                                <input type="text" disabled placeholder="Customer">
                                            </div>
                                        </div>   

                                        <div class="order my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Order</label>
                                            </div>
                                            <div class="col-9" >
                                                <a class="text-decoration-none fw-bold" onMouseOver="this.style.color='#1B9C85'" style="color: #000;" role="button" href="MainController?action=viewCustomerOrders&userID=${requestScope.cus.userID}">Customer's Orders</a>
                                            </div>
                                        </div>  

                                        <div class="status my-5 d-flex align-items-center">
                                            <div class="col-3">
                                                <label for="">Status</label>
                                            </div>
                                            <div class="col-9 status-btn">
                                                <c:choose>
                                                    <c:when test="${requestScope.cus.status == 1}">
                                                        <a role="button" id="active" style="background-color: #1B9C85;color:black;text-decoration: none" href="" >Active</a>
                                                        <a role="button" id="inactive" style="background-color: #F6F5DB;color:black;text-decoration: none" href="">Inactive</a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a role="button" id="active" style="background-color: #F6F5DB;color:black;text-decoration: none" href="" >Active</a>
                                                        <a role="button" id="inactive" style="background-color: #FF5B5B;color:black;text-decoration: none" href="">Inactive</a>
                                                    </c:otherwise>    

                                                </c:choose>


                                                <input type="hidden" id="status" name="status" value="1"/>                               
                                            </div>
                                        </div>

                                    </form>
                                </div> 
                            </div>
                        </div>
                    </div>                    
                </div> 
            </c:otherwise>
        </c:choose>


        <script>
            var activeBtn = document.querySelector("#active");
            var inactiveBtn = document.querySelector("#inactive");
            var userID = document.getElementById("id").value;
            var userName = document.getElementById("name").value;
            var phone = document.getElementById("phone").value;
            var roleID = 3;

            activeBtn.addEventListener("click", function () {
                var status = document.getElementById("status");
                activeBtn.style.backgroundColor = "#1B9C85";
                inactiveBtn.style.backgroundColor = "#F6F5DB";
                status.value = "1";
                console.log(status.value);
                activeBtn.href = "MainController?action=updateUser&userid=" + userID + "&username=" + userName + "&phone=" + phone + "&status=" + status.value + "&roleid=" + roleID;
            });

            inactiveBtn.addEventListener("click", function () {
                var status = document.getElementById("status");
                activeBtn.style.backgroundColor = "#F6F5DB";
                inactiveBtn.style.backgroundColor = "#FF5B5B";
                status.value = 0;
                console.log(status.value);
                inactiveBtn.href = "MainController?action=updateUser&userid=" + userID + "&username=" + userName + "&phone=" + phone + "&status=" + status.value + "&roleid=" + roleID;
            });
        </script>



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
                window.history.replaceState(null, null, "MainController?action=viewCustomerDetailsPage&userid=${requestScope.cus.userID}");
            }
        </script>
    </body>
</html>