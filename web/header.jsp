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
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;300;400;500;600;700;800&display=swap"
              rel="stylesheet">

        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- toastr -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

    </head>

    <body>

        <!-- HEADER -->
        <nav class="header navbar">
            <div class="container-fluid">
                <ul class="nav nav-2 navbar-nav">
                    <li class="nav-item">
                        <a href="homePage.jsp">
                            <i class="fa-solid fa-house"></i>
                        </a>
                    </li>
                </ul>

                <ul class="nav nav-2 navbar-nav navbar-right">
                    <li class="nav-item">
                        <a href="customerProfile.jsp">
                            <span><i class="fa-solid fa-user"></i></span>
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

                    <li class="nav-item">
                        <a href="MainController?action=logout" data-bs-toggle="modal" data-bs-target="#logoutModal">
                            <span><i class="fa-solid fa-right-from-bracket"></i></span>
                        </a>
                    </li>
                </ul>


            </div>
        </nav>  

<!--        <div class="modal" id="logoutModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-mdb-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-mdb-dismiss="modal">Cancel</button>
                        <form action="MainController?" method="post">
                            <button type="submit" class="btn btn-primary" name="action" value="logout">OK</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>-->




    </body>

</html>