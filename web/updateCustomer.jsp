<%-- 
    Document   : updateGuard
    Created on : Jun 6, 2023, 6:49:56 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <h1>Customer Details</h1>
        <form action="MainController" method="post">
            <input type="hidden" name="userid" value="${requestScope.cus.userID}"/>
            <input type="hidden" name="roleid" value="${requestScope.cus.role}"/>
            <p>${requestScope.cus.name}</p><input type="hidden" name="username" value="${requestScope.cus.name}"/>
            <p>${requestScope.cus.phone}</p><input type="hidden" name="phone" value="${requestScope.cus.phone}"/>
            <p>${requestScope.cus.address}</p>
            <p>${requestScope.cus.email}</p>
            <br>    
            <a role="button" id="active" style="background-color: #1B9C85">Active</a>
            <a role="button" id="inactive" style="background-color: #F6F5DB">Inactive</a>
            <input type="hidden" id="s" name="status" value="1"/>
            <button name="action" type="submit" value="updateUser">Update</button>
        </form>
    </body>
</html>

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
        inactiveBtn.style.backgroundColor = "red";
        status.value = 0;
        console.log(status.value);
    });
</script>