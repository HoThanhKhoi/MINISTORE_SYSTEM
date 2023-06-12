<%-- 
    Document   : viewGuard
    Created on : Jun 4, 2023, 10:50:15 AM
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

                <c:forEach var="guard" items="${requestScope.guardList}">
                <form action="MainController" action="post">
                    <tr>
                        <td>${guard.userID}</td>
                        <td>${guard.name}</td>
                        <td>${guard.email}</td>
                        <td>${guard.phone}</td>
                        <td>${guard.status}</td>
                    <input type="hidden" name="userid" value="${guard.userID}"/>
                    <td>
                        <button type="submit" name="action" value="viewGuardDetailsPage">Update</button>
                    </td>
                    </tr>
                </form>
            </c:forEach>

        </tbody>
    </table>



</body>
</html>
