<%-- 
    Document   : viewSales
    Created on : Jun 6, 2023, 2:02:16 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Name</td>
                    <td>Email</td>
                    <td>Phone</td>
                    <td>Status</td>
                    <td>Action</td>
                </tr>
            </thead>
            <tbody>

                <c:forEach var="sale" items="${requestScope.salesList}">
                <form action="MainController" action="post">
                    <tr>
                        <td>${sale.userID}</td>
                        <td>${sale.name}</td>
                        <td>${sale.email}</td>
                        <td>${sale.phone}</td>
                        <td>${sale.status}</td>
                    <input type="hidden" name="userid" value="${sale.userID}"/>
                    <td>
                        <button type="submit" name="action" value="viewSaleDetailsPage">Update</button>
                    </td>
                    </tr>
                </form>
            </c:forEach>

        </tbody>
    </table>
</body>
</html>
