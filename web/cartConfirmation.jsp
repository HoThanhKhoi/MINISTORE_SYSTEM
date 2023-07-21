
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/cartConfirmation.css">

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
        <c:choose>
            <c:when test="${sessionScope.customer == null}">
                <jsp:forward page="login.jsp" />
            </c:when>
            <c:otherwise>
                <!--HEADER-->
                <header>
                    <c:import url="header_cart.jsp" />
                </header>

                <div class="container my-5">
                    <div class="row justify-content-between align-items-center">

                        <!-- check out -->
                        <div class="col-lg-6 checkout">
                            <div class="row">
                                <table class="table-fixed text-center">
                                    <thead>
                                        <tr>
                                            <th>Product</th>
                                            <th></th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach varStatus="counter" var="cartitem" items="${sessionScope.cart}">
                                            <c:set scope="page" var="cartKey" value="${cartitem.key}"/>
                                            <tr>
                                                <td  class="cart-item-img">                                                 
                                                    <img src="${sessionScope.imgList.get(cartKey)}" style="width: 80px;"/>
                                                </td>

                                                <td class="cart-item-title">${sessionScope.nameList.get(cartKey)}</td>

                                                <td>${cartitem.value}</td>

                                                <td class="cart-price">
                                                    <fmt:formatNumber value="${sessionScope.priceList.get(cartKey) * cartitem.value}" pattern="#,##0.00" var="formattedNumber" />
                                                    $${formattedNumber}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <div class="total mt-4">
                                <p>Total</p>
                                <fmt:formatNumber value="${sessionScope.totalMoney}" pattern="#,##0.00" var="formattedNumber" />
                                <p>$${formattedNumber}</p>
                            </div>
                        </div>



                        <!-- info -->
                        <div class="col-lg-5 info justify-content-end ">
                            <div class="info-title">
                                <h3 class="text-center">Delivery Information</h3>
                            </div>

                            <form action="MainController" method="post" class="needs-validation" novalidate>
                                <input type="hidden" name="cusID" value="${sessionScope.customer.userID}">
                                <input type="hidden" name="totalMoney" value="${sessionScope.totalMoney}">
                                <div class="mb-5 mt-2">
                                    <input type="text" id="validationCustom03" placeholder="Name" required name="cusName" value="${sessionScope.customer.name}">
                                    <div class="invalid-feedback">
                                        Please provide a valid name.
                                    </div>
                                </div>
                                <div class="mb-5 mt-3">
                                    <input type="tel" id="validationCustom03" placeholder="Phone" required name="phone" value="${sessionScope.customer.phone}">
                                    <div class="invalid-feedback">
                                        Please provide a valid phone.
                                    </div>
                                </div>
                                <div class="mb-5 mt-3">
                                    <input type="text" id="address" placeholder="Address" required name="address" value="${sessionScope.customer.address}">
                                    <div class="invalid-feedback">
                                        Please provide a valid address.
                                    </div>
                                </div>
                                <div class="mb-5 mt-2">
                                    <input type="text" id="inputField" placeholder="Postal Code" required name="postalCode" pattern="[a-zA-Z0-9]+" required> 
                                    <div class="invalid-feedback">
                                        Please provide a valid postal code.
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div style="border-bottom: 1px solid black">Payment: COD</div>
                                </div>
                                <div class="button">
                                    <button type="submit" class="btn" name="action" value="confirmCart">Checkout</button>
                                </div>
                            </form>

                            <c:if test="${requestScope.error != null}">
                                <div class="alert alert-danger alert-dismissible fade show notification" role="alert" style="padding: 15px 45px;text-align: center;width:430px;opacity: 100%;margin: 30px auto">
                                    <strong class="error">${requestScope.error}</strong> 
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="width:20px"></button>
                                </div>
                            </c:if>

                            <c:if test="${requestScope.noti != null}">
                                <div class="alert alert-success alert-dismissible fade show notification" role="alert" style="padding: 15px 45px;text-align: center;width:430px;opacity: 100%;margin: 30px auto">
                                    <strong class="success">${requestScope.noti}</strong> 
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" style="width:20px"></button>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>        
            </c:otherwise>
        </c:choose>
        <!-- FOOTER -->
        <footer>
            <c:import url="footer.jsp" />
        </footer>
        <script src="./js/validation_input.js"></script>
    </body>
</html>
