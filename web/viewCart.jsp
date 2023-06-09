<%-- 
    Document   : viewCart
    Created on : May 31, 2023, 11:15:12 AM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <thead>
                <tr>
                    <td></td>
                    <td>Cart ID</td>
                    <td>Product ID</td>
                    <td>Product Name</td>
                    <td>Image</td>
                    <td>Price</td>
                    <td>Quantity</td>
                    <td></td>
                    <td>Total</td>
                    <td>Update</td>
                </tr>
            </thead>
            <tbody>
            <form action="MainController" method="get"> 
                <c:forEach varStatus="counter" var="cartitem" items="${sessionScope.cart}">
                    <c:set scope="page" var="cartKey" value="${cartitem.key}"/>
                    <tr>

                        <td><input type="hidden" name="cartid" value="${counter.count}"/>${counter.count}</td>
                        <td><input class="pid" type="checkbox" name="cartitem" value="${cartitem.key}"></td>
                        <td><input type="hidden" name="pid" value="${cartitem.key}"/>${cartitem.key}</td>
                        <td>${sessionScope.nameList.get(cartKey)}</td>
                        <td>${sessionScope.imgList.get(cartKey)}</td>
                        <td>${sessionScope.priceList.get(cartKey)}</td>
                        <td><input onchange="changeQuantity()" class="quantity" type="number" name="quantity" min="1" max="${product.stockQuantity}"  value="${cartitem.value}" /></td>
                            <%
                                String newQuan = request.getParameter("quantity");
                            %>
                        <td><p style=" color:#FF0000 ">${newQuan}</p></td>
                        <td>${sessionScope.priceList.get(cartKey) * cartitem.value}</td>
                        <td><a class="change" href="">Update</a></td>
                    </tr>
                </c:forEach>
                <button type="submit" name="action" value="deleteCart">Delete</button>
            </form>
        </tbody>
    </table>
    <h2>Total: ${sessionScope.cart.size()} products</h2>
    <form action="MainController" method="get">
        <label for="cars">Choose a voucher:</label>
        <select name="vid">
            <c:forEach var="voucher" items="${sessionScope.voucherList}">
                <c:if test="${voucher.discount == 5}">
                    <c:choose>
                        <c:when test="${sessionScope.subTotalMoney >= 95}">
                            <option value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:when>
                        <c:otherwise>
                            <option disabled="" value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:if test="${voucher.discount == 10}">
                    <c:choose>
                        <c:when test="${sessionScope.subTotalMoney >= 250}">
                            <option value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:when>
                        <c:otherwise>
                            <option disabled="" value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:if test="${voucher.discount == 15}">
                    <c:choose>
                        <c:when test="${sessionScope.subTotalMoney >= 450}">
                            <option value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:when>
                        <c:otherwise>
                            <option disabled="" value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:if test="${voucher.discount == 20}">
                    <c:choose>
                        <c:when test="${sessionScope.subTotalMoney >= 650}">
                            <option value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:when>
                        <c:otherwise>
                            <option disabled="" value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:if test="${voucher.discount == 25}">
                    <c:choose>
                        <c:when test="${sessionScope.subTotalMoney >= 850}">
                            <option value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:when>
                        <c:otherwise>
                            <option disabled="" value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:if test="${voucher.discount == 30}">
                    <c:choose>
                        <c:when test="${sessionScope.subTotalMoney >= 1000}">
                            <option value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:when>
                        <c:otherwise>
                            <option disabled="" value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:if test="${voucher.discount == 35}">
                    <c:choose>
                        <c:when test="${sessionScope.subTotalMoney >= 1200}">
                            <option value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:when>
                        <c:otherwise>
                            <option disabled="" value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:if test="${voucher.discount == 40}">
                    <c:choose>
                        <c:when test="${sessionScope.subTotalMoney >= 1500}">
                            <option value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:when>
                        <c:otherwise>
                            <option disabled="" value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:if test="${voucher.discount == 45}">
                    <c:choose>
                        <c:when test="${sessionScope.subTotalMoney >= 1800}">
                            <option value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:when>
                        <c:otherwise>
                            <option disabled="" value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <c:if test="${voucher.discount == 50}">
                    <c:choose>
                        <c:when test="${sessionScope.subTotalMoney >= 2000}">
                            <option value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:when>
                        <c:otherwise>
                            <option disabled="" value="${voucher.voucherID}">${voucher.voucherCode}</option>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </c:forEach>
        </select>
        <br><br>
        <button type="submit" name="action" value="applyVoucher">Apply</button>
    </form>    

    <h1>Subtotal: ${sessionScope.subTotalMoney} $</h1>
    <c:set scope="session" var="discountValue" value="0"/>
    <c:if test="${sessionScope.voucher != null}">
        <c:set scope="session" var="discountValue" value="${sessionScope.voucher.discount}"/>
    </c:if>
    <h1>Voucher: ${sessionScope.discountValue} $</h1>
    <c:set scope="session" var="cartTotal" value="${sessionScope.subTotalMoney - sessionScope.discountValue}"/>
    <h1>Total: ${sessionScope.cartTotal} $</h1>
    <a href="homePage.jsp">Add more</a>
    <a href="MainController?action=cartConfirmationPage">Confirm</a>
    <c:if test="${requestScope.error != null}">
        <div class="alert alert-danger alert-dismissible fade show notification" role="alert" style="padding: 15px 45px;text-align: center;width:430px;opacity: 100%;margin: 30px auto">
            <strong class="error">${requestScope.error}</strong> 
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="width:20px"></button>
        </div>
    </c:if>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/updateCart.js"></script>
</html>