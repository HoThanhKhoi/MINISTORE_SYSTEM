
<%-- 
    Document   : register
    Created on : May 22, 2023, 5:29:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/login.css" />
        <script src="js/toastify.min.js"></script>
        <link rel="stylesheet" href="js/toastify.min.css">

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
        <div class="container-fluid">
            <div class="row">
                <!-- part 1 -->
                <div class="col right-side">
                    <div class="login-container">
                        <div class="login-header">
                            <h3>Register</h3>
                            <p>Let's get things started!</p>
                        </div>
                        <c:if test="${requestScope.error != null}">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert" style=" padding-top:15px;width:430px;padding-right:45px; margin: 0">
                                <strong class="error" style="font-size: 15px">${error}!</strong> 
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="width:20px"></button>
                            </div>
                        </c:if> 
                        <form action="RegisterServlet" method="post">

                            <div class="mb-2 mt-3">
                                <input type="text" id="name" placeholder="Name" name="userName" value="${param.userName}" required="">
                            </div>
                            <div class="mb-2 mt-3">
                                <input type="text" id="email" placeholder="Email" name="userEmail" value="${param.userEmail}" required="">
                            </div>
                            <div class="mb-2 mt-3">
                                <input type="text" id="phone" placeholder="Phone" name="phone" value="${param.phone}" required="">
                            </div>
                            <div class="mb-2 mt-3">
                                <input type="password"  id="pwd" placeholder="Password" name="password" value="${param.password}" required="">
                            </div>
                            <div class="mb-2 mt-3">
                                <input type="password"  id="confirmPwd" placeholder="Confirm password" name="cfpassword" value="${param.cfpassword}" required="">
                            </div>
                            <div class="button">
                                <button type="submit" class="btn">Register</button>
                            </div>
                        </form>
                        <div class="login-footer">
                            Already have an account? <a href="login.jsp">Login</a>
                        </div>

                    </div>
                </div>

                <!-- part 2 -->
                <div class="col left-side">
                    <img src="./image/image 8.png" alt="" />
                    <div class="overlay"></div>
                    <div class="left-side-title">
                        <h1>MINISTORE</h1>
                        <p>
                            SHOP <i><u>EVERYTHING</u></i> WITH YOUR FINGERTIPS!
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
