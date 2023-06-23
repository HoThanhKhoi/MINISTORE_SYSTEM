<%-- 
    Document   : index
    Created on : May 25, 2023, 9:51:13 PM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <c:forEach var="cate" items="${CategoryDAO.getCategories()}">
        <div>${cate.cateID}</div>
    </c:forEach>

</body>
</html>
