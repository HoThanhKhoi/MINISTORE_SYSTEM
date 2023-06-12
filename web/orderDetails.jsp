
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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


        <!--HEADER-->
        <header>
            <c:import url="header_cart.jsp" />
        </header>

        <!-- HEADER PATH -->
        <nav class="navbar navbar-expand-lg ">
            <div class="container justify-content-start ">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="homePage.jsp">Home</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a href="#">Orders</a>
                        </li>
                        <li class="breadcrumb-item active">
                            <a href="#">Order Details</a>
                        </li>
                    </ol>
                </nav>
            </div>
        </nav>

        <div class="container">
            <div class="row justify-content-between">

                <!-- info -->
                <div class="col-lg-5 order-info">
                    <form action="">
                        <div class="form-item my-4 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Name</label>
                            </div>
                            <div class="col-9">
                                <input type="text" id="name" disabled="">
                            </div>
                        </div>

                        <div class="form-item my-4 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Order Date</label>
                            </div>
                            <div class="col-9">
                                <input type="datetime" id="orderDate" disabled="">
                            </div>
                        </div>

                        <div class="form-item my-4 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Ship Date</label>
                            </div>
                            <div class="col-9">
                                <input type="datetime" id="shipDate" disabled="">
                            </div>
                        </div>

                        <div class="form-item my-4 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Phone</label>
                            </div>
                            <div class="col-9">
                                <input type="tel" id="phone" disabled="">
                            </div>
                        </div>

                        <div class="form-item my-4 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Address</label>
                            </div>
                            <div class="col-9">
                                <input type="text" id="address" disabled="">
                            </div>
                        </div>

                        <div class="form-item my-4 d-flex align-items-center justify-content-center">
                            <div class="col-3">
                                <label for="">Voucher</label>
                            </div>
                            <div class="col-9">
                                <input type="text" id="voucher" disabled="">
                            </div>
                        </div>

                        <div class="  status-orderDetail d-flex justify-content-between mt-5">
                            <div>Status</div>
                            <div>Processing</div>
                        </div>
                    </form>
                </div>


                <!-- check out -->
                <div class="col-lg-6 checkout">
                    <div class="row">
                        <table class="table-fixed text-center">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td>Tomato</td>
                                    <td>1</td>
                                    <td>$55</td>
                                </tr>

                                <tr>
                                    <td>Tomato</td>
                                    <td>1</td>
                                    <td>$55</td>
                                </tr>

                                <tr>
                                    <td>Tomato</td>
                                    <td>1</td>
                                    <td>$55</td>
                                </tr>

                                <tr>
                                    <td>Tomato</td>
                                    <td>1</td>
                                    <td>$55</td>
                                </tr>

                                <tr>
                                    <td>Tomato</td>
                                    <td>1</td>
                                    <td>$55</td>
                                </tr>

                                <tr>
                                    <td>Tomato</td>
                                    <td>1</td>
                                    <td>$55</td>
                                </tr>

                                <tr>
                                    <td>Tomato</td>
                                    <td>1</td>
                                    <td>$55</td>
                                </tr>

                                <tr>
                                    <td>Tomato</td>
                                    <td>1</td>
                                    <td>$55</td>
                                </tr>

                                <tr>
                                    <td>Tomato</td>
                                    <td>1</td>
                                    <td>$55</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="total mt-4">
                        <p>Total</p>
                        <p>$10</p>
                    </div>
                </div>




            </div>
        </div>

    </body>

</html>