<%-- 
    Document   : viewSaleOrders
    Created on : Jun 13, 2023, 7:41:50 PM
    Author     : Admin
--%>
<%@page import="dto.Order"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.sql.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Orders-chan!</h1>
        <table>
            <tr>
                <th>Order ID</th>
                <th>phone</th>
                <th>Address</th>
                <th>Order Date</th>
                <th>Ship Date</th>
                <th>Customer ID</th>
                <th>Sale ID</th>
                <th>Status</th>
                <th>Action</th>
            </tr>

            <tbody>
                <c:forEach var="order" items="${requestScope.orderList}">
                    <c:set var="orderdate" value="${order.orderDate}"/>
                    <tr>
                        <td>${order.orderID}</td>
                        <td>${order.phone}</td>
                        <td>${order.address}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.shipDate}</td>
                        <td>${order.customerID}</td>
                        <td>${order.salesID}</td>
                        <td>${order.status}</td>
                    </tr>

                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
