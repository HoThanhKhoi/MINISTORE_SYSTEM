<%-- 
    Document   : updateCategory
    Created on : Jun 22, 2023, 9:47:14 AM
    Author     : Asus TUF
--%>
<%@page import="dao.CategoryDAO"%>
<%@page import="dto.Category"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Category</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.manager == null}">
                <c:set var="warning" value="You need to log in as Admin to access" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <header>
                    <c:import url="header_managerDashboard.jsp"/>
                </header>
                <%
                    ArrayList<Category> catelist = CategoryDAO.getCategories();
                    ArrayList<String> imgList = CategoryDAO.getImgPath();
                    request.setAttribute("imgList", imgList);
                    request.setAttribute("categoryList", catelist);
                %>

                <form action="MainController" method="get">
                    <table>
                        <tr>
                            <th>Category ID: 
                                <input type="hidden" name="cateID" value="${param.cateid}"/>
                            </th>
                            <td>${param.cateid}</td>
                        </tr>
                        <tr>
                            <th>Category Name</th>
                            <td><input type="text" name="catename" placeholder="New category name"/></td>
                        </tr>
                        <tr>
                            <th>Image</th>
                            <td>
                                <select name="imgpath">
                                    <c:forEach var="image" items="${imgList}">
                                        <option value="${image}">${image}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <input type="submit" name="action" value="updateCategory"/>
                </form>
                <h3 style="color: red">${requestScope.error}</h3>

            </c:otherwise>
        </c:choose>

    </body>
</html>
