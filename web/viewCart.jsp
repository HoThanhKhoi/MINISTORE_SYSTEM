<%-- 
    Document   : viewCart
    Created on : May 31, 2023, 11:15:12 AM
    Author     : ACER
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.VoucherDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/viewCart.css">

        <!-- Icon CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />


        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- font Inter -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">
    </head>
    <body>

        <!-- HEADER -->
        <header>
            <c:choose>
                <c:when test="${sessionScope.customer == null}">
                    <c:import url="header_unlogined.jsp" />
                </c:when>
                <c:otherwise>
                    <c:import url="header_cart.jsp" />
                </c:otherwise>
            </c:choose>
        </header>


        <!-- HEADER PATH -->
        <nav class="navbar navbar-expand-lg header-path mt-4">
            <div class="container justify-content-start ">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="MainController?action=backToHome">Home</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <a href="MainController?action=ViewCartServlet">My Cart</a>
                        </li>
                    </ol>
                </nav>
            </div>
        </nav>


        <c:choose>
            <c:when test="${sessionScope.cart == null || sessionScope.cart.isEmpty()}">
                <!-- Cart null -->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 empty-content">
                            <div class="mb-4">
                                <img src="./image/Icon_1.png" class="card-img-top" alt="" style="width: 250px;">
                            </div>
                            <div class="mb-2">
                                <h4>Hey, The cart feels light!</h4>
                            </div>
                            <div class="mb-4">
                                <p>Explore products and add your favorite items</p>
                            </div>
                            <div>
                                <a role="button" href="homePage.jsp" class="button check">Explore more
                                    <i class="fa-solid fa-angles-right"></i>   
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:when>

            <c:otherwise>
                <!-- Cart not null -->
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">

                            <c:if test="${requestScope.error != null}">
                                <div class="alert alert-danger alert-dismissible fade show notification" role="alert" style="padding: 15px 45px;text-align: center;width:430px;opacity: 100%;margin: 0 auto 20px;">
                                    <strong class="error">${requestScope.error}</strong>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="width:20px"></button>
                                </div>
                            </c:if>    

                            <div class="cart-table">
                                <div class="mainBodyCart">
                                    <table class="table-fixed">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th class="cart-img">Product</th>
                                                <th></th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        <form action="MainController" method="get"> 
                                            <c:forEach varStatus="counter" var="cartitem" items="${sessionScope.cart}">
                                                <c:set scope="page" var="cartKey" value="${cartitem.key}"/>
                                                <tr class="align-items-center">
                                                    <td>
                                                        <input type="checkbox" class="pid text-center" name="cartitem" value="${cartitem.key}">
                                                    </td>

                                                    <td class="cart-item-img">
                                                        <a href="MainController?action=viewProduct&pid=${cartitem.key}&cateID=${ProductDAO.getProductInfo(cartKey).cateID}"><img src="${sessionScope.imgList.get(cartKey)}" alt=""></a>
                                                    </td>

                                                    <td class="cart-item-title">
                                                        <h5><a href="MainController?action=viewProduct&pid=${cartitem.key}&cateID=${ProductDAO.getProductInfo(cartKey).cateID}">
                                                                ${sessionScope.nameList.get(cartKey)}
                                                            </a>
                                                        </h5>
                                                    </td>

                                                    <td class="cart-price">$${sessionScope.priceList.get(cartKey)}</td>

                                                    <td class="cart-quantity">
                                                        <div class="group-quantity d-flex justify-content-center align-items-center">
                                                            <a role="button" class="quantity-button"
                                                               onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                                <i class="fas fa-minus"></i>
                                                            </a>

                                                            <input onchange="changeQuantity()"  class="quantity fw-bold text-black" min="1" name="quantity" max="${ProductDAO.getProductInfo(cartKey).stockQuantity}"  value="${cartitem.value}" 
                                                                   type="number">

                                                            <a role="button" class="quantity-button"
                                                               onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                                <i class="fas fa-plus"></i>
                                                            </a>                                                        
                                                        </div>
                                                    </td>

                                                    <c:set var="number" value="${sessionScope.priceList.get(cartKey) * cartitem.value}"/>
                                                    <fmt:formatNumber value="${sessionScope.priceList.get(cartKey) * cartitem.value}" pattern="#,##0.00" var="formattedNumber" />
                                                    <td class="cart-total">$${formattedNumber}</td>

                                                    <td class="cart-item-btn"><a class="change button" href="MainController?action=updateCart">Update</a></td>
                                                </tr>
                                            </c:forEach>

                                            <div class="deldiv">
                                                <button class="del delbtn" type="submit" name="action" value="deleteCart">Delete</button>
                                            </div>
                                        </form>
                                        </tbody>
                                    </table>
                                </div>


                                <div class="table-footer mt-4">
                                    <div class="row mt-4 justify-content-end">
                                        <div class="voucher col-3">
                                            <form action="MainController" method="post" class="d-flex">
                                                <select class="form-select" aria-label="" name="vid">
                                                    <option selected>${VoucherDAO.getVoucher(param.vid).voucherCode}</option>
                                                    <c:forEach var="voucher" items="${sessionScope.voucherList}">
                                                        <c:choose>
                                                            <c:when test="${sessionScope.totalMoney >= voucher.limitPrice}">
                                                                <option value="${voucher.voucherID}">
                                                                    Discount $${voucher.discount} (Buy $${voucher.limitPrice} to use)
                                                                </option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option disabled="" value="${voucher.voucherID}">
                                                                    Discount $${voucher.discount} (Buy $${voucher.limitPrice} to use)
                                                                </option>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                                <button class="button apply mx-2" type="submit" type="submit" name="action" value="applyVoucher">Apply</button>
                                            </form>
                                        </div>

                                        <div class="total col-2 d-flex justify-content-center">
                                            <c:if test="${requestScope.voucher != null}">
                                                <c:set scope="session" var="voucher" value="${requestScope.voucher}"/>
                                                <c:set scope="session" var="totalMoney" value="${sessionScope.totalMoney - requestScope.voucher.discount}"/>
                                            </c:if>
                                            <p>Total</p>
                                            <c:set scope="session" var="discountValue" value="0"/>
                                            <fmt:formatNumber value="${sessionScope.totalMoney}" pattern="#,##0.00" var="formattedNumber" />
                                            <p> $${formattedNumber}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-3 mb-5">
                        <div class="col-lg-12 d-flex justify-content-end">
                            <a href="MainController?action=cartConfirmationPage" class="button check">Next</a>
                        </div>
                    </div>



                </div>
            </c:otherwise>
        </c:choose>
        <!-- FOOTER -->
        <footer>
            <c:import url="footer.jsp" />
        </footer>
    </body>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/updateCart.js"></script>
</html>