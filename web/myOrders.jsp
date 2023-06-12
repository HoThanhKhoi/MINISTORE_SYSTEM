
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ministore</title>
        <link rel="stylesheet" href="./css/managerScreen.css" />

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
            <c:import url="header.jsp" />
        </header>



        <div class="container-fluid">
            <div class="row">

                <!-- menu -->
                <div class="col-2 menu myOrder-menu">
                    <ul class="">
                        <li class="title text-center mb-4">
                            <h3>My Order</h3>
                        </li>

                        <li class="row text-center my-3 active">
                            <a href="" class="">Processing</a>
                        </li>


                        <li class="row text-center my-3">
                            <a href="" class="">Delivering</a>
                        </li>

                        <li class="row text-center my-3">
                            <a href="" class="">Completed</a>
                        </li>

                        <li class="row text-center my-3">
                            <a href="" class="col">Canceled</a>
                        </li>

                    </ul>
                </div>



                <!-- table -->
                <div class="col dashboard">
                    <form class="search text-center d-flex align-items-center">
                        <input type="text" placeholder="Search...">
                        <button id="search-button" type="button" class="btn">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>


                    <table class="table table-order mt-5 text-center">
                        <thead>
                            <tr>
                                <th class="text-center" scope="col">ID</th>
                                <th class="text-center" scope="col">Address</th>
                                <th class="text-center" scope="col">Phone</th>
                                <th class="text-center" scope="col">Status</th>
                                <th class="text-center" scope="col">Total</th>
                                <th class="text-center" scope="col">Details</th>
                            </tr>
                        </thead>

                        <tbody>
                        <form>
                            <tr>
                                <td scope="row" class="fw-bold">1</td>
                                <td>Address</td>
                                <td>00000</td>
                                <td>Processing</td>
                                <td>$5</td>
                                <td><a href="" >Order Details</a></td>
                            </tr>
                            <tr>
                                <td scope="row" class="fw-bold">1</td>
                                <td>Address</td>
                                <td>00000</td>
                                <td>Processing</td>
                                <td>$5</td>
                                <td><a href="" >Order Details</a></td>
                            </tr>
                            <tr>
                                <td scope="row" class="fw-bold">1</td>
                                <td>Address</td>
                                <td>00000</td>
                                <td>Processing</td>
                                <td>$5</td>
                                <td><a href="" >Order Details</a></td>
                            </tr>
                            <tr>
                                <td scope="row" class="fw-bold">1</td>
                                <td>Address</td>
                                <td>00000</td>
                                <td>Processing</td>
                                <td>$5</td>
                                <td><a href="" >Order Details</a></td>
                            </tr>
                            <tr>
                                <td scope="row" class="fw-bold">1</td>
                                <td>Address</td>
                                <td>00000</td>
                                <td>Processing</td>
                                <td>$5</td>
                                <td><a href="" >Order Details</a></td>
                            </tr>
                        </form>
                        </tbody>
                    </table>

                    <div class="container mt-5 dashboard-footer">
                        <div class="col-lg-12 d-flex justify-content-center">
                            <a href="homePage.jsp" class="button check align-items-center">Explore more products
                                <i class="fa-solid fa-angles-right "></i>   
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <footer><c:import url="footer.jsp"/></footer>

    </body>
</html>