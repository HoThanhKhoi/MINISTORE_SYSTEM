<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/managerDashboard.css">

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
            <c:import url="header_managerDashboard.jsp" />
        </header>

        <div class="container-fluid">
            <div class="row">

                <!--LEFT SIDE-->                    
                <div class="col-lg-6 management-item">
                    <div class="container wrapper">
                        <div class="row mb-4">
                            <div class="col item-card item-card-left">
                                <div class="item-card-title text-center mt-3 mb-4 mx-4">
                                    <h5>User Management</h5>
                                </div>
                                <div class="item-wrapper"> 
                                    <div class="item"><a href="MainController?action=viewCustomers">Customers</a></div>
                                    <div class="item"><a href="MainController?action=viewSales">Sales</a></div>
                                    <div class="item"><a href="MainController?action=viewGuards">Guards</a></div>
                                </div>
                            </div>

                            <div class="col item-card item-card-right">
                                <div class="item-card-title text-center mt-3 mb-4">
                                    <h5>Inventory Management</h5>
                                </div>
                                <div class="item-wrapper"> 
                                    <div class="item "><a href="MainController?action=viewAllCategories">Category</a></div>
                                    <div class="item "><a href="MainController?action=viewAllProducts">Product</a></div>
                                    <div class="item "><a href="MainController?action=viewVouchers">Vouchers</a></div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col item-card item-card-left mb-4">
                                <div class="item-card-title text-center mt-3 mb-4">
                                    <h5>Schedule Management</h5>
                                </div>
                                <div class="item-wrapper"> 
                                    <div class="item"><a href="MainController?action=viewSchedule">Schedule</a></div>
                                </div>
                            </div>

                            <div class="col item-card item-card-right mb-4">
                                <div class="item-card-title text-center mt-3 mb-4 mx-4">
                                    <h5>Order Management</h5>
                                </div>
                                <div class="item-wrapper"> 
                                    <div class="item"><a href="MainController?action=viewAllOrders">Order</a></div>
                                </div>
                                <div class="description my-2">Processing Orders: 50</div>  
                                <div class="description">Delivering Orders: 75</div>
                            </div>
                        </div>
                    </div>
                </div>



                <!--RIGHT SIDE-->                    
                <div class="col-lg-6">
                    <div class="container wrapper_stats">
                        <div class="circle"></div>
                        <div class="mx-3 mb-4">
                            <div class="title text-center">
                                <h4>Month to date</h4>
                                <div class="border-bt"></div>
                            </div>

                            <div class="row content">
                                <div class="col-lg-8">
                                    <div class="mb ">Unique customers</div>
                                    <div class="mb">Total orders</div>
                                    <div class="mb">Revenue</div>
                                </div>
                                <!-- <div class="col-lg"></div> -->
                                <div class="col-lg-4">
                                    <div class="mb ">7749</div>
                                    <div class="mb">7749</div>
                                    <div class="mb-5">$7749.69</div>
                                </div>
                            </div>

                            <div class="row product-stats">
                                <div class="col-lg-12 product-stats-background">
                                    <p class="product-stats-title">Products</p>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <ul>
                                                <li>Most viewed</li>
                                                <li>Best sellers</li>
                                            </ul>
                                        </div>
                                        <div class="col-lg-6">
                                            <ul class="product-stats-info">
                                                <div class="product-stats-info-item">
                                                    <li>fresh butchered leg</li>
                                                    <div class="div"></div>
                                                </div>


                                                <div class="product-stats-info-item">
                                                    <li>organic brain juice</li>
                                                    <div class="div"></div>
                                                </div>

                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>              
            </div>

        </div>


        
    </body>

</html>