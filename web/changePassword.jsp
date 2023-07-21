

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/customerProfile.css">
        <link rel="icon" type="image/x-icon" href="./image/favicon-32x32.png">
        <!-- Icon CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- font Inter -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;800&display=swap" rel="stylesheet" />

        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>

    <body>
        <c:choose>
            <c:when test="${sessionScope.customer == null}">
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <c:set var="customer" value="${sessionScope.customer}" />

                <!--HEADER-->
                <header>
                    <c:import url="header.jsp" />
                </header>

                <div class="container-fluid">
                    <div class="row">

                        <!-- left side: Menu -->
                        <div class="col-3 menu">
                            <div class="title text-center">My Account</div>
                            <div class="sub-menu text-center">
                                <div class="item">
                                    <a class="item"
                                       href="customerProfile.jsp?id=${sessionScope.customer.userID}">Overview</a>
                                </div>
                                <div class="item fw-bold">
                                    <a class="item" href="changePassword.jsp?id=${sessionScope.customer.userID}">Change
                                        Password</a>
                                </div>
                                <div class="item">
                                    <a class="item" href="MainController?action=viewMyOrders">My Orders</a>
                                </div>
                            </div>
                        </div> 

                        <!-- right side: User information -->
                        <div class="col-8 form-container">
                            <form action="MainController" method="post">
                                <input type="hidden" value="${sessionScope.customer.userID}" name="userid">
                                <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                    <div class="col-4 my-3">
                                        <label for="">Current Password</label>
                                    </div>
                                    <div class="col-8">
                                        <input type="password" id="currentPwd" name="currentpw" required="">
                                    </div>
                                </div>

                                <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                    <div class="col-4 my-3">
                                        <label for="">New Password</label>
                                    </div>
                                    <div class="col-8">
                                        <input type="password" id="newPwd" name="newpw" required="">
                                    </div>
                                </div>

                                <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                    <div class="col-4 my-3">
                                        <label for="">Confirm Password</label>
                                    </div>
                                    <div class="col-8">
                                        <input type="password" id="newPwd" name="confirmpw" required="">
                                    </div>
                                </div>

                                <div class="save-btn d-flex justify-content-center">
                                    <button type="submit" class="btn btn-primary mt-3 px-3 py-2 mx-3 fw-bold" name="action" value="changePassword">Save Changes</button>
                                    <a role="button" value="Reset" href="customerProfile.jsp?&id=${sessionScope.customer.userID}" class="btn btn-primary mt-3 px-3 py-2  fw-bold">Cancel</a>
                                </div>
                            </form>


                            <c:if test="${requestScope.error != null}">
                                <div class="alert alert-danger alert-dismissible fade show notification" role="alert" style="padding: 15px 45px;text-align: center;width:430px;opacity: 100%;margin: 30px auto">
                                    <strong class="error">${requestScope.error}</strong> 
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="width:20px"></button>
                                </div>
                            </c:if> 
                            <c:if test="${requestScope.noti != null}">
                                <div class="alert alert-success alert-dismissible fade show notification" role="alert" style="padding: 15px 45px;text-align: center;width:430px;opacity: 100%;margin: 30px auto">
                                    <strong class="error">${requestScope.noti}</strong> 
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="width:20px"></button>
                                </div>
                            </c:if>    
                        </div>
                    </div>

                </div>

                <!-- FOOTER -->
                <footer>
                    <c:import url="footer_loginedCustomer.jsp" />
                </footer>
            </c:otherwise>
        </c:choose>
    </body>
</html>
