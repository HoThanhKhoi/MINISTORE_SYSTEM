
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
        <c:choose>
            <c:when test="${sessionScope.guard == null}">
                <c:set var="warning" value="You need to log in as Guard to access" scope="request"/>
                <jsp:forward page="login.jsp"/>
            </c:when>
            <c:otherwise>
                <!--HEADER-->
                <header>
                    <c:import url="header_guardDashboard.jsp" />
                </header>

                <c:set var="guard" value="${sessionScope.guard}"/>

                <div class="container-fluid">
                    <div class=" align-items-center">


                        <!-- dashboard -->
                        <div class="dashboard-sale cus-dashboard">
                            <div class="row align-items-center mx-5">

                                <div class="col cus-info ">
                                    <form action="">
                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">ID</label>
                                            </div>
                                            <div class="col-9">
                                                <input type="text" id="id" value="${guard.userID}" disabled="">
                                            </div>
                                        </div>

                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Name</label>
                                            </div>
                                            <div class="col-9">
                                                <input type="text" id="name" value="${guard.name}" disabled="">
                                            </div>
                                        </div>

                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Phone</label>
                                            </div>
                                            <div class="col-9">
                                                <input type="tel" id="phone" value="${guard.phone}" disabled="">
                                            </div>
                                        </div>

                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Email</label>
                                            </div>
                                            <div class="col-9">
                                                <input type="text" id="email" value="${guard.email}" disabled="">
                                            </div>
                                        </div>

                                        <div class="form-item my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Address</label>
                                            </div>
                                            <div class="col-9">
                                                <!--<input type="text" id="phone" value="" disabled="">-->
                                                <textarea class="form-control" id="" rows="2" name="" value="${guard.address}" disabled="">${guard.address}</textarea>
                                            </div>
                                        </div>
                                    </form>
                                </div>



                                <!-- update status -->
                                <div class="col cus-update">
                                    
                                        <div class="my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Role</label>
                                            </div>
                                            <div class="col-9">
                                                <input type="text" disabled placeholder="Guard">
                                            </div>
                                        </div>   

                                        <div class="order my-5 d-flex align-items-center justify-content-center">
                                            <div class="col-3">
                                                <label for="">Schedule</label>
                                            </div>
                                            <div class="col-9">
                                                <a role="button" href="viewMySchedule.jsp">Work Schedule</a>
                                            </div>
                                        </div>  

                                        
                                    
                                </div> 
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

    </body>
</html>