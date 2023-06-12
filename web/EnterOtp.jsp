<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ministore</title>

    <link rel="stylesheet" href="./css/OTP_verification.css">
    <link rel="stylesheet" href="./js/OTP_verification.js">

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
    <div class="container-fluid height-100 d-flex justify-content-center align-items-center">
        <!-- <div class="position-relative"> -->
        <<form action="ValidateOtp" method="post">
             <div class="card p-2 text-center">
                <h6 class="mb-5">Please enter the one time password to verify your account</h6>
                <div> <span>OTP is sent to email</span> <small>*******@gmail.com</small> </div>
                <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2" > <input 
                        class="m-2 text-center form-control rounded" type="text" id="first" maxlength="1" name="o1"/> <input
                        class="m-2 text-center form-control rounded" type="text" id="second" maxlength="1" name="o2"/> <input
                        class="m-2 text-center form-control rounded" type="text" id="third" maxlength="1" name="o3"/> <input
                        class="m-2 text-center form-control rounded" type="text" id="fourth" maxlength="1" name="o4"/> <input
                        class="m-2 text-center form-control rounded" type="text" id="fifth" maxlength="1" name="o5"/> <input
                        class="m-2 text-center form-control rounded" type="text" id="sixth" maxlength="1" name="o6"/> </div>
                <div class="mt-4 button"> 
                    <button class="btn px-4 validate" type="submit">Verify</button> 
                </div>
                <div class="text-center mt-5">
                    <span class="d-block mobile-text" id="countdown"></span>
                    <span class="d-block mobile-text" id="resend"></span>
                </div>
            </div>
        </form>
        <!-- </div> -->
    </div>

    <script src="./js/OTP_verification.js"></script>
</body>

</html>