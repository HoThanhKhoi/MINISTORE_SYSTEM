<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ministore</title>
    <link rel="stylesheet" href="./css/login.css" />

    <!-- boostrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- font Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;800&display=swap" rel="stylesheet" />
   
</head>

<body>
    <div class="container-fluid">
        <div class="row">

            <!-- part 1 -->
            <div class="col left-side">
                <img src="./image/image 8.png" alt="" />
                <div class="overlay"></div>
                <div class="left-side-title">
                    <h1>MINISTORE</h1>
                    <p>
                        SHOP <i><u>EVERYTHING</u></i> WITH YOUR FINGERTIPS!
                    </p>
                </div>
            </div>

            <!-- part 2 -->
            <div class="col right-side">
                <div class="login-container">
                    <div class="login-header">
                        <h3 class="mt-3">Login</h3>
                    </div>
                    <form action="">
                        <div class="mb-5 mt-3">
                            <input type="email" id="email" placeholder="Enter email">
                        </div>
                        <div class="mb-5">
                            <input type="password"  id="pwd" placeholder="Enter password">
                        </div>
                        <div class="form-check mb-3">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="remember"> Remember me
                            </label>
                        </div>
                        <div class="button">
                            <button type="submit" class="btn">Login</button>
                        </div>
                    </form>
                    <div class="login-footer">
                        Don't have an account? <a>Register</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>

</html>