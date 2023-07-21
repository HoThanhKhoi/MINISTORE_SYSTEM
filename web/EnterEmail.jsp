<%@page import="dao.UserDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>

        <link rel="stylesheet" href="./css/OTP_verification.css">
        
        <link rel="icon" type="image/x-icon" href="./image/favicon-32x32.png">

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
        <div class="container-fluid height-100 d-flex justify-content-center align-items-center">
            <!-- <div class="position-relative"> -->
            <form action="ResetPassServlet" method="post">
                <div class="card p-2 text-center">
                    <h6>Reset Password</h6>
                    <div class="mt-2 mb-4"> <span>Please enter the email address that you provided when you signed up.</span> </div>
                    <div class="my-4"> 
                        <input type="text" id="email" placeholder="Enter email" name="email">
                    </div>
                    <div class="mt-4 button"> 
                        <button class="btn px-8 validate" type="submit" name="action">Request OTP</button> 
                    </div>
                    <div>
                    <c:if test="${requestScope.error !=null}">
                        <div class="mt-4" style="color: red">${requestScope.error}</div>
                        <div class="mt-4 button"><a style="color: #1B9C85; font-weight: bold;"href="register.jsp">Register</a></div>
                    </c:if>
                    </div>
                </div>
            </form> 
            <!-- </div> -->
        </div>

    </body>

</html>