<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="./css/login.css" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <c:set var="cookie" value="${pageContext.request.cookies}"/>
        <div class="container-fluid">
            <div class="row">
                <!-- part 1 -->
<<<<<<<< HEAD:web/login.jsp
========
                <div class="col right-side">
                    <div class="login-container">
                        <div class="login-header">
                            <h3>Register</h3>
                            <p>Let's get things started!</p>
                        </div>
                        <c:if test="${requestScope.error != null}">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert" style="padding-bottom:10px; padding-top:15px;width:430px;padding-right:45px;">
                                <strong class="error">${error} !</strong> 
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="width:20px"></button>
                            </div>
                        </c:if> 
                        <form action="RegisterServlet" method="post">

                            <div class="mb-2 mt-3">
                                <input type="text" id="name" placeholder="Enter name" name="userName" value="${param.userName}" required="">
                            </div>
                            <div class="mb-2 mt-3">
                                <input type="text" id="email" placeholder="Enter email" name="userEmail" value="${param.userEmail}" required="">
                            </div>
                            <div class="mb-2 mt-3">
                                <input type="text" id="phone" placeholder="Enter phone" name="phone" value="${param.phone}" required="">
                            </div>
                            <div class="mb-2 mt-3">
                                <input type="password"  id="pwd" placeholder="Enter password" name="password" value="${param.password}" required="">
                            </div>
                            <div class="mb-2 mt-3">
                                <input type="password"  id="confirmPwd" placeholder="Enter confirm password" name="cfpassword" value="${param.cfpassword}" required="">
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
>>>>>>>> origin/Bao:web/register.jsp
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
<<<<<<<< HEAD:web/login.jsp
========
            </div>
        </div>
    </body>
>>>>>>>> origin/Bao:web/register.jsp

                <!-- part 2 -->
                <div class="col right-side">
                    <div class="login-container">
                        <div class="login-header">
                            <h3 class="mt-3">Login</h3>
                        </div>
                        <c:if test="${requestScope.error != null}">
                            <div class="alert alert-warning alert-dismissible fade show" role="alert" style="padding-bottom:10px; padding-top:15px;width:430px;padding-right:45px;">
                                <strong class="error">${error} !</strong> 
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="width:20px"></button>
                            </div>
                        </c:if> 
                        <form action="MainController" method="post">
                            <div class="mb-5 mt-3">
                                <input type="email" id="email" placeholder="Email" name="email" value="${cookie.cemail.value}">
                            </div>
                            <div class="mb-5">
                                <input type="password"  id="pwd" placeholder="Password" name="password" value="${cookie.cpass.value}">
                            </div>
                            <div class="form-check mb-3">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" ${(cookie.crem != null?'checked':'')} name="remember" value="1"> Remember me
                                </label>

                                <a class="item" href="EnterEmail.jsp">Forgot Password</a>

                            </div>
                            <div class="button">
                                <button type="submit" class="btn" value="login" name="action">Login</button>
                            </div>
                                
                        </form>
                        <div class="login-footer">
                            Don't have an account? <a href="MainController?action=register">Register</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>        
    </body>
</html>
