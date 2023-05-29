<%-- 
    Document   : homePage
    Created on : May 26, 2023, 2:01:20 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${customer.getName()}</h1>
        <a href="customerProfile.jsp?&id=${customer.getUserID()}">Profile</a>
        <form action="MainController" method="post">
            <button type="submit" name="action" value="logout">Logout</button>
        </form>
        <form action="MainController" method="get">
            <input type="text" name="keyword" value="${param.keyword}">
            <button type="submit" name="action" value="searchProduct">Search</button>
        </form>
    </body>
</html>
