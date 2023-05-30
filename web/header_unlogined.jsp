<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/header.css">

    <!-- Icon CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- font Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;800&display=swap" rel="stylesheet" />

    <!-- boostrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>

    <!-- HEADER -->
    <nav class="navbar fixed-top">
        <div class="container-fluid header">
            <ul class="nav navbar-nav">
                <li class="nav-item">
                    <a href="#">
                        <i class="fa-solid fa-house"></i>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <span class="cart"><i class="fa-solid fa-cart-shopping"></i></span>
                        <span class="badge rounded-pill badge-notification bg-danger">1</span>
                    </a>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item">
                    <a href="#" class="btn-item">Login</a>
                </li>

                <li class="nav-item">
                    <a href="#" class="btn-item">Register</a>
                </li>
            </ul>
        </div>

        <!-- sub menu -->
        <div class="sub-menu">
            <div class="circle">
                <div class="half-circle">
                    <span class="angle"><i class="fa-solid fa-angle-down angle"></i></span>
                </div>
            </div>
        </div>

    </nav>




</body>

</html>