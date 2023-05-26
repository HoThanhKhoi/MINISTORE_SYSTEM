<%-- 
    Document   : login
    Created on : May 25, 2023, 8:08:35 PM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <%
            Cookie arr[] = request.getCookies();
            for (Cookie c : arr) {
                if (c.getName().equals("emailC")) {
                    request.setAttribute("email", c.getValue());
                }

                if (c.getName().equals("passC")) {
                    request.setAttribute("password", c.getValue());
                }
            }
        %>
<!--
        <form action="MainController" method="post">
            <table>
                <tr>
                    <td>Email</td>
                    <td><input type="email" value="${email}" required="" name="email"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" value="${password}" required="" name="password"></td>
                </tr>
            </table>
            <input type="checkbox" name="remember" value="1"> Remember me
            <button type="submit" value="login" name="action">Login</button>
        </form>
-->
        <div class="container-fluid">
            <div class="row">

                <!-- part 1 -->
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

                <!-- part 2 -->
                <div class="col right-side">
                    <div class="login-container">
                        <div class="login-header">
                            <h3 class="mt-3">Login</h3>
                        </div>
                        <form action="MainController" method="post">
                            <div class="mb-5 mt-3">
                                <input type="email" id="email" placeholder="Enter email" name="email" value="${email}">
                            </div>
                            <div class="mb-5">
                                <input type="password"  id="pwd" placeholder="Enter password" name="password" value="${password}">
                            </div>
                            <div class="form-check mb-3">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="checkbox" name="remember" value="1"> Remember me
                                </label>
                            </div>
                            <div class="button">
                                <button type="submit" class="btn" value="login" name="action">Login</button>
                            </div>
                        </form>
                        <div class="login-footer">
                            Don't have an account? <a>Register</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>        
    </body>
</html>
