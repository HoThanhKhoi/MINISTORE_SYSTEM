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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- toastr -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

    </head>

    <body>

        <!-- HEADER UNLOGINED -->
        <nav class="header navbar">
            <div class="container-fluid ">
                <ul class="nav nav-2 nav-1">
                    <li class="nav-item">
                        <a href="homePage.jsp">
                            <i class="fa-solid fa-house"></i>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="MainController?action=viewCart" class="nav-link">
                            <span class="cart">
                                <i class="fa-solid fa-cart-shopping ">
                                    <!--<span class="badge rounded-pill badge-notification bg-danger">1</span>-->
                                </i>
                            </span>
                        </a>
                    </li>
                </ul>

                <ul class="nav nav-2 navbar-nav justify-content-between">
                    <li class="nav-item nav-item-txt">
                        <a href="login.jsp">
                            <span>Login</span>
                        </a>
                    </li>
<li class="nav-item nav-item-txt">
                        <a href="register.jsp">
                            <span>Register</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>  

    </body>

</html>