<%-- 
    Document   : customerProfile
    Created on : May 26, 2023, 9:41:19 PM
    Author     : ACER
--%>
<%@page import="dto.User"%>
<%@page import="dao.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./css/customerProfile.css">

        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.customer == null}">
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <c:set var="customer" value="${sessionScope.customer}"/>
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
                            <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                <div class="col-1 mx-5">
                                    <label for="">Name</label>
                                </div>
                                <div class="col-11">
                                    <input type="name" id="name" value="${sessionScope.customer.name}" disabled>
                                </div>
                            </div>

                            <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                <div class="col-1 mx-5">
                                    <label for="">Email</label>
                                </div>
                                <div class="col-11">
                                    <input type="email" id="email" value="${sessionScope.customer.email}" disabled>
                                </div>
                            </div>
                            <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                <div class="col-1 mx-5">
                                    <label for="">Phone</label>
                                </div>
                                <div class="col-11">
                                    <input type="phone" id="phone" value="${sessionScope.customer.phone}" disabled>
                                </div>
                            </div>
                            <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                <div class="col-1 mx-5">
                                    <label for="">Address</label>
                                </div>
                                <div class="col-11">
                                    <input type="text" id="address" value="${sessionScope.customer.address}" disabled>
                                </div>
                            </div>

                            <div class="edit-btn d-flex justify-content-center">
                                <a role="button" href="editProfile.jsp?&id=${sessionScope.customer.userID}" class="btn btn-primary mt-3 px-3 py-2  fw-bold">Edit</a>
                            </div>

                            <c:if test="${requestScope.noti != null}">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    ${requestScope.noti}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>    
                        </div>
                    </div>
                </div>


            </c:otherwise>
        </c:choose>

    </body>
</html>
