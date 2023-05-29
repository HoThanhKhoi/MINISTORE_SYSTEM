<%-- 
    Document   : customerProfile
    Created on : May 27, 2023, 2:22:06 PM
    Author     : DELL PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./css/customerProfile.css">

    <!-- font Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;800&display=swap" rel="stylesheet" />

    <!-- boostrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body>
    <div class="container-fluid">
        <div class="row">

            <!-- left side: Menu -->
            <div class="col-3 menu">
                <div class="title text-center">My Account</div>
                <div class="sub-menu text-center">
                    <div class="item">
                        <a class="item fw-bold" href="">Overview</a>
                    </div>
                    <div class="item">
                        <a class="item" href="">Change Password</a>
                    </div>
                </div>
            </div>

            <!-- right side: User information -->
            <div class="col-8 form-container">
                <form action="">
                    <div class="form-item my-5 d-flex align-items-center justify-content-center">
                        <div class="col-1 mx-5">
                            <label for="">Name</label>
                        </div>
                        <div class="col-11">
                            <input type="name" id="name" disabled >
                        </div>
                    </div>

                    <div class="form-item my-5 d-flex align-items-center justify-content-center">
                        <div class="col-1 mx-5">
                            <label for="">Email</label>
                        </div>
                        <div class="col-11">
                            <input type="email" id="email" disabled>
                        </div>
                    </div>
                    <div class="form-item my-5 d-flex align-items-center justify-content-center">
                        <div class="col-1 mx-5">
                            <label for="">Phone</label>
                        </div>
                        <div class="col-11">
                            <input type="phone" id="phone" disabled>
                        </div>
                    </div>
                    <div class="form-item my-5 d-flex align-items-center justify-content-center">
                        <div class="col-1 mx-5">
                            <label for="">Address</label>
                        </div>
                        <div class="col-11">
                            <input type="password" id="pwd" disabled>
                        </div>
                    </div>

                    <div class="save-btn d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary mt-3 px-3 py-2 fw-bold">Edit Profile</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>