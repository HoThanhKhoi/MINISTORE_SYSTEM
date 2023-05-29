
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/customerProfile.css">



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

                <div class="container-fluid">
                    <div class="row">

                        <!-- left side: Menu -->
                        <div class="col-3 menu">
                            <div class="title text-center">My Account</div>
                            <div class="sub-menu text-center">
                                <div class="item">
                                    <a class="item fw-bold" href="customerProfile.jsp?id=${sessionScope.customer.userID}">Overview</a>
                                </div>
                                <div class="item">
                                    <a class="item" href="changePassword.jsp?id=${sessionScope.customer.userID}">Change Password</a>
                                </div>
                            </div>
                        </div>

                        <!-- right side: User information -->
                        <div class="col-8 form-container">
                            <form action="MainController" method="post">
                                <input type="hidden" name="userID" value="${sessionScope.customer.userID}">
                                <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                    <div class="col-1 mx-5">
                                        <label for="">Name</label>
                                    </div>
                                    <div class="col-11">
                                        <input type="name" id="name"  >
                                    </div>
                                </div>

                                <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                    <div class="col-1 mx-5">
                                        <label for="">Email</label>
                                    </div>
                                    <div class="col-11">
                                        <input type="email" id="email" >
                                    </div>
                                </div>
                                <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                    <div class="col-1 mx-5">
                                        <label for="">Phone</label>
                                    </div>
                                    <div class="col-11">
                                        <input type="phone" id="phone" >
                                    </div>
                                </div>
                                <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                    <div class="col-1 mx-5">
                                        <label for="">Address</label>
                                    </div>
                                    <div class="col-11">
                                        <input type="password" id="pwd" >
                                    </div>
                                </div>

                                <div class="save-btn d-flex justify-content-center">
                                    <button type="submit" class="btn btn-primary mt-3 px-3 py-2 mx-3 fw-bold">Save Changes</button>
                                    <button type="reset" class="btn btn-primary mt-3 px-3 py-2  fw-bold">Cancel</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </body>

        </html>