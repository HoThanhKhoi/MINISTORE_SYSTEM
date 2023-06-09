<%-- 
    Document   : cartConfirmation
    Created on : Jun 6, 2023, 11:32:58 PM
    Author     : ACER
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
        <c:choose>
            <c:when test="${sessionScope.customer == null}">
                <jsp:forward page="login.jsp" />
            </c:when>
            <c:otherwise>
                <!--HEADER-->
                <header>
                    <c:import url="header.jsp" />
                </header>

                <table>
                    <thead>
                        <tr>
                            <td>Products</td>
                            <td>Quantity</td>
                            <td>Price</td>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach varStatus="counter" var="cartitem" items="${sessionScope.cart}">
                            <c:set scope="page" var="cartKey" value="${cartitem.key}"/>
                            <tr>
                                <td>${sessionScope.nameList.get(cartKey)}</td>
                                <td>${cartitem.value}</td>
                                <td>${sessionScope.priceList.get(cartKey) * cartitem.value}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <h1>Total: ${sessionScope.cartTotal} $</h1>
                <h1>Delivery Information</h1>
                <form>
                    Name: <input type="text" name="name" value="${sessionScope.customer.name}" required="">
                    Phone: <input type="tel" name="phone" value="${sessionScope.customer.phone}" required="">
                    Address: <input type="text" name="address" value="${sessionScope.customer.address}" required="">
                    <input type="hidden" name="customerID" />
                    <c:if test="${sessionScope.customer.address == null}">Address must be filled in. <a href="customerProfile.jsp">Update now.</a></c:if>
                    <button>Checkout</button>
                </form>
            </c:otherwise>
        </c:choose>
    </body>
</html>
