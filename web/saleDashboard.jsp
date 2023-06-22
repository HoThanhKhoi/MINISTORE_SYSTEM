<%-- 
    Document   : saleDashboard
    Created on : Jun 13, 2023, 2:05:28 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.sales.name}</h1>
        <form action="MainController" method="get">
            <button type="submit" name="action" value="manageSaleOrders">Orders</button>
            <input type="hidden" name="saleid" value="${sessionScope.sales.userID}"/>
        </form>
        
    </body>
</html>
