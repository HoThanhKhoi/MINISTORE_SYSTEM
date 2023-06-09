<%-- 
    Document   : viewCustomers
    Created on : Jun 6, 2023, 1:19:36 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${requestScope.customersList}">
                <form action="MainController" action="post">
                    <tr>
                        <td>${customer.userID}</td>
                        <td>${customer.name}</td>
                        <td>${customer.email}</td>
                        <td>${customer.phone}</td>
                        <td>${customer.address}</td>
                        <c:choose>
                            <c:when test="${customer.status == 0}"><td>Inactive</td></c:when>
                            <c:otherwise><td>Active</td></c:otherwise>
                        </c:choose>
                    <input type="hidden" name="userid" value="${customer.userID}"/>
                    <td>
                        <button type="submit" name="action" value="viewCustomerDetailsPage">Update</button>
                    </td>
                    </tr>
                </form>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
