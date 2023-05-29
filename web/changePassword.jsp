
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
        <c:choose>
            <c:when test="${sessionScope.customer == null}">
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <div class="container-fluid">
                    <div class="row">

                        <!-- left side: Menu -->
                        <div class="col-3 menu">
                            <div class="title text-center">My Account</div>
                            <div class="sub-menu text-center">
                                <div class="item">
                                    <a class="item" href="">Overview</a>
                                </div>
                                <div class="item">
                                    <a class="item fw-bold" href="">Change Password</a>
                                </div>
                            </div>
                        </div>

                        <!-- right side: User information -->
                        <div class="col-8 form-container">
                            <form action="">
                                <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                    <div class="col-3 mx-5 my-3">
                                        <label for="">Current Password</label>
                                    </div>
                                    <div class="col-9">
                                        <input type="password" id="currentPwd"  placeholder="Enter current password">
                                    </div>
                                </div>

                                <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                    <div class="col-3 mx-5 my-3">
                                        <label for="">New Password</label>
                                    </div>
                                    <div class="col-9">
                                        <input type="password" id="newPwd" placeholder="Enter new password">
                                    </div>
                                </div>


                                <div class="save-btn d-flex justify-content-center">
                                    <button type="submit" class="btn btn-primary mt-3 px-3 py-2 mx-3 fw-bold">Save Changes</button>
                                    <button type="reset" class="btn btn-primary mt-3 px-3 py-2  fw-bold">Cancel</button>
                                </div>
                            </form>

                            <c:if test="${requestScope.error != null}">
                                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                    ${requestScope.error}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>

                            <c:if test="${requestScope.noti != null}">
                                <div class="alert alert-success alert-dismissible fade show" role="alert">
                                    ${requestScope.noti}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>  
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </body>

</html>